<?php
namespace app\api\controller;

use app\api\model\Score as ScoreModel;

/**
 * @project  用户积分接口
 * @author   千叶
 * @date     2018-04-16
 */
class Score extends Base
{
	/**
	 * 获取用户总积分
	 * @param ScoreModel $scoreModel
	 * @return \think\response\Json
	 */
	public function total(ScoreModel $scoreModel)
	{
		return json($scoreModel->total($this['auth']['uid']));
	}

	/**
	 * 积分提现
	 * @param ScoreModel $scoreModel
	 * @return \think\response\Json
	 */
	public function withdraw(ScoreModel $scoreModel)
	{
		$value = input('value/d', null);
		return json($scoreModel->withdraw($this['auth'], $value));
	}

	/**
	 * 获取当前用户的积分明细
	 * @param ScoreModel $scoreModel
	 * @return \think\response\Json
	 */
	public function get_score_list(ScoreModel $scoreModel)
	{
		$page = input('page/d', 1);
		return json($scoreModel->getScoreList($this['auth']['uid'], $page));
	}

	/**
	 * 获取积分提现明细，前端暂时未开发此功能
	 * @param ScoreModel $scoreModel
	 * @return \think\response\Json
	 */
	public function get_withdraw_list(ScoreModel $scoreModel)
	{
		$page = input('page/d', 1);
		return json($scoreModel->getWithdrawList($this['auth']['uid'], $page));
	}
}
