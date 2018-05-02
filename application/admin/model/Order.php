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
	 * 根据商品ID获取商品详情
	 * @param $id
	 * @return array
	 */
	public function getGoodsInfo($id)
	{
		$prefix = Config::get('database.prefix');
		try {
			// 订单信息
			$orderSQL = "SELECT o.*,u.username,u.nickname,u.tel FROM {$prefix}order o LEFT JOIN {$prefix}user u ON o.uid = u.id WHERE o.id=:id LIMIT 1";
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
