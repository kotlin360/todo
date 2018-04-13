<?php
namespace app\common\facade;

use think\Facade;

class Param extends Facade
{
	protected static function getFacadeClass()
	{
		return '\\app\\common\\service\\Param';
	}

}