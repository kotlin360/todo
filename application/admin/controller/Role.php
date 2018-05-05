<?php
namespace app\admin\controller;

use app\admin\model\Menu as MenuModel;
use app\admin\model\UserType as UserTypeModel;
use app\admin\validate\UserType as UserTypeValidate;
use think\facade\Config;

/**
 * @project  系统用户角色控制器
 * @author   千叶
 * @date     2018-03-28
 */
class Role extends Base
{
	/**
	 * 角色列表
	 * @param UserTypeModel $userTypeModel
	 * @return mixed|\think\response\Json
	 */
	public function index(UserTypeModel $userTypeModel)
	{
		if ($this->request->isAjax()) {
			$cur_page = input('page', 1, 'intval');
			$keyword = input('keyword', '', 'urldecode');
			$page_size = input('limit', Config::get('page_size'), 'intval');
			$map = $keyword ? "title like '%{$keyword}%' " : '';
			$json = $userTypeModel->getDataByWhere($map, $cur_page, $page_size);
			return json($json);
		} else {
			$page_size = Config::get('page_size');
			return $this->assign('page_size', $page_size)->fetch();
		}
	}

	/**
	 * 创建角色
	 * @param UserTypeModel    $userTypeModel
	 * @param UserTypeValidate $userTypeValidate
	 * @param MenuModel        $menuModel
	 * @return mixed|\think\response\Json
	 */
	public function add(UserTypeModel $userTypeModel, UserTypeValidate $userTypeValidate,
	                    MenuModel $menuModel)
	{
		if ($this->request->isAjax()) {
			$rules = implode(',', input('rules/a'));
			$data = [
				'title' => input('title', ''),
				'status' => input('status', 0, 'intval'),
				'rules' => $rules
			];
			if (!$userTypeValidate->check($data)) {
				return json(['code' => 0, 'msg' => $userTypeValidate->getError()]);
			}
			return json($userTypeModel->insertRole($data));
		} else {
			// 获取系统中所有配置的菜单
			$menuTree = $menuModel->getTree();
			return $this->assign('menuTree', $menuTree)->fetch();
		}
	}

	/**
	 * 修改角色
	 * @param UserTypeModel    $userTypeModel
	 * @param UserTypeValidate $userTypeValidate
	 * @param MenuModel        $menuModel
	 * @return mixed|\think\response\Json
	 */
	public function edit(UserTypeModel $userTypeModel, UserTypeValidate $userTypeValidate,
	                     MenuModel $menuModel)
	{
		$id = input('id', 0, 'intval');
		if ($this->request->isAjax()) {
			$data = [
				'title' => input('title', ''),
				'status' => input('status', 0, 'intval'),
				'rules' => input('rules/a')
			];
			// 修改验证
			if (!$userTypeValidate->scene('edit')->check($data)) {
				return json(['code' => 0, 'msg' => $userTypeValidate->getError()]);
			}
			return json($userTypeModel->editRole($id, $data));
		} else {
			// 获取系统中所有配置的菜单
			$menuTree = $menuModel->getTree();
			$role = $userTypeModel->getRoleById($id);
			return $this->assign(['menuTree' => $menuTree, 'role' => $role])->fetch('role/add');
		}
	}

	/**
	 * 删除角色
	 * @param UserTypeModel $userTypeModel
	 * @param               $id
	 * @return \think\response\Json
	 */
	public function del(UserTypeModel $userTypeModel, $id)
	{
		return json($userTypeModel->del($id));
	}

	/**
	 * 修改角色状态（开启或者禁用）
	 * @param UserTypeModel $userTypeModel
	 * @return \think\response\Json
	 */
	public function change_status(UserTypeModel $userTypeModel)
	{
		$id = input('param.id', 0, 'intval');
		$status = input('param.status', 1, 'intval');
		return json($userTypeModel->changeStatus($id, $status));
	}
}
