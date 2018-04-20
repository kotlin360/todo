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

	/**
	 * 首页获取商品
	 * @param GoodsModel $goodsModel
	 * @param int        $location 1首页展示 2精选 3热门
	 * @return \think\response\Json
	 */
	public function get_goods(GoodsModel $goodsModel, $location = 0)
	{
		return json($goodsModel->getGoods($location));
	}

	/**
	 * 根据商品id和型号id获取商品的详情
	 * @param GoodsModel $goodsModel
	 * @return \think\response\Json
	 */
	public function detail(GoodsModel $goodsModel)
	{
		$id = input('id/d');
		$pid = input('pid/d');
		return json($goodsModel->detail($id, $pid));
	}

	/**
	 * 商品分类界面，并获取第一个分类的商品信息
	 * @param GoodsModel $goodsModel
	 * @return \think\response\Json
	 */
	public function get_category(GoodsModel $goodsModel)
	{
		return json($goodsModel->getCategory());
	}
}
