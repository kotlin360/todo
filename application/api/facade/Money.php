<?php
namespace app\api\facade;

use think\Facade;

class Money extends Facade
{
	protected static function getFacadeClass()
	{
		return '\\app\\api\\model\\Money';
	}
}