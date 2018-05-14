<?php
namespace app\common\facade;

use think\Facade;

/**
 * @project  用户钱包外观
 * @author   千叶
 * @date     2018-04-11
 */
class Money extends Facade
{
	/**
	 * 获取当前Facade对应类名
	 * @return string
	 */
	protected static function getFacadeClass()
	{
		return '\\app\\common\\model\\Money';
	}

}