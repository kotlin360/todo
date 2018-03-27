<?php
namespace app\common\facade;

use think\Facade;

class Log extends Facade
{
	protected static function getFacadeClass()
	{
		return 'app\\common\\model\\Log';
	}

}