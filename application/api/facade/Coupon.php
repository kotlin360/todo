<?php
namespace app\api\facade;

use think\Facade;

class Coupon extends Facade
{
	protected static function getFacadeClass()
	{
		return '\\app\\api\\model\\Coupon';
	}
}