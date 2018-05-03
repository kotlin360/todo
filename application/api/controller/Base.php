<?php
namespace app\api\controller;

/**
 * @project  接口基类
 * @author   千叶
 * @date     2018-04-16
 */
class Base implements \ArrayAccess
{

	public $elements;

	public function __construct()
	{
		$authUser = input('token', '');
		if ($authUser) {
			$token = explode('|', authcode($authUser));
			$this['auth'] = [
				'uid' => $token[0],
				'username' => $token[1],
				'openid' => $token[2],
			];
		} else {
			return ['code' => 0, 'msg' => '您尚未登录小程序，请登录'];
		}
	}

	public function offsetExists($offset)
	{
		return isset($this->elements[$offset]);
	}

	public function offsetSet($offset, $value)
	{
		$this->elements[$offset] = $value;
	}

	public function offsetGet($offset)
	{
		return $this->elements[$offset];
	}

	public function offsetUnset($offset)
	{
		unset($this->elements[$offset]);
	}
}