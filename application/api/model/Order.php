<?php
namespace app\api\model;

use app\api\facade\Coupon as CouponFacade;
use app\api\facade\Money as MoneyFacade;
use app\api\facade\Score as ScoreFacade;
use app\api\facade\User as UserFacade;
use app\common\facade\Param as ParamFacade;
use app\common\facade\Wxpay as WxpayFacade;
use app\common\service\OpensslEncryptHelper;
use think\Collection;
use think\Db;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\DbException;
use think\facade\Config;
use think\facade\Request;
use think\Model;
use think\facade\Env;

/**
 * @project  订单接口模型
 * @author   千叶
 * @date     2018-04-23
 */
class Order extends Model
{
	/**
	 * 获取当前用户的订单
	 * @param int $uid
	 * @param int $type type默认不传全部 1待付款 10待发货 15待收货 25待退款 50已经取消
	 * @param int $page
	 * @return array
	 */
	public function getOrderList($uid, $type, $page)
	{
		$this['orderIds'] = '';
		$limit = Config::get('weixinSize');
		$this['orderStatusArray'] = Config::get('order_status');
		$start = ($page - 1) * $limit;
		// 查询订单条件
		$where = $type === 0 ? "uid={$uid}" : "uid={$uid} AND status={$type}";

		try {
			// 获取当前用户订单
			$orders = Db::name('order')->where($where)->limit($start, $limit)
				->order('create_time DESC')
				->field('id,order_no,pay_status,status')->select();

			// 处理订单
			$orderList = array_reduce($orders, function ($result, $item) {
				$item['statusString'] = $this['orderStatusArray'][$item['status']];
				$result[$item['id']] = $item;
				$this['orderIds'] .= $item['id'] . ',';
				return $result;
			}, []);

			// 根据上面的订单id获取下面的商品信息，并处理好两者的关系（将商品压入到相应的订单中）
			$this['orderIds'] = substr($this['orderIds'], 0, -1);
			if (!$this['orderIds']) {
				return ['code' => 1, 'data' => [], 'pageSize' => $limit];
			}
			$orderGoods = Db::name('order_goods')->where("order_id in ({$this['orderIds']})")
				->field('goods_id,order_id,goods_title,img,goods_num,spec_id as pid,spec_value_string,style,cash,score')->select();
			Collection::make($orderGoods)->each(function ($v) use (&$orderList) {
				$order_id = $v['order_id'];
				unset($v['order_id']);
				$v['img'] = Request::domain() . '/uploads/' . $v['img'];
				$orderList[$order_id]['goods'] = $v;
			});

			return ['code' => 1, 'data' => array_values($orderList), 'pageSize' => $limit];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '获取订单失败：' . $e->getMessage()];
		}
	}

	/**
	 * 积分兑换结算界面数据
	 * @param $data
	 * @return array
	 */
	public function getScoreOrderInfo($data)
	{
		try {
			// 获取用户昵称和电话
			$user = UserFacade::getUserNameAndPhone($data['uid']);
			// 获取积分兑换率
			$param = ParamFacade::getSystemParam();
			// 用户总积分
			$scoreTotal = ScoreFacade::total($data['uid'])['total'] + 0;
			$moneyTotal = MoneyFacade::total($data['uid'])['total'] + 0;

			// 获取商品信息
			$goodsInfo = Db::name('goods')->alias('g')
				->join('goods_products p', "g.id=p.goods_id AND p.id={$data['pid']}", 'LEFT')
				->where("g.id={$data['id']}")
				->field('g.id,g.title,p.id as pid,p.img,p.spec_value_string,p.stock,p.score,p.freight,p.style,p.gift,p.is_online,p.is_delete')->find();

			// 处理无规格的情况
			$goodsInfo['spec_value_string'] = $goodsInfo['spec_value_string'] == null ? '无规格' : $goodsInfo['spec_value_string'];
			// 判断当前商品是否有效
			if (!$goodsInfo || $goodsInfo['stock'] == 0) {
				return ['code' => 0, 'msg' => '兑换失败，暂无库存'];
			}
			if ($goodsInfo['style'] != 1) {
				return ['code' => 0, 'msg' => '兑换失败，该商品不支持积分兑换'];
			}
			if ($goodsInfo['is_online'] == 0 || $goodsInfo['is_delete'] == 1) {
				return ['code' => 0, 'msg' => '兑换失败，商品已经下架'];
			}
			$img = Db::name('goods_images')->where("goods_id={$data['id']}")->order('id')->value('img_m');
			$goodsInfo['img2'] = Request::domain() . '/uploads/' . $img;
			return ['code' => 1, 'data' => [
				'user' => $user,
				'goods' => $goodsInfo,
				'scoreTotal' => $scoreTotal,
				'moneyTotal' => $moneyTotal
			]];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '兑换失败：' . $e->getMessage()];
		}
	}

	/**
	 * 用户结算界面数据(非纯积分商品)
	 * @param $uid
	 * @param $cartIdString
	 * @return array
	 */
	public function getOrderInfo($uid, $cartIdString)
	{
		if ($cartIdString == null) {
			return ['code' => 0, 'msg' => '请选择需要结算的商品'];
		}
		try {
			$this['freight'] = 0; // 最高运费初始化
			$this['realCartIdString'] = ''; // 过滤后的购物车主键字符串
			$this['maxScore'] = 0; // 支付积分极限
			$this['maxMoney'] = 0; // 支付最高现金极限

			// 获取积分兑换率
			$param = ParamFacade::getSystemParam();

			// 获取用户积分和现金余额
			$scoreTotal = ScoreFacade::total($uid)['total'] + 0;
			$moneyTotal = MoneyFacade::total($uid)['total'] + 0;

			// 根据前端提交的购物车id获取购物车信息
			$carts = Db::name('cart')->alias('c')
				->join('goods g', 'c.goods_id=g.id', 'LEFT')
				->join('goods_products p', 'c.spec_id=p.id', 'LEFT')
				->where("c.id in({$cartIdString}) AND c.uid={$uid}")
				->field('c.id as cart_id,c.num,c.spec_value_string,g.id as goods_id,g.status,g.title,p.id as pid,p.style,p.score,p.cash,p.stock,p.freight,p.is_online,p.is_delete')->select();

			// 对取出的订单商品进行过滤和修正
			$cartList = Collection::make($carts)->filter(function (&$cart) {
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
				$this['freight'] = $cart['freight'] > $this['freight'] ? $cart['freight'] : $this['freight'];
				// 获取真正的cart id 用逗号拼接
				$this['realCartIdString'] .= $cart['cart_id'] . ',';
				// 计算商品支付的现金、积分最高额度
				if ($cart['style'] != 2) {
					$this['maxScore'] += $cart['score'] * $cart['num'];
				}
				$this['maxMoney'] += $cart['cash'] * $cart['num'];

				unset($cart['is_online']);
				unset($cart['status']);
				unset($cart['freight']);
				$cart['selected'] = 0; // 前台使用
				return true;
			})->toArray();

			// 保存用户选择的购物车商品id到数据库
			$cartIdString = substr($this['realCartIdString'], 0, -1);
			Db::name('user')->where("id={$uid}")->update(['cart' => $cartIdString]);

			// 返回数据
			return [
				'code' => 1,
				'data' => [
					'freight' => $this['freight'] + 0,
					'scoreTotal' => $scoreTotal + 0,
					'moneyTotal' => $moneyTotal + 0,
					'maxScore' => $this['maxScore'] + 0,
					'maxMoney' => $this['maxMoney'] + $this['freight'] + 0,
					'cash2score_rate' => $param['config_cash2score_rate'] + 0,
					'cartList' => $cartList
				]
			];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '结算异常：' . $e->getMessage()];
		}
	}

	/**
	 * 纯积分兑换商品生成订单
	 * @param $goods
	 * @param $orderData
	 * @param $shareTokens
	 * @return array
	 */
	public function buildScoreOrder($goods, $orderData, $shareTokens)
	{
		$result = $this->getScoreOrderInfo($goods);
		if ($result['code'] == 1) {

			$orderData['freight'] = $result['data']['goods']['freight']; // 当前商品运费
			$payTypeArray = ['积分']; // 支付方式

			$scoreTotal = $result['data']['scoreTotal'] + 0; // 当前账户积分
			$moneyTotal = $result['data']['moneyTotal'] + 0; // 当前用户钱包余额

			// 判断当前用户积分额度与当前商品的总积分
			$payScore = ($result['data']['goods']['score'] + 0) * ($goods['num'] + 0);
			if ($payScore > $scoreTotal) {
				return ['code' => 0, 'msg' => '兑换失败：当前总积分不足'];
			}

			$orderData['pay_score'] = $payScore;
			// 判断运费用余额还是微信支付
			if ($goods['use_money'] == 1) {
				$payTypeArray[] = '钱包余额';
				// 使用钱包余额
				if ($moneyTotal >= $orderData['freight']) {
					// 余额充足的情况
					$orderData['pay_money'] = $orderData['freight'];
					$orderData['pay_weixin'] = 0;
				} else {
					// 余额也不够，剩下的就是微信支付
					$payTypeArray[] = '微信支付';
					$orderData['pay_money'] = $moneyTotal;
					$orderData['pay_weixin'] = $orderData['freight'] - $moneyTotal;
				}
			} else {
				$payTypeArray[] = '微信支付';
				// 没有使用钱包余额
				$orderData['pay_money'] = 0;
				$orderData['pay_weixin'] = $orderData['freight'];
			}
			$orderData['score_gift_total'] = $result['data']['goods']['gift']; // 购买商品赠送的总积分
			$orderData['pay_style'] = implode('+', $payTypeArray);

			Db::startTrans();
			try {
				// 创建写入订单表
				$orderId = Db::name('order')->insert($orderData, false, true);
				$img = Db::name('goods_images')->where("goods_id={$goods['id']}")->order('id')->value('img_m');
				// 写入订单商品详情表
				$goodsIdArray[] = $goods['id'];
				$orderGoodsData = [
					'order_id' => $orderId,
					'img' => $img,
					'goods_id' => $goods['id'],
					'goods_title' => $result['data']['goods']['title'],
					'goods_num' => $goods['num'],
					'spec_id' => $goods['pid'],
					'spec_value_string' => $result['data']['goods']['spec_value_string'],
					'style' => $result['data']['goods']['style'],
					'score' => $result['data']['goods']['score'],
					'freight' => $result['data']['goods']['freight'],
					'gift' => $result['data']['goods']['gift']
				];
				Db::name('order_goods')->insert($orderGoodsData);

				// 生成订单后扣除用户的积分、余额以及写各种日志表
				$this->deductionUserMoneyWhenBuildOrder($orderData);

				// 扣除库存
				Db::name('goods_products')->where("id={$goods['pid']}")->setDec('stock', $goods['num']);

				// 写订单日志表
				$orderLogData = ['order_id' => $orderId, 'uid' => $orderData['uid'], 'note' => '积分兑换商品，等待付款', 'create_time' => $_SERVER['REQUEST_TIME']];
				Db::name('order_log')->insert($orderLogData);

				// 检测当前是否有分享人
				$unUsedShareToken = $this->shareGoodsBePurchased($shareTokens, $orderData['uid'], $orderId, $goodsIdArray);

				// 提交事务，相应数据
				Db::commit();
				return ['code' => 1, 'orderNo' => $orderData['order_no'], 'shareToken' => $unUsedShareToken];
			} catch (\Exception $e) {
				Db::rollback();
				return ['code' => 0, 'msg' => '兑换失败：' . $e->getMessage()];
			}
		} else {
			return ['code' => 0, 'msg' => '兑换失败，请稍后再试'];
		}
	}

	/**
	 * 生成订单(非纯积分商品)
	 * @param $orderData
	 * @param $shareTokens
	 * @return array
	 */
	public function buildOrder($orderData, $shareTokens)
	{
		$cartIdString = Db::name('user')->where("id={$orderData['uid']}")->value('cart');

		$this['realCartIdString'] = ''; // 过滤之后真正写入订单表中的购物车id
		$this['score_gift_total'] = ''; // 下订单成功后计算需要赠送多少积分
		// 获取积分兑换率
		$param = ParamFacade::getSystemParam();

		// 获取用户提交的优惠券信息
		$coupon = null; // 用户提交的优惠券信息
		if ($orderData['coupon_id'] !== 0) {
			$coupon = CouponFacade::getValidCouponById($orderData['uid'], $orderData['coupon_id']);
			if ($coupon == null) {
				return ['code' => 0, 'msg' => '订单创建失败：优惠券失效'];
			}
			// 把优惠券状态修改为已经使用
			Db::name('coupon_log')->where("id={$orderData['coupon_id']} AND uid={$orderData['uid']}")
				->update(['update_time' => $_SERVER['REQUEST_TIME'], 'status' => 1]);
		}

		// 获取用户积分和现金余额
		$this['freight'] = 0;     // 默认运费
		$this['scoreLimit'] = 0;  // 积分最高使用极限
		$this['cashLimit'] = 0;   // 购买的商品全部折算为现金
		$scoreTotal = ScoreFacade::total($orderData['uid'])['total'] + 0; // 当前账户积分
		$moneyTotal = MoneyFacade::total($orderData['uid'])['total'] + 0; // 当前用户钱包余额

		Db::startTrans();
		try {
			// 获取购物车中的商品信息
			$carts = Db::name('cart')->alias('c')
				->join('goods g', 'c.goods_id=g.id', 'LEFT')
				->join('goods_products p', 'c.spec_id=p.id', 'LEFT')
				->where("c.id in({$cartIdString}) AND c.uid={$orderData['uid']}")
				->field('c.id as cart_id,c.spec_id,c.num,c.spec_value_string,g.id as goods_id,g.status,g.title,p.id as pid,p.style,p.score,p.cash,p.stock,p.gift,p.freight,p.is_online,p.is_delete')
				->select();

			// 对取出的订单商品进行过滤和修正,过滤掉不存在的规格或者已经下线的商品
			$goodsList = Collection::make($carts)->filter(function (&$cart) {
				if ($cart['pid'] === null || $cart['stock'] == 0 || $cart['is_delete'] == 1) {
					return false;
				}
				// 获取最高运费
				$this['freight'] = $cart['freight'] > $this['freight'] ? $cart['freight'] : $this['freight'];

				// 计算最高可使用积分
				if ($cart['style'] == 3) {
					$this['scoreLimit'] += $cart['score'] * $cart['num'];
				}
				$this['cashLimit'] += $cart['cash'] * $cart['num'];
				// 获取真正的cart id 用逗号拼接
				$this['realCartIdString'] .= $cart['cart_id'] . ',';
				$this['score_gift_total'] += $cart['gift'] * $cart['num'];
				return true;
			});

			// 总金额加上运费
			$this['cashLimit'] += $this['freight'];

			// 去掉规格id最后的逗号
			$this['realCartIdString'] = substr($this['realCartIdString'], 0, -1);

			// 如果使用积分，判断积分是否超过了额度
			if ($orderData['use_score'] == 1) {
				$payTypeArray[] = '积分';
				if ($scoreTotal >= $this['scoreLimit']) {
					$orderData['pay_score'] = $this['scoreLimit'];
				} else {
					$orderData['pay_score'] = $scoreTotal;
				}
			}
			// $diff = 总共支付的额度-积分支付的额度 就是需要支付的现金（余额+微信）
			$diff = (int)$this['cashLimit'] - ($orderData['pay_score'] / $param['config_cash2score_rate']);

			if ($diff > 0) {
				// 积分不够的情况下
				// 首先$diff和优惠券的面值（如果有）比较，如果$diff满足面值要求，则$diff扣除优惠券优惠
				if ($coupon !== null) {
					// 如果优惠券存在有效
					if ($diff >= $coupon['money']) {
						$orderData['pay_coupon_value'] = $coupon['value'];
						$diff -= $coupon['value'];
					} else {
						return ['code' => 0, 'msg' => '支付现金额度低于优惠券面值'];
					}
				}
				if ($orderData['use_money'] == 1) {
					$payTypeArray[] = '钱包余额';
					// 使用钱包余额
					if ($moneyTotal >= $diff) {
						// 余额充足的情况
						$orderData['pay_money'] = $diff;
						$orderData['pay_weixin'] = 0;
					} else {
						// 余额也不够，剩下的就是微信支付
						$payTypeArray[] = '微信支付';
						$orderData['pay_money'] = $moneyTotal;
						$orderData['pay_weixin'] = $diff - $moneyTotal;
					}
				} else {
					$payTypeArray[] = '微信支付';
					// 没有使用钱包余额
					$orderData['pay_money'] = 0;
					$orderData['pay_weixin'] = $diff;
				}
			}

			// 写入订单表，生成订单
			unset($orderData['use_score']);
			unset($orderData['use_money']);
			$orderData['freight'] = $this['freight']; // 写入最高运费
			$orderData['score_gift_total'] = $this['score_gift_total']; // 购买商品赠送的总积分
			$orderData['pay_style'] = implode('+', $payTypeArray);
			$this['orderId'] = Db::name('order')->insert($orderData, false, true);

			// 写order_goods订单商品详情表
			$goodsIdArray = [];
			$orderGoodsList = $goodsList->each(function ($v) use (&$goodsIdArray) {
				// 将购买的商品的id压入到数组中
				$goodsIdArray[] = $v['goods_id'];
				// 获取此商品的图片进行保存，为订单显示图片准备
				$img = Db::name('goods_images')->where("goods_id={$v['goods_id']}")->order('id')->value('img_m');
				$list = [
					'order_id' => $this['orderId'],
					'img' => $img,
					'goods_id' => $v['goods_id'],
					'goods_title' => $v['title'],
					'goods_num' => $v['num'],
					'spec_id' => $v['pid'],
					'spec_value_string' => $v['spec_value_string'],
					'style' => $v['style'],
					'cash' => $v['cash'],
					'score' => $v['score'],
					'freight' => $v['freight'],
					'gift' => $v['gift']
				];
				// 扣除库存
				Db::name('goods_products')->where("id={$v['pid']}")->dec('stock', $v['num'])->update();
				return $list;
			})->toArray();
			Db::name('order_goods')->insertAll($orderGoodsList);

			// 订单提交成功后删除购物车中的商品
			Db::name('cart')->where("id in({$this['realCartIdString']}) AND uid={$orderData['uid']}")->delete();

			// 生成订单后扣除用户的积分、余额以及写各种日志表
			$this->deductionUserMoneyWhenBuildOrder($orderData);

			// 写订单日志表
			$orderLogData = ['order_id' => $this['orderId'], 'uid' => $orderData['uid'], 'note' => '提交订单，等待付款', 'create_time' => $_SERVER['REQUEST_TIME']];
			Db::name('order_log')->insert($orderLogData);

			// 检测当前是否有分享人
			$unUsedShareToken = $this->shareGoodsBePurchased($shareTokens, $orderData['uid'], $this['orderId'], $goodsIdArray);

			Db::commit(); // 提交事物
			return ['code' => 1, 'orderNo' => $orderData['order_no'], 'shareToken' => $unUsedShareToken];
		} catch (\Exception $e) {
			Db::rollback();
			return ['code' => 0, 'msg' => '订单创建失败：' . $e->getMessage()];
		}
	}

	/**
	 * 删除尚未支付的订单，需要回滚优惠券、积分、余额
	 * @param $uid
	 * @param $orderNo
	 * @return array
	 */
	public function delOrder($uid, $orderNo)
	{
		Db::startTrans();
		try {
			$order = Db::name('order')->where("order_no={$orderNo} AND uid={$uid}")->field(true)->find();
			if (!$order['id']) {
				return ['code' => 0, 'msg' => '删除失败：未查询到此订单'];
			}
			if ($order['status'] != 1) {
				return ['code' => 0, 'msg' => '删除失败：此订单不支持删除'];
			}

			$couponid = $order['coupon_id'];
			$payScore = $order['pay_score'];
			$payMoney = $order['pay_money'];

			// 返回优惠券
			Db::name('coupon_log')->where("id={$couponid} AND uid={$uid}")
				->update(['update_time' => 0, 'status' => 0]);

			// 返回积分写用户积分日志表
			if ($payScore != 0) {
				Db::name('user')->where("id={$uid}")->setInc('score', $payScore);
				$scoreData = ['uid' => $uid, 'value' => $payScore, 'note' => '放弃购买返回积分', 'create_time' => $_SERVER['REQUEST_TIME']];
				Db::name('score_log')->insert($scoreData);
			}

			// 返回用户钱包余额表
			if ($payMoney != 0) {
				Db::name('user')->where("id={$uid}")->setInc('money', $payMoney);
				$moneyData = ['uid' => $uid, 'value' => $payMoney, 'note' => '放弃购买返回余额', 'create_time' => $_SERVER['REQUEST_TIME']];
				Db::name('money_log')->insert($moneyData);
			}

			// 删除此订单
			Db::name('order')->where("order_no={$orderNo} AND uid={$uid}")->delete();

			Db::commit();
			return ['code' => 1];
		} catch (\Exception $e) {
			Db::rollback();
			return ['code' => 0, 'msg' => '删除失败：' . $e->getMessage()];
		}
	}

	/**
	 * 获取支付信息页面
	 * @param $uid
	 * @param $orderNo
	 * @return array
	 */
	public function getPayInfo($uid, $orderNo)
	{
		try {
			$bill = Db::name('order')->where("order_no={$orderNo} AND uid={$uid}")
				->field('id,pay_style,pay_score,pay_money,pay_weixin,pay_coupon_value,freight')->find();
			if (!$bill) {
				return ['code' => 0, 'msg' => '获取支付信息失败'];
			}
			return ['code' => 1, 'data' => $bill];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '获取支付信息失败：请稍后再试'];
		}
	}

	/**
	 * 微信统一下单，预支付动作
	 * @param $token
	 * @param $id
	 * @return array
	 */
	public function payHandle($token, $id)
	{
		try {
			$uid = $token['uid'];
			// 获取当前订单支付信息
			$bill = Db::name('order')->where("id={$id}")
				->field('id,order_no,pay_style,pay_score,pay_money,pay_weixin,score_gift_total,coupon_id,pay_coupon_value,freight')->find();

			if ($bill['pay_weixin'] != 0) {
				// 此处需要调用微信支付
				return WxpayFacade::prepay([
					'order_no' => $bill['order_no'],
					'pay_weixin' => $bill['pay_weixin'],
					'openid' => $token['openid']
				]);
			} else {
				// 此处不需要调用微信支付，直接扣除积分和余额
				return $this->payRealHandle($uid, $bill);
			}
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '预支付失败：' . $e->getMessage()];
		}
	}

	/**
	 * 生成订单后就扣除用户的积分和余额
	 * @param $orderData
	 * @throws \think\Exception
	 */
	public function deductionUserMoneyWhenBuildOrder($orderData)
	{
		$uid = $orderData['uid'];
		$payScore = $orderData['pay_score']; // 支付积分
		$payMoney = $orderData['pay_money']; // 支付余额

		// 扣除积分写用户积分日志表
		if ($payScore != 0) {
			Db::name('user')->where("id={$uid}")->setDec('score', $payScore);
			$scoreData = ['uid' => $uid, 'value' => -$payScore, 'note' => '购买商品支付', 'create_time' => $_SERVER['REQUEST_TIME']];
			Db::name('score_log')->insert($scoreData);
		}

		// 写用户钱包余额表
		if ($payMoney != 0) {
			Db::name('user')->where("id={$uid}")->setDec('money', $payMoney);
			$moneyData = ['uid' => $uid, 'value' => -$payMoney, 'note' => '购买商品支付', 'create_time' => $_SERVER['REQUEST_TIME']];
			Db::name('money_log')->insert($moneyData);
		}

	}

	/**
	 * 真正支付动作，为什么单独拿出来？因为支付的时候有可能需要调用微信支付，有可能不需要微信支付
	 * @param $uid
	 * @param $bill
	 * @param $wxpayLog 微信支付记录数组
	 * @return array
	 */
	public function payRealHandle($uid, $bill, $wxpayLog = null)
	{
		Db::startTrans();
		try {

			//$payWeixin = $bill['pay_weixin']; // 微信支付
			$score_gift_total = $bill['score_gift_total']; // 用户购买商品赠送的总积分
			$shareScoreDatas = [];

			// 赠送用户积分日志表
			if ($score_gift_total != 0) {
				Db::name('user')->where("id={$uid}")->setInc('score', $score_gift_total);
				$shareScoreDatas[] = ['uid' => $uid, 'value' => $score_gift_total, 'note' => '购买商品赠送', 'create_time' => $_SERVER['REQUEST_TIME']];
			}

			// 查询是否有分享记录，如果有需要给双方增加积分
			$shares = Db::name('share_goods_be_purchase')->where("order_id={$bill['id']}")
				->field('uid,share_uid,gift')->select();
			Collection::make($shares)->each(function ($share) {
				Db::name('user')->where("id={$share['uid']}")->setInc('score', $share['gift']);
				Db::name('user')->where("id={$share['share_uid']}")->setInc('score', $share['gift']);
				// 分享码赠送写日志
				$shareScoreDatas[] = [
					['uid' => $share['uid'], 'value' => $share['gift'], 'note' => '购买分享人商品赠送积分', 'create_time' => $_SERVER['REQUEST_TIME']],
					['uid' => $share['share_uid'], 'value' => $share['gift'], 'note' => '分享商品被购买赠送积分', 'create_time' => $_SERVER['REQUEST_TIME']]
				];
			});

			if (is_array($shareScoreDatas) && !empty($shareScoreDatas)) {
				Db::name('score_log')->insertAll($shareScoreDatas);
			}

			// 支付成功，修改订单状态
			Db::name('order')->where("id={$bill['id']}")->update([
				'pay_status' => 1,
				'status' => 5,
				'pay_time' => time()
			]);

			// 支付成功后，需要写订单日志表
			$orderData = ['uid' => $uid, 'order_id' => $bill['id'], 'note' => '支付成功，等待发货', 'create_time' => $_SERVER['REQUEST_TIME']];
			Db::name('order_log')->insert($orderData);

			// 写微信支付日志
			if ($wxpayLog !== null) {
				Db::name('wxpay_log')->insert($wxpayLog);
			}

			Db::commit();
			return ['code' => 1, 'data' => $bill];
		} catch (\Exception $e) {
			Db::rollback();
			return ['code' => 0, 'msg' => '支付失败：' . $e->getMessage()];
		}
	}

	/**
	 * 订单支付结果通知
	 * @param $xml
	 */
	public function billPayNotify($xml)
	{
		try {
			$data = WxpayFacade::billPayNotify($xml);
			if ($data !== false) {

				// 根据返回结果获取用户uid
				$uid = Db::name('user')->where("open_id='{$data['openid']}'")->value('id');

				// 获取当前订单支付信息
				$bill = Db::name('order')->where("order_no={$data['out_trade_no']}")
					->field('id,order_no,pay_style,pay_score,pay_money,pay_weixin,score_gift_total,coupon_id,pay_coupon_value,freight')->find();

				// 构造微信支付记录数据
				$wxpayLog = [
					'uid' => $uid,
					'cate' => 1,// 1代表订单支付
					'order_no' => $data['out_trade_no'], //商户订单单号
					'open_id' => $data['openid'], //付款人openID
					'total_fee' => $data['total_fee'] / 100, //付款金额
					'transaction_id' => $data['transaction_id'], //微信支付流水号
					'create_time' => time()
				];

				// 调用扣款功能
				$result = $this->payRealHandle($uid, $bill, $wxpayLog);

				if ($result['code'] == 1) {
					echo '<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>';
				} else {
					echo '<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[商户服务器处理失败]]></return_msg></xml>';
				}
			} else {
				echo '<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[签名失败]]></return_msg></xml>';
			}
		} catch (\Exception $e) {
			echo '<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[商户服务器处理失败]]></return_msg></xml>';
			file_put_contents(Env::get('runtime_path') . '/log/weixin.txt', '订单支付失败：' . $e->getMessage() . PHP_EOL, FILE_APPEND);
		}
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

	/**
	 * 确认收货
	 * @param $uid
	 * @param $id
	 * @return array
	 */
	public function comfirmReceipt($uid, $id)
	{
		Db::startTrans();
		try {
			// 更新订单状态
			$result = Db::name('order')->where("id={$id} AND status in(10,15)")->update(['status' => 20]);
			if (!$result) {
				return ['code' => 0, 'msg' => '确认失败：订单未查询到'];
			}

			// 写入订单日志
			$orderLog = ['uid' => $uid, 'order_id' => $id, 'note' => '已收货，订单完成', 'create_time' => $_SERVER['REQUEST_TIME']];
			Db::name('order_log')->insert($orderLog);

			Db::commit();
			return ['code' => 1];
		} catch (\Exception $e) {
			Db::rollback();
			return ['code' => 0, 'msg' => '收货失败：' . $e->getMessage()];
		}
	}

	/**
	 * 退货申请
	 * @param $uid
	 * @param $id
	 * @return array
	 */
	public function returnGoods($uid, $id)
	{
		Db::startTrans();
		try {
			//生成退款单号
			$refund_no = $this->build_order_no() . mt_rand(1000, 9999);

			// 更新订单状态
			$result = Db::name('order')->where("id={$id} AND status in(5,20)")->update(['status' => 25, 'refund_no' => $refund_no]);
			if (!$result) {
				return ['code' => 0, 'msg' => '退货申请失败：订单已经发货或者退货完成'];
			}

			// 写入订单日志
			$orderLog = ['uid' => $uid, 'order_id' => $id, 'note' => '客户申请退货，等待审核', 'create_time' => $_SERVER['REQUEST_TIME']];
			Db::name('order_log')->insert($orderLog);

			Db::commit();
			return ['code' => 1];
		} catch (\Exception $e) {
			Db::rollback();
			return ['code' => 0, 'msg' => '退货申请失败：' . $e->getMessage()];
		}
	}

	/**
	 * 订单处理用户的收货地址和发票信息
	 * @param $orderData
	 * @param $addressInfo
	 * @param $invoiceInfo
	 */
	public function orderAddressAndInvoiceHandle(&$orderData, $addressInfo, $invoiceInfo)
	{
		// 处理收货地址
		$orderData['accept_name'] = $addressInfo['userName'];
		$orderData['accept_phone'] = $addressInfo['telNumber'];
		$orderData['accept_address'] = $addressInfo['provinceName'] . $addressInfo['cityName'] . $addressInfo['countyName'] . $addressInfo['detailInfo'];

		// 处理发票信息
		if (empty($invoiceInfo)) {
			$orderData['is_invoice'] = 0; // 不开发票
		} else {
			$orderData['is_invoice'] = 1;
			// 前台type0标识单位，发票类型1个人  2单位
			$orderData['invoice_cate'] = $invoiceInfo['type'] === 0 ? 2 : 1;
			$orderData['invoice_title'] = $invoiceInfo['title']; // 发票抬头
			$orderData['invoice_tax_no'] = $invoiceInfo['taxNumber']; // 税号
			$orderData['invoice_address'] = $invoiceInfo['companyAddress']; // 发票单位地址
			$orderData['invoice_phone'] = $invoiceInfo['telephone']; // 发票电话
			$orderData['invoice_bank'] = $invoiceInfo['bankName']; // 发票开户行
			$orderData['invoice_bank_card'] = $invoiceInfo['bankAccount']; // 发票银行账户
		}
	}

	/**
	 * 当分享的商品被购买的时候
	 * @param $shareTokens         提交的订单中的分享码
	 * @param $uid                 当前购买人
	 * @param $orderId             当前订单id
	 * @param $goodsIdArray        当前购买的商品id数组
	 */
	public function shareGoodsBePurchased($shareTokens, $uid, $orderId, $goodsIdArray)
	{
		$usedShareTokens = [];  // 已经被使用的token数组
		$params = ParamFacade::getSystemParam(); // 系统参数
		$gift = $params['config_share_goods_after_buy_score'] ? $params['config_share_goods_after_buy_score'] : 0;

		if (is_array($shareTokens) && !empty($shareTokens)) {
			foreach ($shareTokens as $token) {
				$tokenString = OpensslEncryptHelper::decrypt($token);
				$tokenArray = explode('|', $tokenString);
				if (in_array($tokenArray[1], $goodsIdArray)) {
					$usedShareTokens[] = $token;
					$data = [
						'uid' => $uid,
						'share_uid' => $tokenArray[0],
						'order_id' => $orderId,
						'gift' => $params['config_share_goods_after_buy_score'],
						'create_time' => $_SERVER['REQUEST_TIME']
					];
					Db::name('share_goods_be_purchase')->insert($data);
				}
			}
		}

		// 返回尚未被使用规定token
		return array_diff($shareTokens, $usedShareTokens);
	}

}