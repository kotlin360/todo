<?php
namespace app\admin\facade;

use think\Facade;

class UserType extends Facade
{
	protected static function getFacadeClass()
	{
		return 'app\\admin\\model\\UserType';
	}

}