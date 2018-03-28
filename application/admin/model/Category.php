<?php
namespace app\admin\model;

use app\common\facade\Log;
use think\Db;
use think\facade\Config;
use think\Model;

/**
 * @project  商品分类模型
 * @author   千叶
 * @date     2018-03-28
 */
class Category extends Model
{
	protected $name = 'goods_category';

	// 开启自动写入时间
	protected $autoWriteTimestamp = true;

	/**
	 * 创建商品分类
	 * @param $data
	 * @return array
	 */
	public function createCate($data)
	{
		try {
			$this->save($data);
			return ['code' => 1];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '创建失败：' . $e->getMessage()];
		}
	}

	/**
	 * 商品分类修改
	 * @param $id
	 * @param $data
	 * @return array
	 */
	public function editCate($id, $data)
	{
		try {
			$this->where("id={$id}")->update($data);
			return ['code' => 1];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '修改失败：' . $e->getMessage()];
		}
	}

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
			$list = $this->where($map)->page($cur_page, $limits)->order('sort')->select();
			$json = [
				'code' => 0,
				'msg' => '',
				'count' => $count,
				'data' => $list
			];
			return $json;
		} catch (\Exception $e) {
			Log::error('根据条件获取商品分类的列表和总数');
			return ['code' => 404, 'msg' => $e->getMessage()];
		}
	}

	/**
	 * 根据商品分类ID获取单条商品分类数据
	 * @param $id
	 * @return array|bool|null|\PDOStatement|string|Model
	 */
	public function getDataById($id)
	{
		try {
			return Db::name($this->name)->where("id={$id}")->field(true)->find();
		} catch (\Exception $e) {
			Log::error('通过ID获取商品分类错误');
			return null;
		}
	}

	/**
	 * 修改商品分类状态（启用或者禁用）
	 * @param $id
	 * @param $status
	 * @return array
	 */
	public function changeStatus($id, $status)
	{
		$msg = $status == 1 ? '禁用' : '启用';
		try {
			$tableName = Config::get('database.prefix') . $this->name;
			$name = Db::name('goods_category')->where("id={$id}")->value('cate_title');
			$sql = "UPDATE {$tableName} SET status = (case status when 0 then 1 else 0  end) WHERE id={$id}";
			Db::execute($sql);
			return ['code' => 1];
		} catch (\Exception $e) {
			Log::error("{$msg}商品分类{$name}失败," . $e->getMessage());
			return ['code' => 0, 'msg' => $msg . '分类【' . $name . '】失败，请联系管理员'];
		}
	}
}
