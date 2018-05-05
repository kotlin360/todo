<?php
namespace app\admin\controller;

use app\admin\model\Menu as MenuModel;
use app\admin\model\System as SystemModel;
use think\Db;
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
	 * @param MenuModel $menuModel
	 * @return mixed
	 */
	public function index(MenuModel $menuModel)
	{
		$menus = $menuModel->getRoleMenu(Session::get('auth.rules'));
		$this->assign('menus', $menus);
		return $this->fetch();
	}

	/**
	 * 后台iframe首页,主要展示统计信息
	 * @param SystemModel $systemModel
	 * @return mixed
	 */
	public function main(SystemModel $systemModel)
	{
		$statistics = $systemModel->statistic();
		$server = PHP_SAPI;
		if (strpos($server, 'cgi') !== false) {
			$server = 'nginx';
		} else {
			$server = 'apache';
		}
		$base = [
			'version' => '1.0.0',
			'front' => 'layui2.2.5',
			'backend' => 'ThinkPHP' . $this->app->version(),
			'phpversion' => phpversion(),
		];
		$info = [
			'mysql' => $this->_mysql_version(),
			'environment' => $server,
			'onload' => ini_get('upload_max_filesize'),
			'timezone' => date_default_timezone_get()
		];
		$this->assign('statistics', $statistics);
		$this->assign('base', $base);
		$this->assign('info', $info);
		return $this->fetch();
	}

	/**
	 * 获取mysql版本
	 * @return mixed
	 */
	private function _mysql_version()
	{
		$version = Db::query("select version() as ver");
		return $version[0]['ver'];
	}
}
