<?php
namespace app\api\controller;

use app\api\model\Alidayu as AlidayuModel;
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
	public function user_register(Request $request, UserModel $userModel)
	{
		return json($userModel->register($request));
	}

	/**
	 * 用户登录
	 */
	public function user_login()
	{

	}

	/**
	 * 注册发送验证码
	 * @param AlidayuModel $alidayuModel
	 * @return \think\response\Json
	 */
	public function send(AlidayuModel $alidayuModel)
	{
		$phone = input('phone');
		return json($alidayuModel->send($phone, 1));
	}
}
