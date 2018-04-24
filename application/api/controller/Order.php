<?php
namespace app\api\controller;

use app\api\model\Order as OrderModel;

/**
 * @project  订单接口控制器
 * @author   千叶
 * @date     2018-04-23
 */
class Order extends Base
{
	/**
	 * 生成订单之前，获取订单信息
	 * @param OrderModel $orderModel
	 * @return \think\response\Json
	 */
	public function get_order_info(OrderModel $orderModel)
	{
		$cartIdString = input('ids');
		return json($orderModel->getOrderInfo($this['auth']['uid'], $cartIdString));
	}

	/**
	 * 生成订单
	 * @param OrderModel $orderModel
	 * @return \think\response\Json
	 */
	public function build_order(OrderModel $orderModel)
	{
		$orderNo = $orderModel->build_order_no();
		$orderData = [
			'order_no' => $orderNo, // 订单号
			'uid' => $this['auth']['uid'],

			// 用户勾选的付款类型:积分支付和余额支付
			'use_score' => input('use_score/d', 0),
			'use_money' => input('use_money/d', 0),
			'coupon_id' => input('coupon_id/d'), // 支付使用的优惠券id
			'pay_score' => 0,// 用户选择支付的积分初始化
			'pay_money' => 0,// 用户选择支付的余额初始化
			'pay_weixin' => 0,// 微信支付额度初始化

			// 1订单生成，等待付款；5已经付款，等待审核；10审核成功，等待发货；15发货成功，等待收货；20已收货，订单完成；
			// 25客户退货，等待审核；30退货审核拒绝；35退货审核通过，等待收货；40退货完成
			'status' => 1,
			'freight' => input('freight/d'), // 运费

			// 收件人信息
			'user_remark' => input('user_remark'), // 用户订单备注
			'accept_name' => input('accept_name'), // 收件人姓名
			'accept_phone' => input('accept_phone'), // 收件人联系电话
			'accept_address' => input('accept_address'), // 收件人地址

			// 发票信息
			'is_invoice' => input('is_invoice/d', 0),// 是否开具发票
			'invoice_cate' => input('invoice_cate/d'),// 发票类型1个人  2单位
			'invoice_title' => input('invoice_title'), // 发票抬头
			'invoice_tax_no' => input('invoice_title'), // 税号
			'invoice_address' => input('invoice_title'), // 发票单位地址
			'invoice_phone' => input('invoice_title'), // 发票电话
			'invoice_bank' => input('invoice_title'), // 发票开户行
			'invoice_bank_card' => input('invoice_title'), // 发票银行账户
			'create_time' => $_SERVER['REQUEST_TIME']
		];
		return json($orderModel->buildOrder($this['auth']['uid'], $orderData));
	}
}
