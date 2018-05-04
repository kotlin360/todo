<?php
namespace app\admin\controller;

use app\admin\model\Order as OrderModel;
use think\Controller;
use think\Facade\Config;

/**
 * @project  订单控制器
 * @author   千叶
 * @date     2018-04-09
 */
class Order extends Base
{
	/**
	 * 订单列表页面
	 * @return mixed
	 */
	public function index(OrderModel $orderModel)
	{
		if ($this->request->isAjax()) {
			$cur_page = input('page', 1, 'intval');
			$order_no = input('order_no', '', 'urldecode');
			$accept_name = input('accept_name', '', 'urldecode');
			$phone = input('phone', '', 'urldecode');
			$status = input('status/d', 0);
			$page_size = input('limit', Config::get('page_size'), 'intval');
			$map = ' 1=1 ';
			$map .= $order_no ? "AND order_no like '%{$order_no}%'" : '';
			$map .= $accept_name ? "AND accept_name like '%{accept_name}%'" : '';
			$map .= $phone ? "AND phone like '%{phone}%'" : '';
			$map .= $status ? "AND status = {$status}" : '';
			$json = $orderModel->getDataByWhere($map, $cur_page, $page_size);
			return json($json);
		} else {
			$page_size = Config::get('page_size');
			$status = Config::get('order_status');
			$this->assign(['page_size' => $page_size, 'status' => $status]);
			return $this->fetch();
		}
	}

	/**
	 * 获取商品详情
	 * @param OrderModel $orderModel
	 * @return \think\response\Json
	 */
	public function detail(OrderModel $orderModel)
	{
		$id = input('id/d', 0);
		$goodsinfo = $orderModel->getGoodsInfo($id);
		return json($goodsinfo);
	}

	/**
	 * 发货
	 * @param OrderModel $orderModel
	 * @return \think\response\Json
	 */
	public function send_goods(OrderModel $orderModel)
	{
		$id = input('id/d', 0);
		// 快递单号
		$courierNumber = input('courierNumber', 0);
		$goodsinfo = $orderModel->sendGoods($id, $courierNumber);
		return json($goodsinfo);
	}

	/**
	 * 退货退款后台审核
	 * @param OrderModel $orderModel
	 * @return \think\response\Json
	 */
	public function return_verify(OrderModel $orderModel)
	{
		$id = input('id/d', 0);
		// status 30拒绝 35通过
		$status = input('status/d', 30);
		$return_remark = input('returnRemark', '');
		$goodsinfo = $orderModel->returnVerify($id, $status, $return_remark);
		return json($goodsinfo);
	}

	/**
	 * 微信退款通知接口
	 * @param OrderModel $orderModel
	 */
	public function refund_notify(OrderModel $orderModel)
	{
		$orderNo = input('orderNo');
		$orderModel->refundNotify();
	}
}
