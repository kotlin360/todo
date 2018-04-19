<?php
namespace app\admin\model;

use app\common\facade\Coupon;
use app\common\facade\Money;
use app\common\facade\Score;
use think\Db;
use think\Exception;
use think\exception\PDOException;
use think\Facade\Config;
use think\facade\Session;
use think\Model;

/**
 * @project  前台用户模型
 * @author   千叶
 * @date     2018-04-03
 */
class User extends Model
{

	protected $name = 'user';

	// 开启自动写入时间
	protected $autoWriteTimestamp = true;

	/**
	 * 根据条件获取商品分类的列表和总数
	 * @param $map
	 * @param $cur_page
	 * @param $limits
	 * @return array
	 */
	public function getDataByWhere($map, $cur_page, $limits)
	{
		try {
			$count = $this->where($map)->count();
			$list = $this->where($map)->page($cur_page, $limits)->order('id desc')->field(true)->select();
			$json = [
				'code' => 0,
				'msg' => '',
				'count' => $count,
				'data' => $list
			];
			return $json;
		} catch (\Exception $e) {
			return ['code' => 404, 'msg' => '获取用户列表失败：' . $e->getMessage()];
		}
	}

	/**
	 * 修改前台用户状态（启用或者禁用）
	 * @param $id
	 * @param $status
	 * @return array
	 */
	public function changeStatus($id, $status)
	{
		$msg = $status == 1 ? '禁用' : '启用';
		try {
			$tableName = Config::get('database.prefix') . $this->name;
			$sql = "UPDATE {$tableName} SET status = (case status when 0 then 1 else 0  end) WHERE id={$id}";
			Db::execute($sql);
			return ['code' => 1];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => $msg] . '失败:' . $e->getMessage();
		}
	}

	/**
	 * 获取用户基本、积分、钱包、优惠券等信息
	 * @param $id
	 * @return array
	 */
	public function getUserInfo($id)
	{
		// 用户基本信息
		$user = Db::name('user')->where("id={$id}")->field('passwd,open_id,avatar', true)->find();
		if ($user['create_ip']) {
			$ip2region = new \Ip2Region();
			$create_region = $ip2region->binarySearch($user['create_ip']);
			$user['create_region'] = $create_region['region'];
			$last_region = $ip2region->binarySearch($user['last_ip']);
			$user['last_region'] = $last_region['region'];
		}
		// 用户积分信息
		$score = Score::getLog($id);
		// 用户钱包信息
		$money = Money::getLog($id);
		// 用户优惠券信息
		$coupon = Coupon::getLog($id);
		return ['code' => 1, 'user' => $user, 'score' => $score, 'money' => $money, 'coupon' => $coupon];
	}

	/**
	 * 根据不同的类型获取不同的用户信息，分页
	 * @param $id
	 * @param $cate
	 * @param $page
	 * @return mixed
	 */
	public function getUserInfoMore($id, $cate, $page)
	{
		$size = Config::get('flowsize');
		$cate = ucfirst(strtolower($cate));
		$list = call_user_func_array("\\app\\common\\facade\\{$cate}::getLog", [$id, $page]);
		if ($list) {
			if ($size > count($list)) {
				// 没有更多了
				return ['code' => 1, 'more' => 0, 'list' => $list];
			} else {
				return ['code' => 1, 'more' => 1, 'list' => $list];
			}
		} else {
			return ['code' => 0];
		}
	}

	/**
	 * 获取用户提现列表
	 * @param $map
	 * @param $cur_page
	 * @param $page_size
	 * @return array
	 */
	public function getWithdrawList($map, $cur_page, $page_size)
	{
		try {
			$count = Db::name('withdraw')->where($map)->count();
			$list = Db::name('withdraw')->where($map)->page($cur_page, $page_size)->order('id desc')->field(true)->select();
			$json = [
				'code' => 0,
				'msg' => '',
				'count' => $count,
				'data' => $list
			];
			return $json;
		} catch (\Exception $e) {
			return ['code' => 404, 'msg' => '获取用户提现列表：' . $e->getMessage()];
		}
	}

	/**
	 * 提现审核
	 * @param $id       审核的提现申请id
	 * @param $type     审核结果 1通过 0拒绝
	 * @param $remark   拒绝原因
	 */
	public function checkWithdraw($id, $type, $remark)
	{
		$status = $type === 1 ? 2 : 3;
		$msg = $type === 1 ? '通过' : '拒绝';
		$username = Session::get('auth.real_name');
		// 生成提现审核表withdraw数据
		$frame = [
			'time' => $_SERVER['REQUEST_TIME'],
			'uname' => Session::get('auth.real_name'),
			'content' => '执行审核：' . $msg
		];
		$log = $this->makeLog($id, $frame);
		$withDrawData = ['status' => $status, 'remark' => $remark, 'check_time' => $_SERVER['REQUEST_TIME'], 'log' => $log];
		Db::startTrans();
		try {
			$widthDraw = Db::name('withdraw')->where("id={$id}")
				->field('uid,cate,value,real_value')->find();
			if ($type === 0) {
				// 拒绝的话返回用户的积分或者现金余额
				if ($widthDraw['cate'] == 1) {
					// 返回积分
					Db::name('user')->where("id={$widthDraw['uid']}")->setInc('score', $widthDraw['real_value']);
					// 写入积分记录表
					$scoreData = ['uid' => $widthDraw['uid'], 'value' => $widthDraw['real_value'], 'note' => '提现审核拒绝，返还积分', 'create_time' => $_SERVER['REQUEST_TIME']];
					Db::name('score_log')->insert($scoreData);
				} else {
					// 返回现金
					Db::name('user')->where("id={$widthDraw['uid']}")->setInc('money', $widthDraw['real_value']);
					// 写入现金记录表
					$moneyData = ['uid' => $widthDraw['uid'], 'value' => $widthDraw['real_value'], 'note' => '提现审核拒绝，返还现金', 'create_time' => $_SERVER['REQUEST_TIME']];
					Db::name('money_log')->insert($moneyData);
				}
			}
			Db::name('withdraw')->where("id={$id}")->update($withDrawData);
			// TODO 这里还需要完成微信支付，给用户付款功能
			Db::commit();
			return ['code' => 1];
		} catch (\Exception $e) {
			Db::rollback();
			return ['coce' => 0, 'msg' => '审核失败：' . $e->getMessage()];
		}
	}

	/**
	 * 获取用户提现日志记录
	 * @param $id
	 * @return array
	 */
	public function getWithdrawLog($id)
	{
		$log = Db::name('withdraw')->where("id={$id}")->value('log');
		return ['code' => 1, 'log' => $log ? unserialize($log) : null];
	}

	/**
	 * [makeLog 需要单独处理自动序列化问题]
	 * 解决方案：取出之前的详情字段再加入当前的详情内容,构造出完整的数据段插入数据库中的info字段中
	 * @param  [type] $id      [当前的申请ID]
	 * @param  [type] $nowData [当前的处理数据段]
	 * @return [string] $data    [返回序列化之后的日志]
	 */
	public function makeLog($id, $nowData)
	{
		$data = [];
		$before = unserialize(Db::name('withdraw')->where("id={$id}")->value('log'));
		if ($before) {
			//之前存在数据
			$before[] = $nowData;
			$data = serialize($before);
		} else {
			$now[] = $nowData;
			$data = serialize($now);
		}
		return $data;
	}
}
