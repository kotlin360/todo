<?php
namespace app\admin\validate;

use think\Validate;

/**
 * @project  用户验证器
 * @author   千叶
 * @date     2018-04-05
 */
class User extends Validate
{

	protected $rule = [
		'username' => 'unique:admin',
	];

	protected $message = [
		'username.require' => '创建失败，用户已经存在',
	];

}