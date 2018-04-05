<?php
namespace app\admin\validate;

use think\Validate;

/**
 * @project  角色验证器
 * @author   千叶
 * @date     2018-04-05
 */
class UserType extends Validate
{
	protected $rule = [
		'title' => 'require|unique:user_type',
		'rules' => 'require'
	];

	protected $message = [
		'title.require' => '创建失败，角色名称不能为空',
		'title.unique' => '创建失败，该角色已经存在',
		'rules.unique' => '创建失败，角色权限不能为空'
	];

	/**
	 * edit 验证场景定义
	 * @return $this
	 */
	public function sceneEdit()
	{
		return $this->remove('title', 'unique');
	}
}