<?php
namespace app\common\service;

use think\Collection;
use think\Db;
use think\facade\Cache;

/**
 * @project  获取系统所有的参数配置
 * @author   千叶
 * @date     2018-04-13
 */
class Param
{
	/**
	 * 获取系统配置参数
	 * 如果缓存不存在，就到数据库中查询
	 */
	public function getSystemParam()
	{
		$config = Cache::get('system_params', null);
		if (!$config) {
			// 如果不存在查询全部的配置数据，并放入缓存
			$configs = Db::name('config')->field('key,value')->select();
			$configList = array_reduce($configs, function ($config, $v) {
				$config[$v['key']] = $v['value'];
				return $config;
			}, []);
			// 写入缓存
			Cache::set('system_params', $configList);
		}
		return $config;
	}
}