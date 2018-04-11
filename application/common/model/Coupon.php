<?php
namespace app\common\model;

use think\Db;
use think\facade\Config;
use think\Model;

/**
 * @project  用户优惠券模型
 * @author   千叶
 * @date     2018-04-11
 */
class Coupon extends Model
{
	/**
	 * 获取优惠券记录
	 * @param     $id
	 * @param int $page
	 * @return array|null
	 */
	public function getLog($id, $page = 1)
	{
		$size = Config::get('flowsize');
		$start = ($page - 1) * $size;
		try {
			$coupon = Db::name('coupon_log')->where("uid={$id}")->order('id DESC')->limit($start, $size)->select();
			foreach ($coupon as $k => $v) {
				if ($v && ($v['end'] < time())) {
					$v['expire'] = 1;
				} else {
					$v['expire'] = 0;
				}
				$coupon[$k] = $v;
			}
			return $coupon;
		} catch (\Exception $e) {
			return null;
		}
	}
}
