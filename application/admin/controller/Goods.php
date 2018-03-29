<?php
namespace app\admin\controller;

use app\admin\model\Category as CategoryModel;
use app\admin\model\Goods as GoodsModel;
use app\admin\model\Spec as specModel;
use app\admin\validate\Goods as GoodsValidate;
use think\facade\Config;

/**
 * @project  商品管理控制器
 * @author   千叶
 * @date     2018-03-28
 */
class Goods extends Base
{
	/**
	 * 商品列表
	 * @return mixed
	 */
	public function index()
	{
		$page_size = Config::get('page_size');
		return $this->assign('page_size', $page_size)->fetch();
	}

	/**
	 * 新增商品
	 * @param GoodsModel    $goodsModel
	 * @param GoodsValidate $goodsValidate
	 * @param CategoryModel $categoryModel
	 * @return mixed|\think\response\Json
	 */
	public function add(GoodsModel $goodsModel, GoodsValidate $goodsValidate, CategoryModel $categoryModel)
	{
		if ($this->request->isAjax()) {
			$data = [
				'username' => input('username', '')
			];
			if (!$goodsValidate->check($data)) {
				return json(['code' => 0, 'msg' => $goodsValidate->getError()]);
			}
			$result = $goodsModel->createGoods($data);
			return json($result);
		} else {
			$cate = $categoryModel->getAllCate(); // 商品类别
			$cate === null && $this->redirect(url('system/mistake'));
			$sn = 'G' . date('Ymd') . time();
			$this->assign(['sn' => $sn, 'cate' => $cate]);
			return $this->fetch();
		}
	}

	/**
	 * 添加商品选择规格界面
	 * @return mixed
	 */
	public function spec_select(specModel $specModel)
	{
		$spec = $specModel->getAllSpec();// 商品规格
		return $this->assign('spec', $spec)->fetch();
	}
}
