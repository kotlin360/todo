<?php
namespace app\admin\controller;

use app\admin\model\User as UserModel;
use think\Controller;
use think\Facade\Config;

/**
 * @project  前台用户控制器
 * @author   千叶
 * @date     2018-04-03
 */
class User extends Base
{
	/**
	 * 前台用户列表展示
	 * @param UserModel $userModel
	 * @return mixed|\think\response\Json
	 */
	public function index(UserModel $userModel)
	{
		if ($this->request->isAjax()) {
			$cur_page = input('page', 1, 'intval');
			$keyword = input('keyword', '', 'urldecode');
			$page_size = input('limit', Config::get('page_size'), 'intval');
			$map = $keyword ? "username like '%{$keyword}%'" : '';
			$json = $userModel->getDataByWhere($map, $cur_page, $page_size);
			return json($json);
		} else {
			$page_size = Config::get('page_size');
			return $this->assign('page_size', $page_size)->fetch();
		}
	}

	/**
	 * 修改前台用户状态（开启或者禁用）
	 * @param UserModel $userModel
	 * @return \think\response\Json
	 */
	public function change_status(UserModel $userModel)
	{
		$id = input('param.id', 0, 'intval');
		$status = input('param.status', 1, 'intval');
		return json($userModel->changeStatus($id, $status));
	}

	/**
	 * 获取用户详情，包括基本信息，积分信息，钱包信息，优惠券信息等
	 * @param UserModel $userModel
	 * @return \think\response\Json
	 */
	public function detail(UserModel $userModel)
	{
		$id = input('id/d', 0);
		$cate = input('cate', '');
		if ($cate) {
			$page = input('page/d');
			$userinfo = $userModel->getUserInfoMore($id, $cate, $page);
		} else {
			$userinfo = $userModel->getUserInfo($id);
		}
		return json($userinfo);
	}

	/**
	 * 客户提现明细
	 * @param UserModel $userModel
	 * @return mixed|\think\response\Json
	 */
	public function withdraw(UserModel $userModel)
	{
		if ($this->request->isAjax()) {
			$cur_page = input('page/d', 1);
			$username = input('username', '');
			$status = input('status/d', 0);
			$page_size = input('limit/d', Config::get('page_size'));
			$map = '1=1';
			$map .= $username ? ' AND username=' . $username : '';
			$map .= $status ? ' AND status=' . $status : '';
			$json = $userModel->getWithdrawList($map, $cur_page, $page_size);
			return json($json);
		} else {
			$page_size = Config::get('page_size');
			return $this->assign('page_size', $page_size)->fetch();
		}
	}

	/**
	 * 提现审核
	 * @param UserModel $userModel
	 * @return \think\response\Json
	 */
	public function check_withdraw(UserModel $userModel)
	{
		$id = input('id/d');
		$type = input('type/d');
		$remark = input('remark', '');
		return json($userModel->checkWithdraw($id, $type, $remark));
	}

	/**
	 * 获取提现日志
	 * @param UserModel $userModel
	 * @return \think\response\Json
	 */
	public function withdraw_log(UserModel $userModel)
	{
		$id = input('id/d', 0);
		return json($userModel->getWithdrawLog($id));
	}

	/**
	 * 微信支付流水
	 * @param UserModel $userModel
	 * @return mixed|\think\response\Json
	 */
	public function weixin(UserModel $userModel)
	{
		if ($this->request->isAjax()) {
			$cur_page = input('page', 1, 'intval');
			$order_no = input('order_no', '', 'urldecode');
			$transaction_id = input('transaction_id', '', 'urldecode');
			$cate = input('cate/d', null);
			$page_size = input('limit', Config::get('page_size'), 'intval');

			// 拼凑map查询条件
			$map = ' 1=1 ';
			$map .= $order_no ? "AND order_no like '%{$order_no}%'" : '';
			$map .= $transaction_id ? "AND transaction_id like '%{$transaction_id}%'" : '';
			$map .= $cate ? "AND cate = {$cate}" : '';

			$json = $userModel->getWeixinPayLog($map, $cur_page, $page_size);
			return json($json);
		} else {
			$page_size = Config::get('page_size');
			return $this->assign('page_size', $page_size)->fetch();
		}
	}
}
