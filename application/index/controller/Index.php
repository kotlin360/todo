<?php
namespace app\index\controller;

use think\Controller;
use think\Db;

class Index extends Controller
{
	public function index()
	{
		$this->redirect(url('admin/index/index'));
	}
}
