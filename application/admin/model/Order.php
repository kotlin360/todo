<?php
namespace app\admin\model;

use think\Db;
use think\facade\Config;
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
			$list = Db::name('order')->where($map)->page($cur_page, $limits)->field(true)->order('id desc')->select();
			$orderList = array_map(function ($item) {
				$item['statusFlag'] = $item['status'];
				return $item;
			}, $list);
			$json = [
				'code' => 0,
				'msg' => '',
				'count' => $count,
				'data' => $orderList
			];
			return $json;
		} catch (\Exception $e) {
			return ['code' => 404, 'msg' => '订单列表获取失败：' . $e->getMessage()];
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

	/**
	 * 订单状态获取器
	 * @param $value
	 * @return mixed
	 */
	public function getStatusAttr($value)
	{
		$status = Config::get('order_status');
		return $status[$value];
	}

}
