<?php
namespace app\admin\controller;

use app\admin\model\Goods as GoodsModel;
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
	 * @return mixed|\think\response\Json
	 */
	public function add(GoodsModel $goodsModel, GoodsValidate $goodsValidate)
	{
		if ($this->request->isAjax()) {
			$data = [
				'username' => input('username', '')
			];
			if (!$goodsValidate->check($data)) {
				return json(['code' => 0, 'msg' => $goodsValidate->getError()]);
			}
			$result = $goodsModel->createSystemUser($data);
			return json($result);
		} else {
			$this->assign('roles', $goodsModel->getAllSystemRoles());
			return $this->fetch();
		}
	}
}
