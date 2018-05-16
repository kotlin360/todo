<?php
namespace app\api\model;

use app\api\facade\Order as OrderFacade;
use app\common\facade\Wxpay as WxpayFacade;
use think\Collection;
use think\Db;
use think\Model;
use think\facade\Env;

/**
 * @project  充值接口模型
 * @author   千叶
 * @date     2018-04-18
 */
class Recharge extends Model
{
	/**
	 * 获取充值额度和赠送优惠券的信息
	 * @return array
	 */
	public function getRechargeList()
	{
		$timestamp = $_SERVER['REQUEST_TIME'];
		try {
			$lists = Db::name('recharge')->alias('r')
				->join('td_coupon c', "r.coupon_id=c.id AND c.status=1 AND c.start < {$timestamp} AND c.end >{$timestamp}", 'LEFT')
				->where("r.status=1")->order('r.value')
				->order('r.value')
				->field('r.id,r.value,r.num,c.value as coupon_value,c.money as coupon_money')->select();
			$rechargeList = Collection::make($lists)->each(function ($list) {
				if ($list['coupon_value'] == null || $list['coupon_money'] == null) {
					$list['hasCoupon'] = 0;
					unset($list['num']);
					unset($list['coupon_value']);
					unset($list['coupon_money']);
				} else {
					$list['hasCoupon'] = 1;
				}
				return $list;
			})->toArray();
			return ['code' => 1, 'data' => $rechargeList];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '获取充值数据失败：' . $e->getMessage()];
		}
	}

	/**
	 * 充值
	 * @param $token
	 * @param $id
	 * @return array
	 */
	public function doRecharge($token, $id)
	{
		//获取充值额度
		$value = Db::name('recharge')->where("id={$id} AND status=1")->value('value');
		if (!$value) {
			return ['code' => 0, 'msg' => '充值失败：未查询到充值额度'];
		}
		// 获取订单号
		$orderNo = OrderFacade::build_order_no();

		// 此处需要调用微信支付
		return WxpayFacade::preRecharge([
			'order_no' => $orderNo,
			'pay_weixin' => $value,
			'openid' => $token['openid'],
			'id' => $id
		]);
	}

	/**
	 * 充值成功后结果通知处理
	 * @param $xml
	 */
	public function rechargeNotify($xml)
	{
		Db::startTrans();
		try {
			// 这里虽然是充值，但是和下订单一致，调用微信通知解析xml返回数据即可
			$data = WxpayFacade::billPayNotify($xml);

			if ($data !== false) {

				$money = $data['total_fee'] / 100; // 用户充值的钱

				// 构造微信支付记录数据
				$wxpayLog = [
					'order_no' => $data['out_trade_no'], //订单单号
					'cate' => 3, // 3代表用户充值
					'open_id' => $data['openid'], //付款人openID
					'total_fee' => $money, //付款金额
					'transaction_id' => $data['transaction_id'], //微信支付流水号
					'create_time' => time()
				];

				// 根据返回结果获取用户uid
				$uid = Db::name('user')->where("open_id='{$data['openid']}'")->value('id');

				// 给用户钱包增加充值额度
				Db::name('user')->where("id={$uid}")->setInc('money', $money);

				// 写入用户钱包日志
				$moneyData = ['uid' => $uid, 'value' => $money, 'note' => '用户充值', 'create_time' => $_SERVER['REQUEST_TIME']];
				Db::name('money_log')->insert($moneyData);

				$wxpayLog['uid'] = $uid;

				// 写入微信支付记录表
				Db::name('wxpay_log')->insert($wxpayLog);

				// 赠送优惠优惠券,id从充值通知附加数据中读取
				$rechargeId = $data['attach'] + 0;
				// 查询是否需要赠送优惠券
				$couponGift = Db::name('recharge')->where("id={$rechargeId}")->field('coupon_id,num')->find();
				if (is_array($couponGift) && !empty($couponGift)) {
					$coupon = Db::name('coupon')->where("id={$couponGift['coupon_id']} AND status=1")->field(true)->find();

					// 判断要赠送的优惠券是不是还有效，只需要判断status=1即可（上面的where条件中）
					if (is_array($coupon) && !empty($coupon)) {
						$couponLog = [];
						for ($i = 0; $i < $couponGift['num']; $i++) {
							$couponLog[] = [
								'coupon_id' => $coupon['id'],
								'uid' => $uid,
								'name' => $coupon['name'],
								'value' => $coupon['value'],
								'money' => $coupon['money'],
								'status' => 0,// 未使用
								'start' => $coupon['start'],
								'end' => $coupon['end'],
								'create_time' => time(),
							];
						}
						Db::name('coupon_log')->insertAll($couponLog);
					}
				}

				Db::commit();
				// 通知微信处理成功
				echo '<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>';
			} else {
				echo '<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[签名失败]]></return_msg></xml>';
			}

		} catch (\Exception $e) {
			Db::rollback();
			echo '<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[商户服务器处理失败]]></return_msg></xml>';
			file_put_contents(Env::get('runtime_path') . '/log/weixin.txt', '充值失败：' . $e->getMessage() . PHP_EOL, FILE_APPEND);
		}
	}

}
