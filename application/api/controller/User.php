<?php
namespace app\api\controller;

use app\api\model\User as UserModel;
use think\Request;

/**
 * @project  用户接口控制器
 * @author   千叶
 * @date     2018-04-12
 */
class User extends Base
{

	/**
	 * 完善用户信息，此时获取到的$this['auth']中的手机号码是临时假的
	 * @param UserModel $userModel
	 * @param Request   $request
	 * @return \think\response\Json
	 */
	public function update_userinfo(UserModel $userModel, Request $request)
	{
		return json($userModel->updateUserInfo($request, $this['auth']));
	}

	/**
	 * 用户首页,获取用户基本信息
	 * @param UserModel $userModel
	 * @return \think\response\Json
	 */
	public function get_userinfo(UserModel $userModel)
	{
		return json($userModel->getUserInfo($this['auth']['uid']));
	}

	/**
	 * 用户头像上传
	 * @param UserModel $userModel
	 * @param Request   $request
	 * @return \think\response\Json
	 */
	public function avatar_upload(UserModel $userModel, Request $request)
	{
		$file = $request->file('file');
		return json($userModel->avatarUpload($this['auth']['uid'], $file));
	}
}
