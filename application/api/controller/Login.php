<?php
namespace app\api\controller;

use app\api\model\Message as MessageModel;
use app\api\model\User as UserModel;
use think\Request;

/**
 * @project  用户登录、注册接口控制器
 * @author   千叶
 * @date     2018-04-12
 */
class Login
{
	/**
	 * 用户注册
	 * @param Request   $request
	 * @param UserModel $userModel
	 * @return \think\response\Json
	 */
	public function register(Request $request, UserModel $userModel)
	{
		return json($userModel->register($request));
	}

	/**
	 * 用户登录
	 * @param UserModel $userModel
	 * @return \think\response\Json
	 */
	public function login(UserModel $userModel)
	{
		$user = [
			'username' => input('username'),
			'passwd' => password_hash(input('passwd'), 1)
		];
		return json($userModel->login($user));
	}

	/**
	 * 忘记、找回密码
	 * @param UserModel $userModel
	 * @return \think\response\Json
	 */
	public function forgot(UserModel $userModel)
	{
		$data = [
			'username' => input('username', ''),
			'verifyCode' => input('verifyCode', ''),
			'passwd' => password_hash(input('passwd'), 1)
		];
		return json($userModel->forgot($data));
	}

	/**
	 * 注册发送验证码
	 * @param MessageModel $messageModel
	 * @return \think\response\Json
	 */
	public function send(MessageModel $messageModel)
	{
		$phone = input('phone');
		$type = input('type/d', 1);
		return json($messageModel->send($phone, $type));
	}
}
