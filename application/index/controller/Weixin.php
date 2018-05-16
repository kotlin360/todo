<?php

namespace app\index\controller;

use app\api\model\Order as OrderModel;
use app\api\model\Recharge as RechargeModel;

/**
 * @project  微信支付控制器(订单支付和充值)
 * @author   千叶
 * @date     2018-05-14
 */
class Weixin
{
	/**
	 * 支付成功后通知
	 * @param OrderModel $orderModel
	 */
	public function bill_pay_notify(OrderModel $orderModel)
	{
		$xml = file_get_contents("php://input");
		$orderModel->billPayNotify($xml);
	}

	/**
	 * 充值成功后的通知
	 * @param RechargeModel $rechargeModel
	 */
	public function recharge_notify(RechargeModel $rechargeModel)
	{
		$xml = file_get_contents("php://input");
		$rechargeModel->rechargeNotify($xml);
	}
}