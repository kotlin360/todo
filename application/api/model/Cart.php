<?php
namespace app\api\model;

use think\Collection;
use think\Db;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\exception\DbException;
use think\facade\Config;
use think\facade\Request;
use think\Model;

/**
 * @project  购物车接口模型
 * @author   千叶
 * @date     2018-04-21
 */
class Cart extends Model
{
	protected $name = 'cart';

	/**
	 * 购物车
	 * @param $uid
	 * @return array
	 */
	public function getCartList($uid)
	{
		try {
			$carts = Db::name($this->name)->alias('c')
				->join('goods g', 'c.goods_id=g.id', 'LEFT')
				->join('goods_products p', 'c.spec_id=p.id', 'LEFT')
				->where("c.uid={$uid}")
				->field('c.id as cart_id,c.num,c.spec_value_string,g.id as goods_id,g.status,g.title,p.id as pid,p.style,p.score,p.cash,p.is_online,p.is_delete')->select();
			$cartList = Collection::make($carts)->each(function ($cart) {
				$img = Db::name('goods_images')->where("goods_id={$cart['goods_id']}")->field('img')->order('id')->find();
				$is_delete = $cart['is_delete'];
				unset($cart['is_delete']);
				if (in_array(0, $cart, true) || $cart['pid'] === null || $is_delete == 1) {
					$cart['is_valid'] = 0;
				} else {
					$cart['is_valid'] = 1;
				}
				$cart['img'] = Request::domain() . '/uploads/' . $img['img'];
				unset($cart['is_online']);
				unset($cart['status']);
				return $cart;
			})->toArray();
			return ['code' => 1, 'data' => $cartList];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '购物车获取失败：' . $e->getMessage()];
		}
	}

	/**
	 * 加入购物车，写入购物车表
	 * @param $data
	 * @return array
	 */
	public function addCart($data)
	{
		$where = "id={$data['spec_id']} AND is_online=1 AND is_delete=0";
		$map = "uid={$data['uid']} AND goods_id = {$data['goods_id']} AND spec_id={$data['spec_id']}";
		try {
			// 首先判断该规格是否正常
			$spec = Db::name('goods_products')->where($where)->field('spec_sn,stock,spec_value_string')->find();
			if ($spec === null) {
				return ['code' => 0, 'msg' => '加入购物车失败，商品已经下架'];
			}
			$data['spec_value_string'] = $spec['spec_value_string'];
			// 其次判断在购物车是否已经存在，如果存在了就直接更新数量
			$cart = Db::name('cart')->where($map)->field('id,num')->find();
			if ($cart) {
				// 更新数量，判断库存是否超了
				if ($cart['num'] >= $spec['stock']) {
					return ['code' => 0, 'msg' => '购物车中已存在且达到库存量'];
				}
				Db::name('cart')->where($map)->setInc('num');;
			} else {
				// 写入购物车
				Db::name('cart')->insert($data);
			}
			return ['code' => 1];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '加入购物车失败：' . $e->getMessage()];
		}
	}

	/**
	 * 删除购物车中的某个商品
	 * @param int $uid 用户id
	 * @param int $id  购物车id
	 * @return array
	 */
	public function delCart($uid, $id)
	{
		try {
			Db::name('cart')->where("id={$id} AND uid={$uid}")->delete();
			return ['code' => 1];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '删除失败：' . $e->getMessage()];
		}
	}

	/**
	 * 购物车增加或者减少数量
	 * @param $uid
	 * @param $id
	 * @param $type $type 1减少 2增加
	 * @return array
	 */
	public function editNum($uid, $id, $type)
	{
		try {
			$cart = Db::name('cart')->where("id={$id}")->field(true)->find();
			switch ($type) {
				case 1:
					if (--$cart['num'] <= 0) {
						return ['code' => 0, 'msg' => '操作失败'];
					}
					$this->where("id={$id}")->setDec('num');
					break;
				case 2:
					$stock = Db::name('goods_products')->where("id={$cart['spec_id']}")->value('stock');
					if (++$cart['num'] > $stock) {
						return ['code' => 0, 'msg' => '购买数量已达到库存量'];
					}
					$this->where("id={$id}")->setInc('num');
					break;
				default:
					return ['code' => 0, 'msg' => '操作失败'];
			}
			return ['code' => 1];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '操作失败:' . $e->getMessage()];
		}
	}

}
