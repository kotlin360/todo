<?php
namespace app\admin\model;

use think\Db;
use think\facade\Config;
use think\facade\Session;
use think\Model;

/**
 * @project  订单模型
 * @author   千叶
 * @date     2018-04-09
 */
class Order extends Model
{

	protected $name = 'order';

	/**
	 * 根据订单ID获取订单详情
	 * @param $id
	 * @return array
	 */
	public function getOrderInfo($id)
	{
		$prefix = Config::get('database.prefix');

		try {
			// 订单信息
			$orderSQL = "SELECT o.*,u.username,u.nickname,u.tel,c.value,c.money FROM {$prefix}order o " .
				"LEFT JOIN {$prefix}coupon_log c ON o.coupon_id = c.id AND c.status=1 " .
				"LEFT JOIN {$prefix}user u ON o.uid = u.id WHERE o.id=:id LIMIT 1";
			$order = Db::query($orderSQL, ['id' => $id]);

			// 订单商品
			$goodsSQL = "SELECT og.*,g.title FROM {$prefix}order_goods og " .
				"LEFT JOIN {$prefix}goods g ON og.goods_id=g.id WHERE og.order_id=:id";
			$goods = Db::query($goodsSQL, ['id' => $id]);
			
			// 订单日志
			$orderLogSQL = "SELECT ol.*,u.username FROM {$prefix}order_log ol " .
				"LEFT JOIN {$prefix}user u ON ol.uid=u.id WHERE ol.order_id=:id ORDER BY ol.id DESC";
			$orderLog = Db::query($orderLogSQL, ['id' => $id]);
			return ['code' => 1, 'order' => $order[0], 'goods' => $goods, 'orderLog' => $orderLog];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '获取失败：' . $e->getMessage()];
		}
	}

	/**
	 * 根据条件获取订单列表
	 * @param $map
	 * @param $cur_page
	 * @param $limits
	 * @return array
	 */
	public function getDataByWhere($map, $cur_page, $limits)
	{
		try {
			$count = Db::name('order')->where($map)->count();
			$list = $this->where($map)->page($cur_page, $limits)->field(true)->order('id desc')->select();
			$json = [
				'code' => 0,
				'msg' => '',
				'count' => $count,
				'data' => $list
			];
			return $json;
		} catch (\Exception $e) {
			return ['code' => 404, 'msg' => '订单列表获取失败：' . $e->getMessage()];
		}
	}

	/**
	 * 订单发货
	 * @param $id
	 * @param $courierNumber
	 * @return array
	 */
	public function sendGoods($id, $courierNumber)
	{
		Db::startTrans();
		try {
			$this->where("id={$id}")->update(['status' => 15, 'courier_number' => $courierNumber]);
			// 写订单日志表
			$orderLogData = ['order_id' => $id, 'uid' => Session::get('auth.uid'), 'note' => '订单发货成功', 'create_time' => $_SERVER['REQUEST_TIME']];
			Db::name('order_log')->insert($orderLogData);
			Db::commit();
			return ['code' => 1, 'msg' => '订单发货成功'];
		} catch (\Exception $e) {
			Db::rollback();
			return ['code' => 0, 'msg' => '订单发货失败，请稍后再试'];
		}
	}

	/**
	 * 客户退款退货申请
	 * @param $id
	 * @param $status
	 * @param $return_remark
	 * @return array
	 */
	public function returnVerify($id, $status, $return_remark)
	{
		Db::startTrans();
		$msg = '后台退货审核，';
		$msg .= $status === 35 ? '通过' : '拒绝';
		try {
			if ($status == 35) {
				// 需要调用微信退款
			}
			$this->where("id={$id}")->update(['status' => $status, 'return_remark' => $return_remark]);
			// 写订单日志表
			$orderLogData = ['order_id' => $id, 'uid' => Session::get('auth.uid'), 'note' => $msg, 'create_time' => $_SERVER['REQUEST_TIME']];
			Db::name('order_log')->insert($orderLogData);
			Db::commit();
			return ['code' => 1, 'msg' => '订单退款审核成功'];
		} catch (\Exception $e) {
			Db::rollback();
			return ['code' => 0, 'msg' => '订单退款审核失败，请稍后再试'];
		}
	}

	/**
	 * 微信退款通知接口，微信退款成功后，需要把订单中使用的优惠券、积分等回滚操作
	 * @param $orderNo
	 */
	public function refundNotify($orderNo)
	{
		Db::startTrans();
		try {
			// 获取当前订单支付信息
			$bill = Db::name('order')->where("order_no={$orderNo}")
				->field('pay_style,pay_score,pay_money,pay_weixin,score_gift_total,coupon_id,pay_coupon_value,freight')->find();

			$couponId = $bill['coupon_id']; // 支付使用的优惠券
			$payScore = $bill['pay_score']; // 支付积分
			$payMoney = $bill['pay_money']; // 支付余额
			$payWeixin = $bill['pay_weixin']; // 微信支付
			$score_gift_total = $bill['score_gift_total']; // 用户购买商品赠送的总积分

			// 返回优惠券
			if ($couponId) {
				$couponData = ['status' => 0, 'update_time' => $_SERVER['REQUEST_TIME']];
				Db::name('coupon_log')->where("id={$couponId}")->update($couponData);
			}

			// 返回用户积分、钱包余额相应额度,需要判断
			if ($payScore != 0 || $payMoney != 0) {
				Db::name('user')->where("id={$uid}")
					->inc('score', $payScore)
					->inc('money', $payMoney)
					->dec('score', $score_gift_total)
					->update();
			}

			// 写用户积分日志表
			if ($payScore != 0) {
				$scoreData = ['uid' => $uid, 'value' => $payScore, 'note' => '商品退货积分归还', 'create_time' => $_SERVER['REQUEST_TIME']];
				Db::name('score_log')->insert($scoreData);
			}

			// 赠送写用户积分日志表
			if ($score_gift_total != 0) {
				$scoreData = ['uid' => $uid, 'value' => -$score_gift_total, 'note' => '商品退货赠送积分扣除', 'create_time' => $_SERVER['REQUEST_TIME']];
				Db::name('score_log')->insert($scoreData);
			}

			// 写用户钱包余额表
			if ($payMoney != 0) {
				$scoreData = ['uid' => $uid, 'value' => $payMoney, 'note' => '商品退货返还', 'create_time' => $_SERVER['REQUEST_TIME']];
				Db::name('money_log')->insert($scoreData);
			}

			// 需要写订单日志表
			$orderData = ['uid' => $uid, 'order_id' => $orderNo, 'note' => '商品退货退款成功', 'create_time' => $_SERVER['REQUEST_TIME']];
			Db::name('order_log')->insert($orderData);

			// 修改订单状态
			Db::name('order')->where("order_no={$orderNo}")->update(['status' => 40]);

			Db::commit();
		} catch (\Exception $e) {
			Db::rollback();
		} finally {
			// 将订单修改为退款失败，但是微信支付的钱已经退款成功
			Db::name('order')->where("order_no={$orderNo}")->update(['status' => 40]);
		}
	}

	/**
	 * 订单支付状态获取器
	 * @param $value
	 * @return mixed
	 */
	public function getPayStatusAttr($value)
	{
		$status = [
			0 => '<a class="layui-btn layui-btn-danger layui-btn-xs">未支付</a>',
			1 => '<a class="layui-btn layui-btn-xs">已支付</a>'
		];
		return $status[$value];
	}

}
