<?php
namespace app\common\model;

use think\facade\Request;
use think\facade\Session;
use think\Model;

class Log extends Model
{
	/**
	 * 普通记录
	 * @param      $description
	 * @param null $uid
	 */
	public function info($description, $uid = null)
	{
		$uid = $uid == null ? Session::get('auth.uid') : $uid;
		$data = [
			'admin_id' => $uid,
			'description' => $description,
			'status' => 1,
			'ip' => Request::ip(),
			'add_time' => time(),
		];
		$this->insert($data);
	}

	/**
	 * 错误日志
	 * @param      $description
	 * @param null $uid
	 */
	public function error($description, $uid = null)
	{
		$uid = $uid == null ? Session::get('auth.uid') : $uid;
		$data = [
			'admin_id' => Session::get('auth.uid'),
			'description' => $description,
			'status' => 2,
			'ip' => Request::ip(),
			'add_time' => time(),
		];
		$this->insert($data);
	}

}