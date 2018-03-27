<?php
namespace app\admin\controller;

use app\admin\model\Menu as MemuModel;
use think\facade\Config;
use think\facade\Session;

/**
 * @project  后台首页控制器
 * @author   千叶
 * @date     2018-03-22
 */
class Index extends Base
{
	/**
	 * 后台首页
	 * @return mixed
	 */
	public function index(MemuModel $menuModel)
	{
		$menus = $menuModel->getRoleMenu(Session::get('auth.rule'));
		$this->assign('menus', $menus);
		return $this->fetch();
	}

	/**
	 * 后台iframe首页
	 * @return mixed
	 */
	public function main()
	{
		$info = [
			'web_server' => $_SERVER['SERVER_SOFTWARE'],
			'onload' => ini_get('upload_max_filesize'),
			'think_v' => Config::get('THINK_VERSION'),
			'phpversion' => phpversion(),
		];
		$this->assign('info', $info);
		return $this->fetch();
	}
}
