<?php
namespace app\admin\model;

use think\Model;

/**
 * @project  日志模型
 * @author   千叶
 * @date     2018-03-28
 */
class Log extends Model
{
	protected $pk = 'log_id';

	/**
	 * 根据条件查询日志
	 * @param $map
	 * @param $cur_page
	 * @param $limits
	 * @return array
	 */
	public function getDataByWhere($map, $cur_page, $limits)
	{
		try {
			$count = $this->where($map)->count();
			$list = $this->where($map)->page($cur_page, $limits)->order('log_id desc')->select();
			$json = [
				'code' => 0,
				'msg' => '',
				'count' => $count,
				'data' => $list
			];
			return $json;
		} catch (\Exception $e) {
			Log::error('根据条件查询日志');
			return ['code' => 404, 'msg' => '系统接口异常，请稍后再试'];
		}
	}
}
