<?php
namespace app\api\controller;

use app\api\model\Money as MoneyModel;

/**
 * @project  用户钱包接口
 * @author   千叶
 * @date     2018-04-18
 */
class Money extends Base
{
	/**
	 * 获取当前用户的钱包明细
	 * @param MoneyModel $moneyModel
	 * @return \think\response\Json
	 */
	public function get_money_list(MoneyModel $moneyModel)
	{
		$page = input('page/d', 1);
		return json($moneyModel->getMoneyList($this['auth']['uid'], $page));
	}

	/**
	 * 获取用户钱包余额
	 * @param MoneyModel $moneyModel
	 * @return \think\response\Json
	 */
	public function total(MoneyModel $moneyModel)
	{
		return json($moneyModel->total($this['auth']['uid']));
	}

	/**
	 * 钱包提现
	 * @param MoneyModel $moneyModel
	 * @return \think\response\Json
	 */
	public function withdraw(MoneyModel $moneyModel)
	{
		$value = input('value/d', null);
		$total = $moneyModel->total($this['auth']['uid'])['total']; // 钱包余额
		if ($value === null) {
			return json(['code' => 1, 'total' => $total]);
		}
		// 这里需要判断下用户的积分够不够
		if ($value <= 0) {
			return json(['code' => 0, 'msg' => '提现失败：提现额度必须大于0']);
		}
		if ($value > $total) {
			return json(['code' => 0, 'msg' => '提现失败：提现额度超过最大值']);
		}
		return json($moneyModel->withdraw($this['auth'], $value));
	}

	/**
	 * 获取钱包提现明细
	 * @param MoneyModel $moneyModel
	 * @return \think\response\Json
	 */
	public function get_withdraw_list(MoneyModel $moneyModel)
	{
		$page = input('page/d', 1);
		return json($moneyModel->getWithdrawList($this['auth']['uid'], $page));
	}

}
