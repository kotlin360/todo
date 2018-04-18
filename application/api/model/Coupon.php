<?php
namespace app\api\model;

use think\Collection;
use think\Db;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\DbException;
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
				->field('value,money,start,end')->select();
			$couponLists = Collection::make($lists)->each(function ($list) {
				$list['start'] = date('Y-m-d', $list['start']);
				$list['end'] = date('Y-m-d', $list['end']);
				return $list;
			});
			return ['code' => 1, 'data' => $couponLists];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '优惠券获取失败：' . $e->getMessage()];
		}
	}
}
