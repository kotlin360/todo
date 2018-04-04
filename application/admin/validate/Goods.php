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
		'title' => 'require',
		'cate_id' => 'require',
		'sn' => 'require',
		'unit' => 'require',
		'description' => 'require',
		'imgs' => 'require',
	];

	protected $message = [
		'title.require' => '创建失败，商品名称不能为空',
		'cate_id.require' => '创建失败，商品类型不能为空',
		'sn.require' => '创建失败，商品编号不能为空',
		'unit.require' => '创建失败，单位不能为空',
		'description.require' => '创建失败，商品描述不能为空',
		'imgs.require' => '创建失败，商品图册不能为空',
	];

	// edit 验证场景定义
	public function sceneEdit()
	{
		return $this->remove('username', 'unique');
	}
}