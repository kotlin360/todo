<?php
namespace app\api\controller;

use app\api\model\Cart as CartModel;

/**
 * @project  购物车接口控制器
 * @author   千叶
 * @date     2018-04-21
 */
class Cart extends Base
{
	/**
	 * 购物车
	 * @param CartModel $cartModel
	 * @return \think\response\Json
	 */
	public function get_cart_list(CartModel $cartModel)
	{
		return json($cartModel->getCartList($this['auth']['uid']));
	}

	/**
	 * 添加购物车
	 * @param CartModel $cartModel
	 * @return \think\response\Json
	 */
	public function add_cart(CartModel $cartModel)
	{
		$data = [];
		return json($cartModel->addCart($this['auth']['uid']), $data);
	}

	/**
	 * 从购物车中删除商品
	 * @param CartModel $cartModel
	 * @return \think\response\Json
	 */
	public function del_cart(CartModel $cartModel)
	{
		$id = input('id/d', 0);
		return json($cartModel->delCart($this['auth']['uid'], $id));
	}
}
