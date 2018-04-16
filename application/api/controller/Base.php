<?php
namespace app\api\controller;

class Base implements \ArrayAccess
{

	public $elements;

	public function __construct()
	{
		$authUser = input('token', '');
		if ($authUser) {
			$this['auth'] = authcode($authUser);
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