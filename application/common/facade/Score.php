<?php
namespace app\common\facade;

use think\Facade;

/**
 * @project  积分外观
 * @author   千叶
 * @date     2018-04-11
 */
class Score extends Facade
{
	protected static function getFacadeClass()
	{
		return '\\app\\common\\model\\Score';
	}
}