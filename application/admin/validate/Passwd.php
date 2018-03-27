<?php
namespace app\admin\validate;

use think\Validate;

class Passwd extends Validate
{
	protected $rule = [
		'passwd_old' => 'require',
		'passwd' => 'require|min:6',
		'repasswd' => 'require|confirm:passwd'
	];

	protected $message = [
		'passwd_old.require' => '修改失败，旧密码不能为空',
		'passwd.require' => '修改失败，新密码不能为空',
		'repasswd.require' => '修改失败，确认密码不能为空',
		'repasswd.confirm' => '修改失败，两次密码不一致'
	];
}