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
		Db::startTrans();
		try {
			// 将提交的中文逗号转换为英文的，切割为数组
			$valueArray = explode(',', str_replace('，', ',', trim($data['value'])));
			unset($data['value']);
			$this->save($data);
			$lastId = $this->getLastInsID();
			$spec_value_array = []; // 此值需要插入到表think_goods_spec,需要序列化
			$spec_value_list = []; // 此值需要插入到表think_goods_spec_value
			foreach ($valueArray as $k => $v) {
				$spec_value_list [] = [
					'spec_id' => $lastId,
					'name' => $v,
					'sort' => ++$k
				];
			}
			Db::name('goods_spec_value')->insertAll($spec_value_list);
			// 此处获取刚刚插入到goods_spec_value的id数组，此数组跟$valueArray长度一致
			$value_id_array = Db::name('goods_spec_value')->where("spec_id={$lastId}")
				->order('sort')->field('id')->select();
			foreach ($value_id_array as $k => $v) {
				$spec_value_array[] = ['id' => $v['id'], 'name' => $valueArray[$k]];
			}
			// 再次更新到表think_goods_spec
			$this->save(['value' => serialize($spec_value_array)], ['id' => $lastId]);
			Db::commit();// 提交事务
			return ['code' => 1];
		} catch (\Exception $e) {
			Db::rollback();
			Log::error($e->getMessage());
			return ['code' => 0, 'msg' => '创建失败，可能存在相同值！' . $e->getMessage()];
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
		Db::startTrans();
		try {
			$valueArray = explode(',', str_replace('，', ',', trim($data['value'])));
			$spec_value_list = [];
			$spec_value_array = [];
			foreach ($valueArray as $k => $v) {
				$spec_value_list [] = [
					'spec_id' => $id,
					'name' => $v,
					'sort' => ++$k,
				];
			}
			// 删除goods_spec_value表中存在数据，重新插入
			Db::name('goods_spec_value')->where("spec_id={$id}")->delete();
			Db::name('goods_spec_value')->insertAll($spec_value_list);
			// 此处获取刚刚插入到goods_spec_value的id数组，此数组跟$valueArray长度一致
			$value_id_array = Db::name('goods_spec_value')->where("spec_id={$id}")
				->order('sort')->field('id')->select();
			foreach ($value_id_array as $k => $v) {
				$spec_value_array[] = ['id' => $v['id'], 'name' => $valueArray[$k]];
			}
			$data['value'] = serialize($spec_value_array);
			// 再次更新到表think_goods_spec
			$this->save($data, ['id' => $id]);
			Db::commit();// 提交事务
			return ['code' => 1];
		} catch (\Exception $e) {
			Db::rollback();
			return ['code' => 0, 'msg' => '创建失败，可能存在相同值！' . $e->getMessage()];
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
				$names = array_column(unserialize($v['value']), 'name');
				$v['value'] = rtrim(implode($names, '，'));
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

			$valueArray = unserialize($spec['value']);
			$names = array_column($valueArray, 'name');
			$spec['value'] = implode($names, ',');
			return $spec;
		} catch (\Exception $e) {
			Log::error('根据id获取商品某个商品规格' . $e->getMessage());
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
				$spec[$k]['value'] = unserialize($v['value']);
			}
			return $spec;
		} catch (\Exception $e) {
			return null;
		}
	}

}
