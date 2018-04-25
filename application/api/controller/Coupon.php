<?php
namespace app\api\controller;

use app\api\model\Coupon as CouponModel;

/**
 * @project  优惠券接口控制器
 * @author   千叶
 * @date     2018-04-18
 */
class Coupon extends Base
{
	/**
	 * 获取个人优惠券信息
	 * @param CouponModel $couponModel
	 * @return \think\response\Json
	 */
	public function get_coupon(CouponModel $couponModel)
	{
		// type 1代表有效(可使用) 2代表已经使用 3代表已经过期（不可使用）
		$type = input('type/d', 1);
		$page = input('page/d', 1);
		return json($couponModel->getCoupon($this['auth']['uid'], $type, $page));
	}

	/**
	 * 获取系统中有效的优惠券,排除当前用户已经领取的优惠券
	 * @param CouponModel $couponModel
	 * @return \think\response\Json
	 */
	public function get_all_coupon(CouponModel $couponModel)
	{
		return json($couponModel->getAllCoupon($this['auth']['uid']));
	}

	/**
	 * 领取优惠券
	 * @param CouponModel $couponModel
	 * @return \think\response\Json
	 */
	public function receive(CouponModel $couponModel)
	{
		$id = input('id/d', 0);
		return json($couponModel->receive($this['auth'], $id));
	}
}
