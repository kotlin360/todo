<?php
namespace app\api\facade;

use think\Facade;

class Score extends Facade
{
	protected static function getFacadeClass()
	{
		return '\\app\\api\\model\\Score';
	}
}