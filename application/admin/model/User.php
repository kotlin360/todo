<?php
namespace app\admin\model;

use app\common\facade\Coupon;
use app\common\facade\Money;
use app\common\facade\Score;
use think\Db;
use think\Facade\Config;
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
	 * 获取用户积分信息
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
}
