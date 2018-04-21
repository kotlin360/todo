<?php
namespace app\api\model;

use think\Collection;
use think\Db;
use think\Exception;
use think\exception\PDOException;
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

	/**
	 * 购物车
	 * @param $uid
	 * @return array
	 */
	public function getCartList($uid)
	{
		try {
			$imgTable = Config::get('database.prefix') . 'goods_images';
			$carts = Db::name($this->name)->alias('c')
				->join('goods g', 'c.goods_id=g.id', 'LEFT')
				->join('goods_products p', 'c.spec_id=p.id', 'LEFT')
				->where("c.uid={$uid}")
				->field('c.id as cart_id,c.num,c.spec_value_string,g.id as goods_id,g.status,g.title,p.id as pid,p.is_online')->select();
			$cartList = Collection::make($carts)->each(function ($cart) {
				$img = Db::name('goods_images')->where("goods_id={$cart['goods_id']}")->field('img')->order('id')->find();
				if (in_array(0, $cart, true) || $cart['pid'] === null) {
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

	public function addCart()
	{

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
}
