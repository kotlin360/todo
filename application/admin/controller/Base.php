<?php
namespace app\admin\controller;

use app\common\facade\Param as ParamFacade;
use app\common\service\OpensslEncryptHelper;
use think\auth\Auth;
use think\Controller;
use think\Db;
use think\facade\App;
use think\facade\Cookie;
use think\facade\Session;
use app\admin\model\Admin as AdminModel;

/**
 * @project  基础控制器，主要实现用户登录检测和权限检查
 * @author   千叶
 * @date     2018-03-22
 */
class Base extends Controller
{

	/**
	 * 自动运行方法，检测自动登录和权限
	 * Base constructor.
	 * @param Auth       $auth
	 * @param AdminModel $adminModel
	 */
	public function __construct(Auth $auth, AdminModel $adminModel)
	{
		parent::__construct();
		$config = ParamFacade::getSystemParam();
		$this->assign('site', $config['config_site_name']);
		$uid = Session::get('auth.uid');
		$cookieAuto = Cookie::get('auto');

		// COOKIE自动登录
		if (!$uid && Cookie::get('auto')) {
			$cookieValue = OpensslEncryptHelper::decrypt($cookieAuto);
			$adminModel->autoLoginUseCookie($cookieValue);
		}

		// 检测SESSION中的uid，如果没有登录跳转到登录页面
		if (!Session::get('auth.uid')) {
			$this->redirect(url('login/index'));
		}
		$fullUrl = explode(".", $this->request->url());
		$url = trim($fullUrl[0], '/');
		// 跳过超级管理员检测以及主页权限
		if (1 != $uid) {
			if (!in_array($url, ['admin/index/index', 'admin/index/main'])) {
				if (!$this->check($url)) {
					if ($this->request->isAjax()) {
						return json(['code' => 0, 'msg' => '抱歉，您没有操作权限']);
					} else {
						$this->error('抱歉，您没有操作权限');
					}
				}
			}
		}
	}

	/**
	 * 实时检测当前用户权限
	 * @param $url
	 * @return bool
	 */
	private function check($url)
	{
		$auth_list_array = explode(',', Session::get('auth.rules'));

		$id = Db::name('auth_rule')->where("name='{$url}'")->value('id');

		if ($id && in_array($id, $auth_list_array)) {
			return true;
		}
		return false;
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