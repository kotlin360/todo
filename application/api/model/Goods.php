<?php
namespace app\api\model;

use think\Collection;
use think\Db;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\DbException;
use think\Model;

/**
 * @project  商品接口模型
 * @author   千叶
 * @date     2018-04-16
 */
class Goods extends Model
{
	/**
	 * 商品搜索
	 * @param $key
	 * @return array
	 */
	public function search($key)
	{
		$where = "title like '{$key}' AND status=1";
		try {
			$goods = $this->where($where)->field(true)->select();
			$goods->each(function ($g) {
				// 获取图片
				$img = Db::name('goods_images')->where("goods_id={$g['id']}")->order('id')->value('img');
				$g['img'] = $img;
				// 获取价格
			});
			return ['code' => 1, 'data' => $goods];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '没有搜索到任何的商品'];
		}
	}

	public function getGoods($location)
	{
		$where = "location={$location} AND status=1";
		try {
			$goods = $this->where($where)->field('id,title,is_score')->select();
			$goods->each(function ($g) {
				// 获取图片
				$img = Db::name('goods_images')->where("goods_id={$g['id']}")->order('id')->value('img');
				$g['img'] = '/uploads/' . $img;
				// 获取价格或者积分
			});
			return ['code' => 1, 'data' => $goods];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '获取商品失败：' . $e->getMessage()];
		}
	}
}
