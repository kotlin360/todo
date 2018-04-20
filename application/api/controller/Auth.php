<?php
namespace app\api\controller;

use app\api\model\Message as MessageModel;
use app\api\model\User as UserModel;
use think\Request;

/**
 * @project  用户授权注册登录接口控制器
 * @author   千叶
 * @date     2018-04-20
 */
class Auth
{
	/**
	 * 用户自动认证注册
	 * @param Request   $request
	 * @param UserModel $userModel
	 * @return \think\response\Json
	 */
	public function register(Request $request, UserModel $userModel)
	{
		return json($userModel->register($request));
	}

	/**
	 * 完善用户信息发送验证码
	 * @param MessageModel $messageModel
	 * @return \think\response\Json
	 */
	public function send(MessageModel $messageModel)
	{
		$phone = input('phone');
		return json($messageModel->send($phone));
	}
}
