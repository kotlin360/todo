<?php
namespace app\api\model;

use think\Collection;
use think\Db;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\DbException;
use think\Model;

/**
 * @project  充值接口模型
 * @author   千叶
 * @date     2018-04-18
 */
class Recharge extends Model
{
	/**
	 * 获取充值额度和赠送优惠券的信息
	 * @return array
	 */
	public function getRechargeList()
	{
		$timestamp = $_SERVER['REQUEST_TIME'];
		try {
			$lists = Db::name('recharge')->alias('r')
				->join('td_coupon c', "r.coupon_id=c.id AND c.status=1 AND c.start < {$timestamp} AND c.end >{$timestamp}", 'LEFT')
				->where("r.status=1")->order('r.value')
				->order('r.value')
				->field('r.id,r.value,r.num,c.value as coupon_value,c.money as coupon_money')->select();
			$rechargeList = Collection::make($lists)->each(function ($list) {
				if ($list['coupon_value'] == null || $list['coupon_money'] == null) {
					$list['hasCoupon'] = 0;
					unset($list['num']);
					unset($list['coupon_value']);
					unset($list['coupon_money']);
				} else {
					$list['hasCoupon'] = 1;
				}
				return $list;
			})->toArray();
			return ['code' => 1, 'data' => $rechargeList];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '获取充值数据失败：' . $e->getMessage()];
		}
	}

}
