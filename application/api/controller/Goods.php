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
		$page = input('page/d', 1);
		// 如果style没有收到值或者收到1的情况下获取顶部的轮播图，其他情况不获取轮播图
		$style = input('style/d', 1);
		return json($goodsModel->getGoods($location, $page, $style));
	}

	/**
	 * 获取纯积分商品，用于积分商城
	 * @param GoodsModel $goodsModel
	 * @return \think\response\Json
	 */
	public function get_score_goods_list(GoodsModel $goodsModel)
	{
		$page = input('page/d', 1);
		return json($goodsModel->getScoreGoodsList($page));
	}

	/**
	 * 根据商品id和型号id获取商品的详情
	 * @param GoodsModel $goodsModel
	 * @return \think\response\Json
	 */
	public function detail(GoodsModel $goodsModel)
	{
		$id = input('id/d', 0);
		$pid = input('pid/d', null);
		return json($goodsModel->detail($id, $pid));
	}

	/**
	 * 商品分类界面，如果没有收到id默认取第一个分类的商品信息
	 * @param GoodsModel $goodsModel
	 * @return \think\response\Json
	 */
	public function get_category(GoodsModel $goodsModel)
	{
		$cid = input('id/d', 0);
		$page = input('page/d', 1);
		return json($goodsModel->getCategory($cid, $page));
	}
}
