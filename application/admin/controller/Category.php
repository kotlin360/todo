<?php
namespace app\admin\controller;

use app\admin\model\Category as CategoryModel;
use app\admin\validate\Category as CategoryValidate;
use think\facade\Config;

/**
 * @project  商品分类控制器
 * @author   千叶
 * @date     2018-03-28
 */
class Category extends Base
{
	/**
	 * 商品分类列表
	 * @param CategoryModel $categoryModel
	 * @return mixed|\think\response\Json
	 */
	public function index(CategoryModel $categoryModel)
	{
		if ($this->request->isAjax()) {
			$cur_page = input('page', 1, 'intval');
			$keyword = input('keyword', '', 'urldecode');
			$page_size = input('limit', Config::get('page_size'), 'intval');
			$map = $keyword ? "name like '%{$keyword}%'" : '';
			$json = $categoryModel->getDataByWhere($map, $cur_page, $page_size);
			return json($json);
		} else {
			$page_size = Config::get('page_size');
			return $this->assign('page_size', $page_size)->fetch();
		}
	}

	/**
	 * 创建商品分类
	 * @param CategoryModel $categoryModel
	 * @return mixed|\think\response\Json
	 */
	public function add(CategoryModel $categoryModel, CategoryValidate $categoryValidate)
	{
		if ($this->request->isAjax()) {
			$data = [
				'name' => input('name', ''),
				'sort' => input('sort', 1000, 'intval'),
				'status' => input('status', 0, 'intval'),
			];
			if (!$categoryValidate->check($data)) {
				return json(['code' => 0, 'msg' => $categoryValidate->getError()]);
			}
			$result = $categoryModel->createCate($data);
			return json($result);
		} else {
			return $this->fetch();
		}
	}

	/**
	 * 编辑商品分类
	 * @param CategoryModel $categoryModel
	 * @return mixed|\think\response\Json
	 */
	public function edit(CategoryModel $categoryModel)
	{
		$id = input('id', 0, 'intval');
		if ($this->request->isAjax()) {
			$data = [
				'name' => input('name', ''),
				'sort' => input('sort', 1000, 'intval'),
				'status' => input('status', 0, 'intval'),
			];
			$result = $categoryModel->editCate($id, $data);
			return json($result);
		} else {
			$data = $categoryModel->getDataById($id);
			$data === null && $this->redirect(url('system/mistake'));
			return $this->assign('cate', $data)->fetch('category/add');
		}
	}

	/**
	 * 修改分类状态（开启或者禁用）
	 * @param CategoryModel $categoryModel
	 * @return \think\response\Json
	 */
	public function change_status(CategoryModel $categoryModel)
	{
		$id = input('param.id', 0, 'intval');
		$status = input('param.status', 1, 'intval');
		return json($categoryModel->changeStatus($id, $status));
	}
}
