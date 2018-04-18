<?php
namespace app\api\model;

use app\common\service\Param;
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
		$total = Db::name('user')->where("id={$uid}")->value('score');
		return ['code' => 1, 'total' => $total];
	}

	/**
	 * 提现申请
	 * @param $user
	 * @param $value
	 * @return array
	 */
	public function withdraw($user, $value)
	{
		// 生成日志
		$frame[] = [
			'time' => $_SERVER['REQUEST_TIME'],
			'uname' => $user['username'],
			'content' => '提交积分提现申请'
		];
		// 写入数据
		$data = [
			'uid' => $user['uid'],
			'username' => $user['username'],
			'cate' => 1, // 1代表积分提现
			'value' => $value,
			'create_time' => $_SERVER['REQUEST_TIME'],
			'status' => 1,
			'log' => serialize($frame)
		];
		Db::startTrans();
		try {
			// 写入提现记录表，用于审核
			Db::name('withdraw')->insert($data);
			// 写入用户的积分日志表
			// 扣除用户相应积分
			Db::commit();
			return ['code' => 1];
		} catch (\Exception $e) {
			Db::rollback();
			return ['code' => 0, 'msg' => '积分提现失败：' . $e->getMessage()];
		}
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

	/**
	 * 获取用户的积分提现明细
	 * @param $uid
	 * @param $page
	 * @return array
	 */
//	public function getWithdrawList($uid, $page)
//	{
//		$size = Config::get('weixinSize');
//		$start = ($page - 1) * $size;
//		try {
//			$lists = Db::name('withdraw')->where("uid={$uid} AND cate=1")->field('id,value,remark,status,create_time')->limit($start, $size)->order('id DESC')->select();
//			$status = [
//				's1' => '提交申请，等待审核',
//				's2' => '审核成功，系统处理中',
//				's3' => '审核拒绝，提现失败',
//				's4' => '提现成功，已到账'
//			];
//			$logs = Collection::make($lists)->each(function ($list) use ($status) {
//				// 处理状态
//				$list['status'] = $status['s' . $list['status']];
//				$list['create_time'] = date('Y-m-d H:i:s', $list['create_time']);
//				return $list;
//			})->toArray();
//			return ['code' => 1, 'data' => $logs];
//		} catch (\Exception $e) {
//			return ['code' => 0, 'msg' => '获取提现明细失败：' . $e->getMessage()];
//		}
//	}
}
