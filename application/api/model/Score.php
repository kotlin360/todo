<?php
namespace app\api\model;

use think\Collection;
use think\Db;
use think\facade\Config;
use think\Model;

/**
 * @project  用户积分接口模型
 * @author   千叶
 * @date     2018-04-16
 */
class Score extends Model
{
	/**
	 * 获取用户总积分
	 * @param $uid
	 * @return mixed
	 */
	public function total($uid)
	{
		return Db::name('user')->where("id={$uid}")->value('score');
	}

	/**
	 * 获取用户积分明细
	 * @param     $uid
	 * @param int $page
	 * @return array
	 */
	public function getScoreList($uid, $page = 1)
	{
		$size = Config::get('weixinSize');
		$start = ($page - 1) * $size;
		try {
			$total = $this->total($uid);
			$lists = Db::name('score_log')->where("uid={$uid}")->field('value,note,create_time')->limit($start, $size)->order('id DESC')->select();
			$list = Collection::make($lists)->each(function ($list) {
				$list['create_time'] = date('Y-m-d H:i:s', $list['create_time']);
				return $list;
			});
			return ['code' => 1, 'data' => ['total' => $total, 'list' => $list]];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '获取用户积分明细失败：' . $e->getMessage()];
		}
	}

}
