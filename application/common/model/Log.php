<?php
namespace app\common\model;

use think\facade\Request;
use think\Model;

class Log extends Model
{
	/**
	 * 普通记录
	 * @param $uid
	 * @param $username
	 * @param $description
	 */
	public function info($uid, $username, $description)
	{
		$data = [
			'admin_id' => $uid,
			'admin_name' => $username,
			'description' => $description,
			'status' => 1,
			'ip' => Request::ip(),
			'add_time' => $_SERVER['REQUEST_TIME'],
		];
		$this->insert($data);
	}

	/**
	 * 错误日志
	 * @param $uid
	 * @param $username
	 * @param $description
	 */
	public function error($uid, $username, $description)
	{
		$data = [
			'admin_id' => $uid,
			'admin_name' => $username,
			'description' => $description,
			'status' => 2,
			'ip' => Request::ip(),
			'add_time' => $_SERVER['REQUEST_TIME'],
		];
		$this->insert($data);
	}

}