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
	 * 获取个人订单
	 * @param OrderModel $orderModel
	 * @return \think\response\Json
	 */
	public function get_order_list(OrderModel $orderModel)
	{
		// 默认不传全部 1待付款 10待发货 15待收货 25待退款 50已经取消
		$type = input('type/d', 0);
		$page = input('page/d', 1);
		return json($orderModel->getOrderList($this['auth']['uid'], $type, $page));
	}

	/**
	 * 积分兑换生成订单之前，获取订单信息
	 * @param OrderModel $orderModel
	 * @return \think\response\Json
	 */
	public function get_score_order_info(OrderModel $orderModel)
	{
		$data = [
			'uid' => $this['auth']['uid'],
			'id' => input('id/d'),
			'pid' => input('pid/d'),
			'num' => input('num/d')
		];
		return json($orderModel->getScoreOrderInfo($data));
	}

	/**
	 * 生成订单之前，获取订单信息【对应前台“去结算”按钮接口】
	 * @param OrderModel $orderModel
	 * @return \think\response\Json
	 */
	public function get_order_info(OrderModel $orderModel)
	{
		$cartIdString = input('cartIdList', null);
		return json($orderModel->getOrderInfo($this['auth']['uid'], $cartIdString));
	}

	/**
	 * 积分兑换功能，生成订单并扣除积分功能
	 * @param OrderModel $orderModel
	 * @return \think\response\Json
	 */
	public function build_score_order(OrderModel $orderModel)
	{
		// 前台提交的商品信息
		$goods = [
			'uid' => $this['auth']['uid'],
			'id' => input('id/d'),
			'pid' => input('pid/d'),
			'num' => input('num/d')
		];

		// 订单信息数据
		$orderData = [
			'status' => 1, // 订单状态
			'freight' => 0, // 运费
			'order_no' => $orderModel->build_order_no(), // 订单号
			'uid' => $this['auth']['uid'],
			'user_remark' => input('user_remark'), // 用户订单备注
			'create_time' => $_SERVER['REQUEST_TIME']
		];

		// 处理收货地址和发票信息
		$addressInfo = input('addressInfo/a', null);
		$invoiceInfo = input('invoiceInfoList/a', null);
		$orderModel->orderAddressAndInvoiceHandle($orderData, $addressInfo, $invoiceInfo);

		return json($orderModel->buildScoreOrder($goods, $orderData));
	}

	/**
	 * 生成订单（非纯积分兑换商品订单）
	 * @param OrderModel $orderModel
	 * @return \think\response\Json
	 */
	public function build_order(OrderModel $orderModel)
	{
		// 订单信息数据
		$orderData = [
			'order_no' => $orderModel->build_order_no(), // 订单号
			'uid' => $this['auth']['uid'],
			// 用户勾选的付款类型:积分支付和余额支付
			'use_score' => input('use_score/d', 0),
			'use_money' => input('use_money/d', 0),
			'coupon_id' => input('coupon_id/d', 0), // 支付使用的优惠券id
			'pay_coupon_value' => 0, // 支付使用的优惠券额度
			'pay_score' => 0, // 用户选择支付的积分初始化
			'pay_money' => 0, // 用户选择支付的余额初始化
			'pay_weixin' => 0, // 微信支付额度初始化
			'status' => 1, // 1订单生成，等待付款
			'user_remark' => input('user_remark'), // 用户订单备注
			'create_time' => $_SERVER['REQUEST_TIME']
		];

		// 处理收货地址和发票信息
		$addressInfo = input('addressInfo/a', null);
		$invoiceInfo = input('invoiceInfoList/a', null);
		if (!$addressInfo) {
			return json(['code' => 0, 'msg' => '请填写收货地址']);
		}
		$orderModel->orderAddressAndInvoiceHandle($orderData, $addressInfo, $invoiceInfo);

		return json($orderModel->buildOrder($orderData));
	}

	/**
	 * 获取支付信息
	 * @param OrderModel $orderModel
	 * @return \think\response\Json
	 */
	public function get_pay_info(OrderModel $orderModel)
	{
		$orderNo = input('orderNo');
		return json($orderModel->getPayInfo($this['auth']['uid'], $orderNo));
	}

	public function pay_handle()
	{

	}
}
