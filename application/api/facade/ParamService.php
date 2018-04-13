<?php
namespace app\api\facade;

use think\Facade;

class ParamService extends Facade
{
	protected static function getFacadeClass()
	{
		return '\\app\\api\\service\\ParamService';
	}

}