<?php
namespace app\admin\model;

use think\Model;

class Log extends Model
{
	protected $pk = 'log_id';

	public function getLogByWhere($map, $cur_page, $limits)
	{
		return $this->where($map)->page($cur_page, $limits)->order('log_id desc')->select();
	}
}
