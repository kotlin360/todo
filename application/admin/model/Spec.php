<?php
namespace app\admin\model;

use app\common\facade\Log;
use think\Db;
use think\facade\Config;
use think\Model;

/**
 * @project  商品规格模型
 * @author   千叶
 * @date     2018-03-28
 */
class Spec extends Model
{
	protected $name = 'goods_spec';

	// 开启自动写入时间
	protected $autoWriteTimestamp = true;

	/**
	 * 创建商品规格
	 * @param $data
	 * @return array
	 */
	public function createSpec($data)
	{
		try {
			// 将提交的中文逗号转换为英文的
			$data['value'] = str_replace('，', ',', $data['value']);
			$data['value'] = serialize(explode(',', $data['value']));
			$this->save($data);
			return ['code' => 1];
		} catch (\Exception $e) {
			Log::error($e->getMessage());
			return ['code' => 0, 'msg' => '创建失败，请稍后再试'];
		}
	}

	/**
	 * 商品规格修改
	 * @param $id
	 * @param $data
	 * @return array
	 */
	public function editSpec($id, $data)
	{
		try {
			// 将提交的中文逗号转换为英文的
			$data['value'] = str_replace('，', ',', $data['value']);
			$data['value'] = serialize(explode(',', $data['value']));
			$this->where("id={$id}")->update($data);
			return ['code' => 1];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '修改失败：' . $e->getMessage()];
		}
	}

	/**
	 * 修改商品规格状态（启用或者禁用）
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
			return ['code' => 0, 'msg' => $msg . '规格【' . $name . '】失败，请联系管理员'];
		}
	}

	/**
	 * 根据条件获取商品规格的列表和总数
	 * @param $map
	 * @param $cur_page
	 * @param $limits
	 * @return array|bool
	 */
	public function getDataByWhere($map, $cur_page, $limits)
	{
		try {
			$list = [];
			$count = $this->where($map)->count();
			$cursor = $this->where($map)->page($cur_page, $limits)->cursor();
			foreach ($cursor as $v) {
				$v['value'] = rtrim(implode(unserialize($v['value']), ','), ',');
				$list[] = $v;
			}
			$json = [
				'code' => 0,
				'msg' => '',
				'count' => $count,
				'data' => $list
			];
			return $json;
		} catch (\Exception $e) {
			Log::error($e->getMessage());
			return ['code' => 404, 'msg' => '数据查询异常,请联系管理员'];
		}
	}

	/**
	 * 根据id获取商品某个商品规格
	 * @param $id
	 * @return array|null
	 */
	public function getDataById($id)
	{
		try {
			$spec = Db::name($this->name)->where("id={$id}")->findOrFail();
			$spec['value'] = implode(unserialize($spec['value']), ',');
			return $spec;
		} catch (\Exception $e) {
			Log::error('根据id获取商品某个商品规格');
			return null;
		}
	}

	/**
	 * 获取系统中所有的有效商品规格
	 * @return array|null
	 */
	public function getAllSpec()
	{
		try {
			$spec = Db::name($this->name)->where('status=1')->field('id,name,note,value')->select();
			foreach ($spec as $k => $v) {
				$values['s' . $v['id']] = unserialize($v['value']);
				unset($v['value']);
			}
			return ['names' => $spec, 'values' => $values];
		} catch (\Exception $e) {
			return null;
		}
	}

}
