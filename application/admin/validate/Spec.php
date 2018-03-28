<?php
namespace app\admin\validate;

use think\Validate;

/**
 * @project  商品规格验证器
 * @author   千叶
 * @date     2018-03-28
 */
class Spec extends Validate
{
	protected $rule = [
		'name' => 'require',
		'value' => 'require',
	];

	protected $message = [
		'name.require' => '创建失败，规格名称不能为空',
		'value.require' => '创建失败，规格值不能为空',
	];
}