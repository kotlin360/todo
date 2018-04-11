<?php
namespace app\common\model;

use think\Db;
use think\facade\Config;
use think\Model;

/**
 * @project  用户积分模型
 * @author   千叶
 * @date     2018-04-11
 */
class Score extends Model
{
	/**
	 * 根据用户ID获取用的积分记录
	 * @param     $id
	 * @param int $page
	 * @return array|null|\PDOStatement|string|\think\Collection
	 */
	public function getLog($id, $page = 1)
	{
		$size = Config::get('flowsize');
		$start = ($page - 1) * $size;
		try {
			return Db::name('score_log')->where("uid={$id}")->order('id DESC')->limit($start, $size)->select();
		} catch (\Exception $e) {
			return null;
		}
	}
}
