<?php
namespace app\api\controller;

use app\api\model\Score as ScoreModel;
use app\common\facade\Param;

/**
 * @project  用户积分接口
 * @author   千叶
 * @date     2018-04-16
 */
class Score extends Base
{
	/**
	 * 获取当前用户的积分明细
	 * @param ScoreModel $scoreModel
	 * @return \think\response\Json
	 */
	public function index(ScoreModel $scoreModel)
	{
		$page = input('page/d', 1);
		return json($scoreModel->getScoreList($this['auth']['uid'], $page));
	}

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
		$total = $scoreModel->total($this['auth']['uid'])['total']; // 总积分
		$rate = Param::getSystemParam()['config_cash2score_rate']; // 积分现金折算率
		$max = $total / $rate; // 最大提现额度
		if ($value === null) {
			return json(['code' => 1, 'total' => $total, 'max' => $max]);
		}
		// 这里需要判断下用户的积分够不够
		if ($value <= 0) {
			return json(['code' => 0, 'msg' => '提现失败：提现额度必须大于0']);
		}
		if ($value > $max) {
			return json(['code' => 0, 'msg' => '提现失败：提现额度超过最大值']);
		}
		return json($scoreModel->withdraw($this['auth'], $value));
	}

	/**
	 * 获取积分提现明细
	 * @param ScoreModel $scoreModel
	 * @return \think\response\Json
	 */
	public function get_withdraw_list(ScoreModel $scoreModel)
	{
		$page = input('page/d', 1);
		return json($scoreModel->getWithdrawList($this['auth']['uid'], $page));
	}

}
