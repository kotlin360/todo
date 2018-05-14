<?php

namespace app\common\controller;

use app\api\model\Order as OrderModel;
use think\facade\Env;

/**
 * @project  微信支付控制器
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
		file_put_contents(Env::get('runtime_path') . '/log/weixin.txt', '我被调用了', FILE_APPEND);
		$xml = file_get_contents("php://input");
		file_put_contents(Env::get('runtime_path') . '/log/weixin.txt', $xml, FILE_APPEND);
		$orderModel->billPayNotify($xml);
	}

	/**
	 * 用户退款成功后通知
	 */
	public function bill_refund_notify()
	{

	}
}