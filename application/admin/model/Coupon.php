<?php
namespace app\admin\model;

use think\Db;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\DbException;
use think\facade\Config;
use think\Model;

/**
 * @project  优惠券模型
 * @author   千叶
 * @date     2018-04-08
 */
class Coupon extends Model
{
	protected $name = 'coupon';

	// 开启自动写入时间
	protected $autoWriteTimestamp = true;

	/**
	 * 创建优惠券
	 * @param $data
	 * @return array
	 */
	public function createCoupon($data)
	{
		$this->save($data);
		return ['code' => 1];
	}

	/**
	 * 优惠券修改
	 * @param $id
	 * @param $data
	 * @return array
	 */
	public function editCoupon($id, $data)
	{
		try {
			$this->where("id={$id}")->update($data);
			return ['code' => 1];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '修改失败：' . $e->getMessage()];
		}
	}

	/**
	 * 根据id获取优惠券信息，用于编辑优惠券
	 * @param $id
	 * @return array|null|\PDOStatement|string|Model
	 */
	public function getCouponById($id)
	{
		try {
			$coupon = Db::name($this->name)->where("id={$id}")->find();
			$coupon['start'] = date('Y-m-d H:i:s', $coupon['start']);
			$coupon['end'] = date('Y-m-d H:i:s', $coupon['end']);
			return $coupon;
		} catch (\Exception $e) {
			return null;
		}
	}

	/**
	 * 修改优惠券状态（启用或者禁用）
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
			return ['code' => 0, 'msg' => $msg . '优惠券失败：' . $e->getMessage()];
		}
	}

	/**
	 * 根据条件获取优惠券列表和总数
	 * @param $map
	 * @param $cur_page
	 * @param $limits
	 * @return array
	 */
	public function getDataByWhere($map, $cur_page, $limits)
	{
		try {
			$count = $this->where($map)->count();
			$list = $this->where($map)->page($cur_page, $limits)->select();
			$json = [
				'code' => 0,
				'msg' => '',
				'count' => $count,
				'data' => $list
			];
			return $json;
		} catch (\Exception $e) {
			return ['code' => 404, 'msg' => $e->getMessage()];
		}
	}

	/**
	 * 获取系统中有效的优惠券，用于后台定义充值额度的时候选择优惠券
	 * @return array|null|\PDOStatement|string|\think\Collection
	 */
	public function getAllCouponForRecharge()
	{
		$now = $_SERVER['REQUEST_TIME'];
		$where = "status=1 AND start <= {$now} AND end >= {$now}";
		try {
			$coupon = $this->where($where)->field('id,name')->select();
			return $coupon;
		} catch (\Exception $e) {
			return null;
		}
	}
}
