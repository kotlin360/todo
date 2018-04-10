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

	/**
	 * 根据商品ID获取商品详情
	 * @param $id
	 * @return array
	 */
	public function getGoodsInfo($id)
	{
		try {
			$order = $this->alias('o')
				->join('user u', 'o.uid = u.id', 'LEFT')
				->where("o.id={$id}")
				->field('o.*,u.username,u.tel')->find();
			$goods = Db::name('order_goods')->alias('og')
				->join('goods g', 'og.goods_id=g.id', 'LEFT')
				->where("og.order_id={$id}")
				->field('og.*,g.title')->select();
			$orderLog = Db::name('order_log')->alias('ol')
				->join('user u', 'ol.uid = u.id', 'LEFT')
				->where("ol.order_id={$id}")->order('id DESC')
				->field('ol.*,u.username')->select();
			return ['code' => 1, 'order' => $order, 'goods' => $goods, 'orderLog' => $orderLog];
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
			$count = $this->where($map)->count();
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

	/**
	 * 支付类型状态获取器
	 * @param $value
	 * @return mixed
	 */
	public function getPayStyleAttr($value)
	{
		$status = [1 => '积分', 2 => '现金', 3 => '组合'];
		return $status[$value];
	}

}
