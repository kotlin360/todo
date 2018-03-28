<?php
namespace app\admin\controller;

use app\admin\model\Menu as MenuModel;
use think\Db;

/**
 * @project  菜单控制器
 * @author   千叶
 * @date     2018-03-22
 */
class Menu extends Base
{

	/**
	 * index 菜单列表
	 */
	public function index(MenuModel $menuModel, $floor = 3)
	{
		$menuTree = $menuModel->getAllMenu($floor);
		if ($this->request->isAjax()) {
			$json = ['code' => 1, 'data' => $menuTree];
			return json($json);
		}
		$this->assign('menuTree', $menuTree);
		return $this->fetch();
	}

	/**
	 * 添加菜单
	 * @param MenuModel $menuModel
	 * @return \think\response\Json
	 */
	public function add(MenuModel $menuModel)
	{
		$param = input('post.');
		$json = $menuModel->insertMenu($param);
		return json($json);
	}

	/**
	 * [getMenu 根据节点数据获取对应的菜单]
	 * @author [田建龙] [864491238@qq.com]
	 */
	public function getMenu($nodeStr = '')
	{
		//超级管理员没有节点数组
		$where = empty($nodeStr) ? 'status = 1' : 'status = 1 and id in(' . $nodeStr . ')';
		$result = Db::name('auth_rule')->where($where)->select();
		$menu = prepareMenu($result);
		return $menu;
	}

	public function change_status()
	{

	}

	/**
	 * 修改菜单
	 * @param MenuModel $menuModel
	 * @return mixed|\think\response\Json
	 */
	public function edit(MenuModel $menuModel)
	{
		if ($this->request->isPost()) {
			$param = input('post.');
			$json = $menuModel->editMenu($param);
			return json($json);
		}
		$id = input('param.id', '');
		return $this->assign('menu', $menuModel->getMenuById($id))->fetch();
	}

	/**
	 * 删除菜单
	 * @param MenuModel $menuModel
	 * @return \think\response\Json
	 */
	public function del(MenuModel $menuModel)
	{
		$id = input('id', '', 'intval');
		if (!$id) {
			return json(['code' => 0, 'msg' => '删除失败，要删除的菜单不存在']);
		}
		$json = $menuModel->del($id);
		return json($json);
	}
}
