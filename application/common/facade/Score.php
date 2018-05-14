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
	/**
	 * 获取当前Facade对应类名
	 * @return string
	 */
	protected static function getFacadeClass()
	{
		return '\\app\\common\\model\\Score';
	}
}