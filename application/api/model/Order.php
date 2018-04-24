<?php
namespace app\api\model;

use think\Collection;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\DbException;
use think\Model;
use think\Db;
use think\facade\Request;
use app\common\facade\Param as ParamFacade;
use app\api\facade\Score as ScoreFacade;
use app\api\facade\Money as MoneyFacade;
use app\api\facade\Coupon as CouponFacade;

/**
 * @project  订单接口模型
 * @author   千叶
 * @date     2018-04-23
 */
class Order extends Model
{

	/**
	 * 用户结算界面数据
	 * @param $uid
	 * @param $cartIdString
	 * @return array
	 */
	public function getOrderInfo($uid, $cartIdString)
	{
		try {
			// 获取积分兑换率
			$param = ParamFacade::getSystemParam();

			// 获取用户积分和现金余额
			$freight = 0;  // 默认运费
			$realCartIdString = '';
			$scoreTotal = ScoreFacade::total($uid)['total'];
			$moneyTotal = MoneyFacade::total($uid)['total'];

			// 根据前端提交的购物车id获取购物车信息
			$carts = Db::name('cart')->alias('c')
				->join('goods g', 'c.goods_id=g.id', 'LEFT')
				->join('goods_products p', 'c.spec_id=p.id', 'LEFT')
				->where("c.id in({$cartIdString}) AND c.uid={$uid}")
				->field('c.id as cart_id,c.num,c.spec_value_string,g.id as goods_id,g.status,g.title,p.id as pid,p.style,p.score,p.cash,p.stock,p.freight,p.is_online,p.is_delete')->select();

			// 对取出的订单商品进行过滤和修正
			$cartList = Collection::make($carts)->filter(function (&$cart) use (&$freight, &$realCartIdString) {
				$is_delete = $cart['is_delete'];
				unset($cart['is_delete']);
				// 过滤掉不存在的规格或者已经下线的商品
				if (in_array(0, $cart, true) || $cart['pid'] === null || $is_delete == 1) {
					return false;
				}
				// 获取图片
				$img = Db::name('goods_images')->where("goods_id={$cart['goods_id']}")->field('img')->order('id')->find();
				$cart['img'] = Request::domain() . '/uploads/' . $img['img'];
				// 获取最高运费
				$freight = $cart['freight'] > $freight ? $cart['freight'] : $freight;
				// 获取真正的cart id 用逗号拼接
				$realCartIdString .= $cart['cart_id'] . ',';
				unset($cart['is_online']);
				unset($cart['status']);
				unset($cart['freight']);
				$cart['selected'] = 0; // 前台使用
				return true;
			})->toArray();

			// 保存用户选择的购物车商品id到数据库
			$cartIdString = substr($realCartIdString, 0, -1);
			Db::name('user')->where("id={$uid}")->update(['cart' => $cartIdString]);

			// 返回数据
			return ['code' => 1, 'data' => [
				'freight' => $freight,
				'scoreTotal' => $scoreTotal,
				'moneyTotal' => $moneyTotal,
				'cash2score_rate' => $param['config_cash2score_rate'],
				'cartList' => $cartList
			]];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '结算异常：' . $e->getMessage()];
		}
	}

	/**
	 * 生成订单
	 * @param $uid
	 * @param $orderData
	 * @return array
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function buildOrder($uid, $orderData)
	{
		$cartIdString = Db::name('user')->where("id={$uid}")->value('cart');
		// 获取积分兑换率
		$param = ParamFacade::getSystemParam();

		// 获取用户提交的优惠券信息
		$coupon = CouponFacade::getValidCouponById($uid, $orderData['coupon_id']);
		if ($coupon == null) {
			return ['code' => 0, 'msg' => '订单提交失败：优惠券失效'];
		}
		// 获取用户积分和现金余额
		$freight = 0;     // 默认运费
		$scoreLimit = 0;  // 积分最高使用极限
		$cashToTal = 0;   // 购买的商品全部折算为现金
		$scoreTotal = ScoreFacade::total($uid)['total']; // 当前账户积分
		$moneyTotal = MoneyFacade::total($uid)['total']; // 当前用户钱包余额

		Db::startTrans();
		try {
			// 根据前端提交的购物车id获取购物车信息
			$carts = Db::name('cart')->alias('c')
				->join('goods g', 'c.goods_id=g.id', 'LEFT')
				->join('goods_products p', 'c.spec_id=p.id', 'LEFT')
				->where("c.id in({$cartIdString}) AND c.uid={$uid}")
				->field('c.id as cart_id,c.num,c.spec_value_string,g.id as goods_id,g.status,g.title,p.id as pid,p.style,p.score,p.cash,p.stock,p.freight,p.is_online,p.is_delete')->select();// 对取出的订单商品进行过滤和修正,构造订单商品表信息

			// 过滤掉不存在的规格或者已经下线的商品
			$goodsList = Collection::make($carts)->filter(function (&$cart) use (&$freight, &$scoreLimit, &$cashToTal, &$orderGoodsList) {
				$is_delete = $cart['is_delete'];
				unset($cart['is_delete']);
				if (in_array(0, $cart, true) || $cart['pid'] === null || $is_delete == 1) {
					return false;
				}
				// 获取最高运费
				$freight = $cart['freight'] > $freight ? $cart['freight'] : $freight;
				// 计算最高可使用积分
				if (in_array($cart['style'], [1, 3])) {
					$scoreLimit += $cart['score'];
				}
				$cashToTal += $cart['cash'];
				return true;
			});

			// 如果使用积分，判断积分是否超过了额度
			if ($orderData['use_score'] == 1) {
				if ($scoreTotal >= $scoreLimit) {
					$orderData['pay_score'] = $scoreLimit;
				} else {
					$orderData['pay_score'] = $scoreTotal;
				}
			}

			// $diff = 总共支付的额度-积分支付的额度 就是需要支付的现金（余额+微信）
			$diff = $cashToTal - $orderData['pay_score'] * $param['config_cash2score_rate'];
			if ($diff != 0) {
				// 积分不够的情况下
				// 首先$diff和优惠券的面值比较，如果$diff满足面值要求，则$diff扣除优惠券优惠
				if ($diff >= $coupon['money']) {
					$orderData['pay_coupon_value'] = $coupon['money'];
					$diff -= $coupon['value'];
				}
				if ($orderData['use_money'] == 1) {
					if ($moneyTotal >= $diff) {
						// 余额充足的情况
						$orderData['pay_money'] = $diff;
					} else {
						// 余额也不够，剩下的就是微信支付
						$orderData['pay_money'] = $moneyTotal;
						$orderData['pay_weixin'] = $diff - $moneyTotal;
					}
				}
			}

			// 写order_goods订单商品表
			$this['orderId'] = Db::name('order')->insert($orderData, false, true);
			$orderGoodsList = $goodsList->each(function ($v) {
				$list = [
					'order_id' => $this['orderId'],
					'goods_id' => $v[''],
					'goods_num' => $v[''],
					'spec_value_string' => $v[''],
					'style' => $v[''],
					'cash' => $v[''],
					'score' => $v[''],
					'freight' => $v[''],
					'gift' => $v[''],
				];
				return $list;
			});
			Db::name('order_goods')->insert($orderGoodsList);
			Db::commit();
			return ['code' => 1];
		} catch (\Exception $e) {
			Db::rollback();
			return ['code' => 0, 'msg' => '订单创建失败：' . $e->getMessage()];
		}

	}

	public function pay()
	{
		// 写用户优惠券日志表
		// 写用户积分日志表
		// 写用户钱包余额表
	}

	/**
	 * 生成订单号
	 * @return string
	 */
	public function build_order_no()
	{
		$date = date('Ymd');
		Db::startTrans();
		try {
			$sequence = Db::name('order_sequence')->lock(true)->where("update_day={$date}")->value('sequence');

			if ($sequence) {
				// 存在今天的
				++$sequence;
				Db::name('order_sequence')->where("update_day={$date}")->setInc('sequence');
			} else {
				$sequence = 1;
				Db::name('order_sequence')->insert(['sequence' => $sequence, 'update_day' => $date]);
			}

			Db::commit();
			return $date . str_pad($sequence, 6, 0, STR_PAD_LEFT);
		} catch (\Exception $e) {
			Db::rollback();
			return build_order_no();
		}
	}
}