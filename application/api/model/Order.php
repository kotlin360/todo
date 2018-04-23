<?php
namespace app\api\model;

use think\Model;
use think\Db;
use app\common\facade\Param as ParamFacade;
use app\api\facade\Score as ScoreFacade;

/**
 * @project  订单接口模型
 * @author   千叶
 * @date     2018-04-23
 */
class Order extends Model
{

	public function getOrderInfo($uid)
	{
		// 获取用户积分和现金余额
		ScoreFacade::total();
		// 获取积分兑换率
		$param = ParamFacade::getSystemParam();
		return ['code' => 1, 'cash2score_rate' => $param['config_cash2score_rate']];

	}

	public function buildOrder()
	{

	}

	/**
	 * 生成订单号
	 * @return string
	 */
	public function build_order_no()
	{
		$date = date('Ymd');
		Db::startTrans();
		try {
			$sequence = Db::name('order_sequence')->lock(true)->where("update_day={$date}")->value('sequence');
			if ($sequence) {
				// 存在今天的
				++$sequence;
				Db::name('order_sequence')->where("update_day={$date}")->setInc('sequence');
			} else {
				$sequence = 1;
				Db::name('order_sequence')->insert(['sequence' => $sequence, 'update_day' => $date]);
			}
			Db::commit();
			return $date . str_pad($sequence, 6, 0, STR_PAD_LEFT);
		} catch (\Exception $e) {
			Db::rollback();
			return build_order_no();
		}
	}
}