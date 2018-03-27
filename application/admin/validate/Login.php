<?php
namespace app\admin\validate;

use think\Validate;

/**
 * @project  登录验证器
 * @author   千叶
 * @date     2018-03-27
 */
class Login extends Validate
{
	protected $rule = [
		'username' => 'require',
		'password' => 'require',
		'code' => 'require',
	];

	protected $message = [
		'username.require' => '登录失败，用户名不能为空',
		'password.require' => '登录失败，密码不能为空',
		'code.require' => '登录失败，验证码不能为空'
	];
}