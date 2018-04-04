<?php
namespace app\admin\model;

use think\Db;
use think\Facade\Config;
use think\Model;

/**
 * @project  前台用户模型
 * @author   千叶
 * @date     2018-04-03
 */
class User extends Model
{

	protected $name = 'user';

	// 开启自动写入时间
	protected $autoWriteTimestamp = true;

	/**
	 * 根据条件获取商品分类的列表和总数
	 * @param $map
	 * @param $cur_page
	 * @param $limits
	 * @return array
	 */
	public function getDataByWhere($map, $cur_page, $limits)
	{
		try {
			$count = $this->where($map)->count();
			$list = $this->where($map)->page($cur_page, $limits)->order('id desc')->field(true)->select();
			$json = [
				'code' => 0,
				'msg' => '',
				'count' => $count,
				'data' => $list
			];
			return $json;
		} catch (\Exception $e) {
			return ['code' => 404, 'msg' => '获取用户列表失败：' . $e->getMessage()];
		}
	}

	/**
	 * 修改前台用户状态（启用或者禁用）
	 * @param $id
	 * @param $status
	 * @return array
	 */
	public function changeStatus($id, $status)
	{
		$msg = $status == 1 ? '禁用' : '启用';
		try {
			$tableName = Config::get('database.prefix') . $this->name;
			$sql = "UPDATE {$tableName} SET status = (case status when 0 then 1 else 0  end) WHERE id={$id}";
			Db::execute($sql);
			return ['code' => 1];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => $msg] . '失败:' . $e->getMessage();
		}
	}
}
