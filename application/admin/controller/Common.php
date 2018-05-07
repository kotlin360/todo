<?php

namespace app\admin\controller;

use app\admin\model\Order as OrderModel;

/**
 * @project  公共控制器
 * @author   千叶
 * @date     2018-05-07
 */
class Common
{
	/**
	 * 微信退款通知接口
	 * @param OrderModel $orderModel
	 */
	public function refund_notify(OrderModel $orderModel)
	{
		$orderNo = input('orderNo');
		$orderModel->refundNotify($orderNo);
	}
}