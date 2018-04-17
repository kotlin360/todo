<?php
namespace app\api\controller;

use app\admin\model\Ad as AdMole;
use think\Controller;
use think\facade\Config;
use think\Request;

/**
 * @project  广告接口
 * @author   千叶
 * @date     2018-04-14
 */
class Ad
{
	/**
	 * 根据类型获取广告轮播图片
	 * @param AdMole $adModel
	 * @param        $type 1首页轮播 2内页轮播
	 * @return \think\response\Json
	 */
	public function get_ad(AdMole $adModel, $type)
	{
		return json($adModel->getAd($type));
	}
	
}
