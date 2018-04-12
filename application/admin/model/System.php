<?php
namespace app\admin\model;

use think\Db;
use think\Model;

/**
 * @project  系统模型，主要用户统计数据
 * @author   千叶
 * @date     2018-04-12
 */
class System extends Model
{

	/**
	 * 网站首页统计
	 * @return array
	 */
	public function statistic()
	{
		$warnning_line = Db::name('config')->where("`key`='config_warnning_line'")->value('value', 10);
		// 待审核订单
		$checkOrderCount = Db::name('order')->where('status=5')->count();
		// 待发货订单
		$sendOrderCount = Db::name('order')->where('status=10')->count();
		// 已完成订单
		$finishOrderCount = Db::name('order')->where('status=20')->count();
		// 待处理的退货订单
		$returnedOrderCount = Db::name('order')->where('status in(25,35)')->count();
		// 商品统计
		$goodsCount = Db::name('goods')->where('status=1')->count();
		// 库存告警统计
		$warningCount = Db::name('goods_products')->where('stock', '<=', $warnning_line)->count();
		//缺货商品
		$zeroCount = Db::name('goods_products')->where('stock=0')->count();
		// 会员统计
		$userCount = Db::name('user')->where('status=1')->count();
		return [
			'checkOrderCount' => $checkOrderCount,
			'sendOrderCount' => $sendOrderCount,
			'finishOrderCount' => $finishOrderCount,
			'returnedOrderCount' => $returnedOrderCount,
			'goodsCount' => $goodsCount,
			'warningCount' => $warningCount,
			'zeroCount' => $zeroCount,
			'userCount' => $userCount,
		];
	}
}
