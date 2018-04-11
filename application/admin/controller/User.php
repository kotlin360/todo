<?php
namespace app\admin\controller;

use app\admin\model\User as UserModel;
use think\Controller;
use think\Facade\Config;

/**
 * @project  前台用户控制器
 * @author   千叶
 * @date     2018-04-03
 */
class User extends Controller
{

	/**
	 * 前台用户列表展示
	 * @param UserModel $userModel
	 * @return mixed|\think\response\Json
	 */
	public function index(UserModel $userModel)
	{
		if ($this->request->isAjax()) {
			$cur_page = input('page', 1, 'intval');
			$keyword = input('keyword', '', 'urldecode');
			$page_size = input('limit', Config::get('page_size'), 'intval');
			$map = $keyword ? "username like '%{$keyword}%'" : '';
			$json = $userModel->getDataByWhere($map, $cur_page, $page_size);
			return json($json);
		} else {
			$page_size = Config::get('page_size');
			return $this->assign('page_size', $page_size)->fetch();
		}
	}

	/**
	 * 修改前台用户状态（开启或者禁用）
	 * @param UserModel $userModel
	 * @return \think\response\Json
	 */
	public function change_status(UserModel $userModel)
	{
		$id = input('param.id', 0, 'intval');
		$status = input('param.status', 1, 'intval');
		return json($userModel->changeStatus($id, $status));
	}

	/**
	 * 获取用户详情，包括基本信息，积分信息，钱包信息，优惠券信息等
	 * @param UserModel $userModel
	 * @return \think\response\Json
	 */
	public function detail(UserModel $userModel)
	{
		$id = input('id/d', 0);
		$cate = input('cate', '');
		if ($cate) {
			$page = input('page/d');
			$userinfo = $userModel->getUserInfoMore($id, $cate, $page);
		} else {
			$userinfo = $userModel->getUserInfo($id);
		}
		return json($userinfo);
	}
}
