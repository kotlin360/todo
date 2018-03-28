<?php
namespace app\admin\controller;

use app\admin\model\Spec as SpecModel;
use app\admin\validate\Spec as SpecValidate;
use think\facade\Config;

/**
 * @project  商品规格控制器
 * @author   千叶
 * @date     2018-03-28
 */
class Spec extends Base
{
	/**
	 * 商品规格列表展示
	 * @param SpecModel $specModel
	 * @return mixed|\think\response\Json
	 */
	public function index(SpecModel $specModel)
	{
		if ($this->request->isAjax()) {
			$cur_page = input('page', 1, 'intval');
			$keyword = input('keyword', '', 'urldecode');
			$page_size = input('limit', Config::get('page_size'), 'intval');
			$map = $keyword ? "name like '%{$keyword}%'" : '';
			$json = $specModel->getDataByWhere($map, $cur_page, $page_size);
			return json($json);
		} else {
			$page_size = Config::get('page_size');
			return $this->assign('page_size', $page_size)->fetch();
		}
	}

	/**
	 * 创建商品规格
	 * @param SpecModel    $specModel
	 * @param SpecValidate $specValidate
	 * @return mixed|\think\response\Json
	 */
	public function add(SpecModel $specModel, SpecValidate $specValidate)
	{
		if ($this->request->isAjax()) {
			$data = [
				'name' => input('name', ''),
				'note' => input('note', ''),
				'value' => input('value', ''),
				'status' => input('status', 1, 'intval'),
			];
			if (!$specValidate->check($data)) {
				return json(['code' => 0, 'msg' => $specValidate->getError()]);
			}
			$result = $specModel->createSpec($data);
			return json($result);
		}
		return $this->fetch();
	}

	/**
	 * 编辑商品规格
	 * @param SpecModel    $specModel
	 * @param SpecValidate $specValidate
	 * @return mixed|\think\response\Json
	 */
	public function edit(SpecModel $specModel, SpecValidate $specValidate)
	{
		$id = input('id', 0, 'intval');
		if ($this->request->isAjax()) {
			$data = [
				'name' => input('name', ''),
				'note' => input('note', ''),
				'value' => input('value', ''),
				'status' => input('status', 1, 'intval'),
			];
			if (!$specValidate->check($data)) {
				return json(['code' => 0, 'msg' => $specValidate->getError()]);
			}
			$result = $specModel->editSpec($id, $data);
			return json($result);
		} else {
			$spec = $specModel->getDataById($id);
			$spec === null && $this->redirect(url('system/mistake'));
			return $this->assign('spec', $spec)->fetch('spec/add');
		}
	}

	/**
	 * 修改商品规格状态（禁用或者启用）
	 * @param SpecModel $specModel
	 * @return \think\response\Json
	 */
	public function change_status(SpecModel $specModel)
	{
		$id = input('param.id', 0, 'intval');
		$status = input('param.status', 1, 'intval');
		return json($specModel->changeStatus($id, $status));
	}
}
