<?php
namespace app\admin\model;

use think\Db;
use think\facade\Cache;
use think\Model;

/**
 * @project  系统配置参数模型
 * @author   千叶
 * @date     2018-04-04
 */
class Config extends Model
{
	/**
	 * 获取系统全部的参数
	 * @return mixed
	 */
	public function getAllParam()
	{
		$params = Cache::get('system_params');
		if ($params) {
			return $params;
		}
		$params = [];
		$cursor = Db::name('config')->field('key,value')->cursor();
		foreach ($cursor as $v) {
			$params[$v['key']] = $v['value'];
		}
		Cache::set('system_params', $params);
		return $params;
	}
}
