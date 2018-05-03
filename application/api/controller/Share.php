<?php

namespace app\api\controller;

use app\api\model\Share as ShareModel;

/**
 * @project  分享商品
 * @author   千叶
 * @date     2018-05-02
 */
class Share extends Base
{
	/**
	 * 分享商品
	 * @param ShareModel $shareModel
	 * @return \think\response\Json
	 */
	public function share_goods(ShareModel $shareModel)
	{
		return json($shareModel->shareGoods($this['auth']['uid']));
	}

	/**
	 * 分享的客户购买赠送积分
	 * @param ShareModel $shareModel
	 * @return \think\response\Json
	 */
	public function purchase_goods(ShareModel $shareModel)
	{
		// 分享人token
		$shareUserToken = input('origin', '');
		return json($shareModel->shareGoods($this['auth']['uid']), $shareUserToken);
	}
}
