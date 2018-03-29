<?php
namespace app\admin\validate;

use think\Validate;

/**
 * @project  商品分类验证器
 * @author   千叶
 * @date     2018-03-27
 */
class Category extends Validate
{
	protected $rule = [
		'name' => 'require|unique:goods_category',
	];

	protected $message = [
		'name.require' => '创建失败，分类名称不能为空',
		'name.unique' => '创建失败，分类名称已经存在',
	];
}