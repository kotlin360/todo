<?php
namespace app\api\model;

use app\common\facade\Param;
use think\Db;
use think\Exception;
use think\Model;

/**
 * @project  商品分享获取积分
 * @author   千叶
 * @date     2018-05-03
 */
class Share extends Model
{

	/**
	 * 分享商品获取积分，每天有次数限制
	 * @param $uid
	 * @return array
	 */
	public function shareGoods($uid)
	{
		$params = Param::getSystemParam();
		$day = date("Ymd");
		$config_share_score = $params['config_share_score'] ? $params['config_share_score'] : 1;

		// 获取今日已经分享的次数
		$frequency = $this->where("uid={$uid} AND day={$day}")->count();
		if ($frequency > $params['config_share_score_limit']) {
			return ['code' => 1, 'msg' => '今日分享数次已打上限'];
		}

		Db::startTrans();
		try {
			// 写入到分享表
			$this->insert(['uid' => $uid, 'day' => $day, 'share_time' => $_SERVER['REQUEST_TIME']]);
			// 用户表增加积分
			Db::name('user')->where("id={$uid}")->setInc('score', $config_share_score);
			// 写入到积分记录表
			$score_log = ['uid' => $uid, 'value' => $config_share_score, 'note' => '分享商品赠送', 'create_time' => $_SERVER['REQUEST_TIME']];
			Db::name('score_log')->insert($score_log);
			Db::commit();
			return ['code' => 1, 'msg' => '分享成功，积分+' . $config_share_score];
		} catch (Exception $e) {
			Db::rollback();
			return ['code' => 0, 'msg' => '分享失败:' . $e->getMessage()];
		}
	}

}
