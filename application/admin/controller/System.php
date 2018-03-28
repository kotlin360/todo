<?php
namespace app\admin\controller;

use think\Controller;

/**
 * @project  系统错误异常控制器
 * @author   千叶
 * @date     2018-03-28
 */
class System extends Controller
{
	/**
	 * 系统异常页面展示，主要用于layer弹窗
	 * @return mixed
	 */
	public function mistake()
	{
		return $this->fetch('public/mistake');
	}
}
