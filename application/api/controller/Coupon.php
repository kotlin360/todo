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
	 * @param             $type 1代表有效(可使用) 2代表已经使用 3代表已经过期（不可使用）
	 * @param int         $page 当前页数
	 * @return \think\response\Json
	 */
	public function get_coupon(CouponModel $couponModel, $type, $page = 1)
	{
		return json($couponModel->getCoupon($this['auth']['uid'], $type, $page));
	}
}
