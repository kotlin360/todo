<?php
namespace app\api\facade;

use think\Facade;

class Ad extends Facade
{
	protected static function getFacadeClass()
	{
		return '\\app\\admin\\model\\Ad';
	}
}