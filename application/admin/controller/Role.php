<?php
namespace app\admin\controller;

use app\admin\model\UserType as UserTypeModel;
use app\admin\validate\UserType as UserTypeValidate;
use think\Db;
use think\facade\Config;

class Role extends Base
{

	/**
	 * 角色列表 或者异步加载角色数据
	 * @param UserTypeModel $userTypeModel
	 * @return mixed|\think\response\Json
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function index(UserTypeModel $userTypeModel)
	{
		if ($this->request->isAjax()) {
			$keyword = input('keyword', '', 'urldecode');
			$map = [];
			if ($keyword && $keyword !== '') {
				$map['title'] = ['title', 'like', '%' . $keyword . '%'];
			}
			$cur_page = input('page', 1, 'intval');
			$page_size = input('limit', Config::get('page_size'), 'intval');
			$roleList = $userTypeModel->getRoleByWhere($map, $cur_page, $page_size);
			$count = Db::name('auth_group')->where($map)->count();
			$json = [
				'code' => 0,
				'msg' => '',
				'count' => $count,
				'data' => $roleList,
				'curPage' => $cur_page
			];
			return json($json);
		} else {
			$page_size = Config::get('page_size');
			return $this->assign('page_size', $page_size)->fetch();
		}
	}

	/**
	 * 创建角色
	 * @param UseTypeModel     $userTypeModel
	 * @param userTypeValidate $userTypeValidate
	 * @return \think\response\Json
	 */
	public function create(UseTypeModel $userTypeModel, UserTypeValidate $userTypeValidate)
	{
		$data = [
			'title' => input('title', ''),
			'status' => input('status', 0, 'intval')
		];
		if (!$userTypeValidate->check($data)) {
			return json(['code' => 0, 'msg' => $userTypeValidate->getError()]);
		}
		$json = $userTypeModel->insertRole($data);
		return json($json);
	}
}
