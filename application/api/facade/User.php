<?php
namespace app\api\facade;

use think\Facade;

class User extends Facade
{
	protected static function getFacadeClass()
	{
		return '\\app\\api\\model\\User';
	}
}