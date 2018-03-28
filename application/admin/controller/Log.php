<?php
namespace app\admin\controller;

use app\admin\model\Log as LogModel;
use think\Db;
use think\facade\Config;

class Log extends Base
{
	/**
	 * 日志列表
	 * @param LogModel $logModel
	 * @return mixed|\think\response\Json
	 */
	public function index(LogModel $logModel)
	{
		if ($this->request->isAjax()) {
			$cur_page = input('page', 1, 'intval');
			$keyword = input('keyword', '', 'urldecode');
			$page_size = input('limit', Config::get('page_size'), 'intval');
			$map = $keyword ? "is_del = 1 and admin_name like '%{$keyword}%'" : 'is_del = 1';
			$json = $logModel->getDataByWhere($map, $cur_page, $page_size);
			return json($json);
		} else {
			$page_size = Config::get('page_size');
			return $this->assign('page_size', $page_size)->fetch();
		}
	}

	/**
	 * 单条删除日志
	 * @return \think\response\Json
	 */
	public function del()
	{
		$log_id = input('log_id', '');
		try {
			if (strpos($log_id, ',') === false) {
				// 单个删除
				Db::name('log')->where("log_id={$log_id}")->setField('is_del', 0);
			} else {
				// 批量删除
				Db::name('log')->where('log_id', 'in', $log_id)->data(['is_del' => 0])->update();
			}
			return json(['code' => 1]);
		} catch (\Exception $e) {
			return json(['code' => 0, 'msg' => '日志删除失败，请稍后再试']);
		}
	}
}
