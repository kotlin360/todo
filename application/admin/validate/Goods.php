<?php
namespace app\admin\validate;

use think\Validate;

/**
 * @project  商品验证器
 * @author   千叶
 * @date     2018-03-28
 */
class Goods extends Validate
{
	protected $rule = [
		'username' => 'require|unique:admin',
		'real_name' => 'require',
		'group_id' => 'require',
	];

	protected $message = [
		'username.require' => '用户创建失败，登录用户名不能为空',
		'username.unique' => '用户创建失败，登录用户名已经存在',
		'real_name.require' => '用户创建失败，真实姓名不能为空',
		'group_id.require' => '用户创建失败，角色至少选择一个'
	];

	// edit 验证场景定义
	public function sceneEdit()
	{
		return $this->remove('username', 'unique');
	}
}