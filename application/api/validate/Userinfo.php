<?php
namespace app\api\validate;

use think\Validate;

/**
 * @project  用户完善信息验证器
 * @author   千叶
 * @date     2018-04-05
 */
class Userinfo extends Validate
{

	protected $rule = [
		'username' => ['require', 'regex' => '/^1\d{10}$/'],
		'messageCode' => 'require',
	];

	protected $message = [
		'username.require' => '手机号码必填',
		'username.regex' => '手机号码格式不正确',
		'messageCode.require' => '短信验证码必填'
	];

}