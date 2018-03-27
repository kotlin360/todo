<?php
namespace app\admin\controller;

use app\admin\model\Admin as AdminModel;
use think\facade\Config;

/**
 * @project  系统用户管理控制器
 * @author   千叶
 * @date     2018-03-27
 */
class Admin extends Base
{
	/**
	 * 系统用户列表 或者异步加载用户数据
	 * @return mixed
	 */
	public function index(AdminModel $adminModel)
	{
		if ($this->request->isAjax()) {
			$keyword = input('keyword', '', 'urldecode');
			$map = [];
			if ($keyword && $keyword !== '') {
				$map['title'] = ['title', 'like', '%' . $keyword . '%'];
			}
			$cur_page = input('page', 1, 'intval');
			$page_size = input('limit', Config::get('page_size'), 'intval');
			$roleList = $adminModel->getUserByWhere($map, $cur_page, $page_size);
			$count = Db::name('admin')->where($map)->count();
			$json = [
				'code' => 0,
				'msg' => '',
				'count' => $count,
				'data' => $roleList,
				'curPage' => $cur_page
			];
			return json($json);
		} else {
			$page_size = Config::get('page_size');
			return $this->assign('page_size', $page_size)->fetch();
		}
	}
}
