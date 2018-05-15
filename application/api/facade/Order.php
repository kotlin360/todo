<?php
namespace app\api\facade;

use think\Facade;

/**
 * @project  订单外观
 * @author   千叶
 * @date     2018-05-15
 */
class Order extends Facade
{
	protected static function getFacadeClass()
	{
		return '\\app\\api\\model\\Order';
	}
}