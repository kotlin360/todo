<?php
namespace app\api\model;

use think\Collection;
use think\Db;
use think\facade\Request;
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

	/**
	 * 首页根据位置获取不同的商品信息  购买方式 1积分2现金 3组合
	 * @param $location
	 * @return array
	 */
	public function getGoods($location)
	{
		$self = $this;
		$where = 'status=1';
		if ($location != 0) {
			$where = "location={$location} AND status=1";
		}
		try {
			$goods = $this->where($where)->field('id,title,is_pay_score,spec_id')->select();
			$goodsList = Collection::make($goods)->each(function ($g) use ($self) {
				return $self->getGoodsSomeproperty($g);
			})->toArray();
			return ['code' => 1, 'data' => $goodsList];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '获取商品失败：' . $e->getMessage()];
		}
	}

	/**
	 * 获取商品分类和第一个分类下的商品明细
	 */
	public function getCategory()
	{
		try {
			$categorys = Db::name('goods_category')->where('status=1')->order('sort')
				->field('id,name')->select();
			// 首先获取第一个分类下的所有商品
			$firstCateId = $categorys[0]['id'];
			$cursor = Db::name('goods')->where("cate_id={$firstCateId} AND status=1")->field('id,title,is_pay_score,spec_id')->cursor();
			foreach ($cursor as $g) {
				$categorys[0]['goods'][] = $this->getGoodsSomeproperty($g);
			}
			return ['code' => 1, 'data' => $categorys];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '分类获取失败：' . $e->getMessage()];
		}
	}

	/**
	 * 根据从goods表中查询出的单条商品获取商品图片和价格等属性
	 * @param $g
	 * @return mixed
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	private function getGoodsSomeproperty($g)
	{
		// 获取图片
		$img = Db::name('goods_images')->where("goods_id={$g['id']}")->order('id')->value('img_m');
		$g['img'] = Request::domain() . '/uploads/' . $img;
		// 获取价格或者积分
		if ($g['is_pay_score'] == 1) {
			// 此商品存在积分兑换的可能，优先显示积分兑换
			$spec = Db::name('goods_products')->where("id='{$g['spec_id']}' AND is_online=1")
				->field('id as pid,style,cash,score')->find();
		} else {
			// 此商品纯粹价格购买
			$spec = Db::name('goods_products')->where("goods_id={$g['id']} AND is_online=1")
				->order('cash')
				->field('id as pid,style,cash,score')->find();
		}
		$g['pid'] = $spec['pid'];
		$g['style'] = $spec['style'];
		$g['cash'] = $spec['cash'];
		$g['score'] = $spec['score'];
		unset($g['is_pay_score']);
		unset($g['spec_id']);
		return $g;
	}

}
