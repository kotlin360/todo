<?php
namespace app\api\controller;

use app\api\model\Goods as GoodsModel;

/**
 * @project  商品接口控制器
 * @author   千叶
 * @date     2018-04-16
 */
class Goods
{
	/**
	 * 首页搜索商品
	 * @param GoodsModel $goodsModel
	 * @return \think\response\Json
	 */
	public function search(GoodsModel $goodsModel)
	{
		$key = input('key', '');
		return json($goodsModel->search($key));
	}

	/**首页获取商品
	 * @param GoodsModel $goodsModel
	 * @param int        $location 1首页展示 2精选 3热门
	 * @return \think\response\Json
	 */
	public function get_goods(GoodsModel $goodsModel, $location = 1)
	{
		return json($goodsModel->getGoods($location));
	}
}
