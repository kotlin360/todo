<?php
namespace app\api\controller;

use app\api\model\User as UserModel;

/**
 * @project  用户接口控制器
 * @author   千叶
 * @date     2018-04-12
 */
class User extends Base
{
	/**
	 * 用户首页,获取用户基本信息
	 * @param UserModel $userModel
	 * @return \think\response\Json
	 */
	public function index(UserModel $userModel)
	{
		return json($userModel->getUserInfo($this['uid']));
	}

	/**
	 * 我的积分
	 * @param UserModel $userModel
	 * @return \think\response\Json
	 */
	public function total(UserModel $userModel)
	{
		return json($userModel->total($this['uid']));
	}
}
