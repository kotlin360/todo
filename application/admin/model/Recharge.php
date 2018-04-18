<?php
namespace app\admin\model;

use think\Collection;
use think\Db;
use think\Model;
use think\facade\Config;

/**
 * @project  充值额度管理模型
 * @author   千叶
 * @date     2018-04-18
 */
class Recharge extends Model
{
	protected $name = 'recharge';

	// 开启自动写入时间
	protected $autoWriteTimestamp = true;

	/**
	 * 创建充值额度
	 * @param $data
	 * @return array
	 */
	public function createRecharge($data)
	{
		try {
			$this->save($data);
			return ['code' => 1];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '创建失败：' . $e->getMessage()];
		}
	}

	/**
	 * 充值额度修改
	 * @param $id
	 * @param $data
	 * @return array
	 */
	public function editRecharge($id, $data)
	{
		try {
			$this->where("id={$id}")->update($data);
			return ['code' => 1];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '修改失败：' . $e->getMessage()];
		}
	}

	/**
	 * 修改充值额度状态
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
			return ['code' => 0, 'msg' => '充值额度状态修改失败：' . $e->getMessage()];
		}
	}

	/**
	 * 根据ID获取当前充值额度数据
	 * @param $id
	 * @return array|null|\PDOStatement|string|Model
	 */
	public function getRechargeById($id)
	{
		try {
			return Db::name($this->name)->where("id={$id}")->field(true)->find();
		} catch (\Exception $e) {
			return null;
		}
	}

	/**
	 * 根据条件获取充值额度列表和总数
	 * @param $cur_page
	 * @param $limits
	 * @return array
	 */
	public function getDataByWhere($cur_page, $limits)
	{
		$timestamp = $_SERVER['REQUEST_TIME'];
		try {
			$count = $this->count();
			$lists = $this->page($cur_page, $limits)->order('value')->select();
			$rechargeList = Collection::make($lists)->each(function ($list) use ($timestamp) {
				if ($list['coupon_id']) {
					$coupon = Db::name('coupon')->where("id={$list['coupon_id']}")
						->field('name,start,end,status')->find();
					$list['title'] = $coupon['name'];
					if ($coupon['start'] > $timestamp || $coupon['end'] < $timestamp || $coupon['status'] == 0) {
						$list['coupon_status'] = '<span style="color:#FF5722">优惠券过期</span>';
					} else {
						$list['coupon_status'] = '<span style="color:#009688">赠送有效</span>';
					}
				} else {
					$list['coupon_status'] = '不赠送';
					$list['title'] = '无优惠券';
				}
				return $list;
			});
			$json = [
				'code' => 0,
				'msg' => '',
				'count' => $count,
				'data' => $rechargeList
			];
			return $json;
		} catch (\Exception $e) {
			return ['code' => 404, 'msg' => $e->getMessage()];
		}
	}
}
