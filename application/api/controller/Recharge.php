<?php
namespace app\api\controller;

use think\Controller;
use app\api\model\Recharge as RechargeModel;

/**
 * @project  充值接口控制器
 * @author   千叶
 * @date     2018-04-18
 */
class Recharge extends Controller
{
	/**
	 * 充值额度、赠送的优惠券列表
	 * @param RechargeModel $rechargeModel
	 * @return \think\response\Json
	 */
	public function get_recharge_list(RechargeModel $rechargeModel)
	{
		return json($rechargeModel->getRechargeList());
	}

	public function do_recharge()
	{

	}
}
