<?php
namespace app\admin\controller;

use think\Controller;
use think\facade\Config;
use app\admin\model\Recharge as RechageModel;
use app\admin\model\Coupon as CouponModel;

/**
 * @project  充值管理
 * @author   千叶
 * @date     2018-04-18
 */
class Recharge extends Controller
{

	/**
	 * 充值定义列表
	 * @param RechageModel $rechargeModel
	 * @return mixed|\think\response\Json
	 */
	public function index(RechageModel $rechargeModel)
	{
		if ($this->request->isAjax()) {
			$cur_page = input('page', 1, 'intval');
			$page_size = input('limit', Config::get('page_size'), 'intval');
			$json = $rechargeModel->getDataByWhere($cur_page, $page_size);
			return json($json);
		} else {
			$page_size = Config::get('page_size');
			return $this->assign('page_size', $page_size)->fetch();
		}
	}

	/**
	 * 创建充值额度
	 * @param RechageModel $rechargeModel
	 * @param CouponModel  $couponModel
	 * @return mixed|\think\response\Json
	 */
	public function add(RechageModel $rechargeModel, CouponModel $couponModel)
	{
		if ($this->request->isAjax()) {
			$data = [
				'value' => input('value/d', 0),
				'coupon_id' => input('coupon_id/d', 0),
				'num' => input('num/d', 0),
				'status' => input('status/d', 1),
			];
			$result = $rechargeModel->createRecharge($data);
			return json($result);
		} else {
			// 获取有效的优惠券
			$coupons = $couponModel->getAllCouponForRecharge();
			return $this->assign('coupons', $coupons)->fetch();
		}
	}

	/**
	 * 编辑充值额度
	 * @param RechageModel $rechargeModel
	 * @param CouponModel  $couponModel
	 * @return mixed|\think\response\Json
	 */
	public function edit(RechageModel $rechargeModel, CouponModel $couponModel)
	{
		$id = input('id/d', 0);
		if ($this->request->isAjax()) {
			$data = [
				'value' => input('value/d', 0),
				'coupon_id' => input('coupon_id/d', 0),
				'num' => input('num/d', 0),
				'status' => input('status/d', 1),
			];
			$result = $rechargeModel->editRecharge($id, $data);
			return json($result);
		} else {
			// 获取有效的优惠券
			$coupons = $couponModel->getAllCouponForRecharge();
			// 获取当前充值额度
			$recharge = $rechargeModel->getRechargeById($id);
			$recharge === null && $this->redirect(url('system/mistake'));
			$this->assign(['coupons' => $coupons, 'recharge' => $recharge]);
			return $this->fetch('recharge/add');
		}
	}

	/**
	 * 修改充值额度状态
	 * @param RechageModel $rechargeModel
	 * @return \think\response\Json
	 */
	public function change_status(RechageModel $rechargeModel)
	{
		$id = input('id/d', 0);
		$status = input('status', 1, 'intval');
		return json($rechargeModel->changeStatus($id, $status));
	}

}
