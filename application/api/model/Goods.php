<?php
namespace app\api\model;

use app\api\facade\Ad as AdFacade;
use think\Collection;
use think\Db;
use think\facade\Config;
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
	 * @param $page
	 * @param $style 1 获取商品和图片  2获取纯商品
	 * @return array
	 */
	public function getGoods($location, $page, $style)
	{
		$self = $this;
		$where = 'status=1';
		$pageSize = Config::get('weixinSize');
		$start = ($page - 1) * $pageSize;
		if ($location != 0) {
			$where = "location={$location} AND status=1";
		}
		try {
			$goods = $this->where($where)->limit($start, $pageSize)
				->field('id,title,is_pay_score,spec_id')->select();
			$goodsList = Collection::make($goods)->each(function ($g) use ($self) {
				return $self->getGoodsSomeproperty($g);
			})->toArray();
			if ($style == 1) {
				// 获取首页顶部的轮播图片
				$ads = AdFacade::getAd(1);
				return ['code' => 1, 'pageSize' => $pageSize, 'data' => ['goodsList' => $goodsList, 'ads' => $ads]];
			}
			return ['code' => 1, 'pageSize' => $pageSize, 'data' => ['goodsList' => $goodsList]];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '获取商品失败：' . $e->getMessage()];
		}
	}

	/**
	 * 根据商品id和规格id返回商品详情
	 * @param $id
	 * @param $pid
	 * @return array
	 */
	public function detail($id, $pid)
	{
		try {
			// 商品基本信息
			$goods = Db::name('goods')->where("id={$id}")->field(true)->find();
			// 商品图册
			$album = Db::name('goods_images')->where("goods_id={$id}")->order('id')->field('img')->select();
			$goods['album'] = Collection::make($album)->each(function ($img) {
				return Request::domain() . '/uploads/' . $img['img'];
			})->toArray();
			// 获取商品规格
			if ($goods['specs'] === null) {
				// 没有规格，获得商品的扩展属性
				$goods['extend'] = Db::name('goods_products')->where("id={$pid} AND is_online=1")
					->field('id as pid,stock,style,cash,score,freight')->find();
				if (!$goods['extend']) {
					return ['code' => 0, 'msg' => '您访问的商品已经下架'];
				}
			} else {
				$goods['specs'] = unserialize($goods['specs']);
				// 存在多规格
				$extends = Db::name('goods_products')->where("goods_id={$id} AND is_online=1")
					->field('pid,stock,style,cash,score,freight')->select();
				if (!$extend) {
					return ['code' => 0, 'msg' => '您访问的商品已经下架'];
				}
				Collection::make($extends)->each(function ($extend) {
					$skumap[$extend['specs_key']] = $extend;
				});
			}
			return ['code' => 1, 'data' => $goods];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '商品详情获取失败：' . $e->getMessage()];
		}
	}

	/**
	 * 获取商品分类和商品明细
	 * @param $id
	 * @return array
	 */
	public function getCategory($id)
	{
		try {
			$categorys = Db::name('goods_category')->where('status=1')->order('sort')
				->field('id,name')->select();
			// 获取第一个分类下的所有商品
			$cateId = $id === 0 ? $categorys[0]['id'] : $id;
			$cursor = Db::name('goods')->where("cate_id={$cateId} AND status=1")->field('id,title,is_pay_score,spec_id')->cursor();
			foreach ($cursor as $g) {
				$categorys[0]['goods'][] = $this->getGoodsSomeproperty($g);
			}
			$ads = AdFacade::getAd(2);
			return ['code' => 1, 'data' => ['categorys' => $categorys, 'ads' => $ads]];
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
			$spec = Db::name('goods_products')->where("id='{$g['spec_id']}' AND is_online=1 AND is_delete=0")
				->field('id as pid,style,cash,score')->find();
		} else {
			// 此商品纯粹价格购买
			$spec = Db::name('goods_products')->where("goods_id={$g['id']} AND is_online=1 AND is_delete=0")
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
