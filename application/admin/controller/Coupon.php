<?php
namespace app\admin\controller;

use app\admin\model\Coupon as CouponModel;
use app\admin\validate\Coupon as CouponValidate;
use think\Controller;
use think\facade\Config;

/**
 * @project  优惠券管理控制器
 * @author   千叶
 * @date     2018-04-08
 */
class Coupon extends Controller
{
	/**
	 * 优惠券列表
	 * @param CouponModel $couponModel
	 * @return mixed|\think\response\Json
	 */
	public function index(CouponModel $couponModel)
	{
		if ($this->request->isAjax()) {
			$cur_page = input('page', 1, 'intval');
			$keyword = input('keyword', '', 'urldecode');
			$page_size = input('limit', Config::get('page_size'), 'intval');
			$map = $keyword ? "name like '%{$keyword}%'" : '';
			$json = $couponModel->getDataByWhere($map, $cur_page, $page_size);
			return json($json);
		} else {
			$page_size = Config::get('page_size');
			return $this->assign('page_size', $page_size)->fetch();
		}
	}

	/**
	 * 创建优惠券
	 * @param CouponModel    $couponModel
	 * @param CouponValidate $couponValidate
	 * @return array|mixed
	 */
	public function add(CouponModel $couponModel, CouponValidate $couponValidate)
	{
		if ($this->request->isAjax()) {
			$data = [
				'name' => input('name'),
				'value' => input('value'),
				'money' => input('money/d'),
				'start' => input('start', 0, 'strtotime'),
				'end' => input('end', 0, 'strtotime'),
				'status' => input('status/d', 0),
			];
			if (!$couponValidate->check($data)) {
				return json(['code' => 0, 'msg' => '创建失败：' . $couponValidate->getError()]);
			}
			return json($couponModel->createCoupon($data));
		} else {
			return $this->fetch();
		}
	}

	/**
	 * 优惠券编辑
	 * @param CouponModel    $couponModel
	 * @param CouponValidate $couponValidate
	 * @return mixed|\think\response\Json
	 */
	public function edit(CouponModel $couponModel, CouponValidate $couponValidate)
	{
		$id = input('id/d', 0);
		if ($this->request->isAjax()) {
			$data = [
				'name' => input('name'),
				'value' => input('value'),
				'money' => input('money/d'),
				'start' => input('start', 0, 'strtotime'),
				'end' => input('end', 0, 'strtotime'),
				'status' => input('status/d', 0),
			];
			if (!$couponValidate->check($data)) {
				return json(['code' => 0, 'msg' => '修改失败：' . $couponValidate->getError()]);
			}
			return json($couponModel->editCoupon($id, $data));
		} else {
			$coupon = $couponModel->getCouponById($id);
			$coupon == null && $this->redirect(url('system/mistake'));
			return $this->assign('coupon', $coupon)->fetch('coupon/add');
		}
	}

	/**
	 * 修改优惠券状态
	 * @param CouponModel $couponModel
	 * @return \think\response\Json
	 */
	public function change_status(CouponModel $couponModel)
	{
		$id = input('param.id', 0, 'intval');
		$status = input('param.status', 1, 'intval');
		return json($couponModel->changeStatus($id, $status));
	}
}
