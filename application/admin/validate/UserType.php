<?php
namespace app\admin\validate;

use think\Validate;

class UserType extends Validate
{
	protected $rule = [
		'title' => 'require|unique:auth_group'
	];

	protected $message = [
		'title.require' => '创建失败，角色名称不能为空',
		'title.unique' => '创建失败，该角色已经存在'
	];

}