<?php
namespace app\admin\controller;

use app\admin\model\Ad as AdModel;
use think\facade\Config;

/**
 * @project  广告位控制器
 * @author   千叶
 * @date     2018-04-14
 */
class Ad extends Base
{
	/**
	 * 广告位列表
	 * @param AdModel $adModel
	 * @return mixed|\think\response\Json
	 */
	public function index(AdModel $adModel)
	{
		if ($this->request->isAjax()) {
			$cur_page = input('page', 1, 'intval');
			$keyword = input('keyword', '', 'urldecode');
			$page_size = input('limit', Config::get('page_size'), 'intval');
			$map = $keyword ? "name like '%{$keyword}%'" : '';
			$json = $adModel->getDataByWhere($map, $cur_page, $page_size);
			return json($json);
		} else {
			$page_size = Config::get('page_size');
			return $this->assign('page_size', $page_size)->fetch();
		}
	}

	/**
	 * 广告图片添加
	 * @param AdModel $adModel
	 * @return mixed|\think\response\Json
	 */
	public function add(AdModel $adModel)
	{
		if ($this->request->isAjax()) {
			$data = [
				'name' => input('name', ''),
				'location' => input('location/d'),
				'img' => input('img', ''),
				'sort' => input('sort/d', 1000),
				'status' => input('status/d', 1),
			];
			$result = $adModel->createAd($data);
			return json($result);
		} else {
			return $this->fetch();
		}
	}

	/**
	 * 广告图片修改
	 * @param AdModel $adModel
	 * @param         $id
	 * @return mixed|\think\response\Json
	 */
	public function edit(AdModel $adModel, $id)
	{
		if ($this->request->isAjax()) {
			$data = [
				'name' => input('name', ''),
				'location' => input('location/d'),
				'img' => input('img', ''),
				'sort' => input('sort/d', 1000),
				'status' => input('status/d', 1),
			];
			$result = $adModel->editAd($id, $data);
			return json($result);
		} else {
			$data = $adModel->getDataById($id);
			$data === null && $this->redirect(url('system/mistake'));
			return $this->assign('ad', $data)->fetch('ad/add');
		}
	}

	/**
	 * 修改状态（开启或者禁用
	 * @param AdModel $adModel
	 * @return \think\response\Json
	 */
	public function change_status(AdModel $adModel)
	{
		$id = input('param.id', 0, 'intval');
		$status = input('param.status', 1, 'intval');
		return json($adModel->changeStatus($id, $status));
	}
}
