<?php
namespace app\api\model;

use app\api\facade\Ad as AdFacade;
use app\common\service\OpensslEncryptHelper;
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
		$where = "title like '%{$key}%' AND status=1";
		try {
			$goods = Db::name('goods')->where($where)->field('id,title,is_pay_score,spec_id')->select();
			if (!$goods) {
				return ['code' => 0, 'msg' => '没有搜索到任何商品信息'];
			}
			$goodsList = Collection::make($goods)->each(function ($g) {
				return $this->getGoodsSomeproperty($g);
			})->toArray();
			return ['code' => 1, 'data' => $goodsList];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '没有搜索到任何的商品'];
		}
	}

	/**
	 * 首页根据位置获取不同的商品信息  购买方式 1积分2现金 3组合
	 * @param $location
	 * @param $page
	 * @param $style 1 获取商品和顶部的轮播广告  2获取纯商品
	 * @return array
	 */
	public function getGoods($location, $page, $style)
	{
		$where = 'status=1';
		$pageSize = Config::get('weixinSize');
		$start = ($page - 1) * $pageSize;
		if ($location != 0) {
			$where = "location={$location} AND status=1";
		}
		try {
			$goods = $this->where($where)->limit($start, $pageSize)
				->field('id,title,is_pay_score,spec_id')->select();
			$goodsList = Collection::make($goods)->each(function ($g) {
				return $this->getGoodsSomeproperty($g);
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
	 * 获取纯积分商品
	 * @param $page
	 * @return array
	 */
	public function getScoreGoodsList($page)
	{
		$where = 'p.style = 1 AND p.is_online=1 AND p.stock >0 AND p.is_delete=0';
		$pageSize = Config::get('weixinSize');
		$start = ($page - 1) * $pageSize;
		try {
			$goods_ids = Db::name('goods_products')->alias('p')
				->join('goods g', 'g.id=p.goods_id', 'LEFT')
				->where($where)->limit($start, $pageSize)
				->field('g.id,g.title,p.id as pid,p.style,p.score')->select();
			$goodsList = Collection::make($goods_ids)->each(function ($g) {
				// 获取图片
				$img = Db::name('goods_images')->where("goods_id={$g['id']}")->order('id')->value('img_m');
				$g['img'] = Request::domain() . '/uploads/' . $img;
				return $g;
			})->toArray();
			return ['code' => 1, 'pageSize' => $pageSize, 'data' => ['goodsList' => $goodsList]];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '获取积分商品失败：' . $e->getMessage()];
		}
	}

	/**
	 * 根据商品id和规格id返回商品详情
	 * @param $token 当前用户的token数组，下标0用户uid 下标2是openid
	 * @param $id
	 * @param $pid
	 * @return array
	 */
	public function detail($token, $id, $pid)
	{
		try {

			// 获取两个优惠券
			$now = $_SERVER['REQUEST_TIME'];
			$where = "status=1 AND start <= {$now} AND end >= {$now}";
			$coupons = Db::name('coupon')->where($where)->limit(0, 2)->orderRand()->field('value,money')->select();
			$couponList = Collection::make($coupons)->each(function ($coupon) {
				return '满' . $coupon['money'] . '减' . $coupon['value'];
			});

			// 商品基本信息
			$goods = Db::name('goods')->where("id={$id} AND status=1")->field(true)->find();
			if (!$goods) {
				return ['code' => 0, 'msg' => '您访问的商品已经下架'];
			}

			// 商品图册
			$album = Db::name('goods_images')->where("goods_id={$id}")->order('id')->field('img')->select();
			$goods['album'] = Collection::make($album)->each(function ($img) {
				return Request::domain() . '/uploads/' . $img['img'];
			})->toArray();

			// 获取商品规格
			if ($goods['specs'] === null) {

				// 没有规格，获得商品的扩展属性
				$goods['extend'] = Db::name('goods_products')->where("id={$pid} AND is_online=1 AND is_delete=0")
					->field('id as pid,stock,style,cash,score,freight')->find();
				if (!$goods['extend']) {
					return ['code' => 0, 'msg' => '您访问的商品已经下架'];
				}

			} else {

				// 存在多规格
				$specsArray = unserialize($goods['specs']);
				$newSpecs = [];
				Collection::make($specsArray)->each(function ($item) use (&$newSpecs) {
					$item['child'] = array_values($item['value']);
					$item['child'] = array_map(function (&$v) {
						$v['selected'] = false;
						$v['disabled'] = false;
						return $v;
					}, $item['child']);
					unset($item['value']);
					$newSpecs[] = $item;
				})->toArray();

				$goods['specs'] = $newSpecs;

				// 获取商品规格
				$extends = Db::name('goods_products')->where("goods_id={$id} AND is_online=1 AND is_delete=0")
					->field('id as pid,spec_key,stock,style,cash,score,freight')->select();
				if (!$extends) {
					return ['code' => 0, 'msg' => '您访问的商品已经下架'];
				}

				// 对商品规格进行整理
				$currentGoods = []; // 获取当前的规格信息，用于前台展示
				$goods['extend'] = Collection::make($extends)->each(function ($extend) use ($pid, &$currentGoods) {
					if ($extend['pid'] == $pid) {
						$spec_key = trim($extend['spec_key'], ';');
						$spec_array = explode(';', $spec_key);
						$spec_result = [];
						foreach ($spec_array as $spec) {
							$specIdArray = explode(':', $spec);
							$spec_result[] = $specIdArray[1];
						}
						$currentGoods = $extend;
						$currentGoods['spec_key'] = $spec_result;
					}
					//$skumap[$extend['spec_key']] = $extend;
					//return $skumap;
					return $extend;
				})->toArray();

				$goods['extend'] = array_values($goods['extend']);

				if (!$currentGoods) {
					return ['code' => 0, 'msg' => '您访问的商品已经下架'];
				}

				$goods['currentGoods'] = $currentGoods;
			}

			//生成分享码，由用户uid + 商品id + 用户openid加密生成
			$goods['shareToken'] = OpensslEncryptHelper::encrypt($token[0] . '|' . $id . '|' . rand(100, 999));
			$goods['coupon'] = $couponList;

			return ['code' => 1, 'data' => $goods];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '商品详情获取失败：' . $e->getMessage()];
		}
	}

	/**
	 * 获取商品分类和商品明细
	 * @param $cid
	 * @param $page
	 * @return array
	 */
	public function getCategory($cid, $page)
	{
		$size = Config::get('weixinSize');
		$start = ($page - 1) * $size;
		$goodsList = [];
		try {
			$categorys = Db::name('goods_category')->where('status=1')->order('sort')
				->field('id,name')->select();

			// 给每个分类增加空的商品信息，前台判断长度用
			$categoryList = array_reduce($categorys, function ($result, $item) {
				$item['goods'] = [];
				$result[$item['id']] = $item;
				return $result;
			}, []);

			// 获取第一个分类数组
			reset($categoryList);
			$first = current($categoryList);
			reset($categoryList);

			// 获取指定分类下的商品
			$cateId = $cid === 0 ? $first['id'] : $cid;

			$goods = Db::name('goods')->where("cate_id={$cateId} AND status=1")
				->field('id,title,is_pay_score,spec_id')->limit($start, $size)->select();
			foreach ($goods as $g) {
				$goodsList[] = $this->getGoodsSomeproperty($g);
			}

			$categoryList[$cateId]['goods'] = $goodsList;

			$ads = AdFacade::getAd(2);
			return ['code' => 1, 'data' => ['categorys' => $categoryList, 'ads' => $ads], 'pageSize' => $size];
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
