<?php
namespace app\admin\validate;

use think\Validate;

/**
 * @project  优惠券验证器
 * @author   千叶
 * @date     2018-04-08
 */
class Coupon extends Validate
{
	protected $rule = [
		'name' => 'require',
		'value' => 'require|float',
		'money' => 'require|integer|gt:value',
		'start' => 'require',
		'end' => 'require|gt:start',
	];

	protected $message = [
		'name.require' => '优惠券名称不能为空',
		'value.require' => '面值不能为空',
		'money.require' => '消费金额不能为空',
		'money.gt' => '面值不能大于消费金额',
		'start.require' => '有效开始时间不能为空',
		'end.require' => '有效结束时间不能为空',
		'end.gt' => '结束时间必须大于开始时间',
	];

	// edit 验证场景定义
	public function sceneEdit()
	{
		return $this->remove('username', 'unique');
	}
}