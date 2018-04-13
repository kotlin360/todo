<?php
namespace app\api\facade;

use think\Facade;

class Message extends Facade
{
	protected static function getFacadeClass()
	{
		return '\\app\\api\\model\\Message';
	}

}