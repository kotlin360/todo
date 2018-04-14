<?php
namespace app\api\controller;

use app\admin\model\Goods as GoodsModel;

/**
 * @project  首页接口
 * @author   千叶
 * @date     2018-04-14
 */
class Index
{
	/**
	 * 获取首页商品接口
	 * @param GoodsModel $goodsModel
	 * @return \think\response\Json
	 */
	public function index(GoodsModel $goodsModel)
	{
		return json($goodsModel->getIndexGoods());
	}

	public function search()
	{

	}
}
