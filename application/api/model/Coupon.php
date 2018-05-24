<?php
namespace app\api\model;

use think\Collection;
use think\Db;
use think\exception\PDOException;
use think\facade\Config;
use think\Model;

/**
 * @project  优惠券接口模型
 * @author   千叶
 * @date     2018-04-18
 */
class Coupon extends Model
{
	/**
	 * 根据不同的类型获取优惠券信息
	 * @param $uid  用户uid
	 * @param $type 1代表有效(可使用) 2代表已经使用 3代表已经过期（不可使用）
	 * @param $page
	 * @return array
	 */
	public function getCoupon($uid, $type, $page)
	{
		$limit = Config::get('weixinSize');
		$start = ($page - 1) * $limit;
		$where = " uid={$uid} ";
		$timestamp = $_SERVER['REQUEST_TIME'];
		switch ($type) {
			case 1:
				$where .= " AND status=0 AND start<{$timestamp} AND end > {$timestamp}";
				break;
			case 2:
				$where .= " AND status=1";
				break;
			case 3:
				$where .= " AND status=0 AND end < {$timestamp}";
				break;
			default:
				return ['code' => 1, 'data' => []];
		}
		try {
			$lists = Db::name('coupon_log')->where($where)->limit($start, $limit)
				->field('id,value,money,start,end')->select();
			$couponLists = Collection::make($lists)->each(function ($list) {
				$list['start'] = date('Y-m-d', $list['start']);
				$list['end'] = date('Y-m-d', $list['end']);
				return $list;
			});
			return ['code' => 1, 'data' => $couponLists, 'pageSize' => $limit];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '优惠券获取失败：' . $e->getMessage()];
		}
	}

	/**
	 * 获取系统中当前用户没有领取过的有效优惠券
	 * @param $uid
	 * @return array
	 */
	public function getAllCoupon($uid)
	{

		$now = $_SERVER['REQUEST_TIME'];
		try {
			$existIdString = '';
			$existIdArr = [];
			$hasReceiveId = Db::name('coupon_log')->where("uid={$uid}")->field('coupon_id')->select();

			if (is_array($hasReceiveId) && !empty($hasReceiveId)) {
				foreach ($hasReceiveId as $id) {
					$existIdArr[] = $id['coupon_id'];
				}
				$existIdString = implode(',', array_unique($existIdArr));
			}
			if ($existIdString != '') {
				$where = "status=1 AND id NOT IN ({$existIdString}) AND start<={$now} AND end>{$now}";
			} else {
				$where = "status=1 AND start<={$now} AND end>{$now}";
			}
			$lists = Db::name('coupon')->where($where)->field('id,value,money,start,end')->select();
			$couponList = Collection::make($lists)->each(function ($list) {
				$list['start'] = date('Y-m-d', $list['start']);
				$list['end'] = date('Y-m-d', $list['end']);
				return $list;
			});
			return ['code' => 1, 'data' => $couponList];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '优惠券获取失败：' . $e->getMessage()];
		}
	}

	/**
	 * 领取优惠券
	 * @param array $user 当前用户
	 * @param int   $id   需要领取的优惠券id
	 * @return array
	 */
	public function receive($user, $id)
	{
		try {
			$coupon = Db::name('coupon')->where("id={$id} AND status=1")->field(true)->find();
			if ($coupon === null || empty($coupon)) {
				return ['code' => 0, 'msg' => '领取失败：优惠券不存在'];
			}

			// 检查是否领取过
			$couponLogId = Db::name('coupon_log')->where("uid={$user['uid']} AND coupon_id={$id}")->value('id');
			if ($couponLogId) {
				return ['code' => 0, 'msg' => '领取失败：已经领取过'];
			}

			$data = [
				'coupon_id' => $coupon['id'],
				'uid' => $user['uid'],
				'name' => $coupon['name'],
				'value' => $coupon['value'],
				'money' => $coupon['money'],
				'status' => 0,
				'start' => $coupon['start'],
				'end' => $coupon['end'],
				'create_time' => $_SERVER['REQUEST_TIME']
			];
			Db::name('coupon_log')->insert($data);
			return ['code' => 1];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '领取失败：' . $e->getMessage()];
		}
	}

	/**
	 * 根据优惠券id和用户uid获取有效的优惠券，用于用户支付的时候判断
	 * @param $uid
	 * @param $id
	 * @return array|null|\PDOStatement|string|Model
	 */
	public function getValidCouponById($uid, $id)
	{
		$now = $_SERVER['REQUEST_TIME'];
		try {
			$coupon = Db::name('coupon_log')->where("id={$id} AND uid={$uid} AND status=0")
				->field('value,money,start,end')->find();
			if (!$coupon || ($coupon['start'] > $now) || ($coupon['end'] < $now)) {
				return null;
			}
			return $coupon;
		} catch (\Exception $e) {
			return null;
		}
	}
}
