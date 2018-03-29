<?php
namespace app\admin\controller;

use think\auth\Auth;
use think\Controller;
use think\facade\App;
use think\facade\Session;

/**
 * @project  基础控制器，主要实现用户登录检测和权限检查
 * @author   千叶
 * @date     2018-03-22
 */
class Base extends Controller
{
	public function __construct(Auth $auth)
	{
		parent::__construct();
		$this->assign('site', '深邦智能');
		$uid = Session::get('auth.uid');
		// 检测SESSION中的uid，如果没有登录跳转到登录页面
		if (!$uid) {
			$this->redirect(url('login/index'));
		}
		$fullUrl = explode(".", $this->request->url());
		$url = trim($fullUrl[0], '/');
		// 跳过超级管理员检测以及主页权限
		if (1 != $uid) {
			if (!in_array($url, ['admin/index/index', 'admin/index/main'])) {
				if (!$auth->check($url, $uid)) {
					$this->error('抱歉，您没有操作权限');
				}
			}
		}
	}

	/**
	 * 清除缓存，只是清空temp目录下
	 * @return \think\response\Json
	 */
	public function clear()
	{
		try {
			$path = App::getRuntimePath();
			$files = scandir($path);
			if ($files) {
				foreach ($files as $file) {
					if ('.' != $file && '..' != $file && is_dir($path . $file)) {
						array_map('unlink', glob($path . $file . '/*.*'));
					} elseif ('.gitignore' != $file && is_file($path . $file)) {
						unlink($path . $file);
					}
				}
			}
			return json(['code' => 1]);
		} catch (\Exception $e) {
			return json(['code' => 0, 'msg' => $e->getMessage()]);
		}

	}
}