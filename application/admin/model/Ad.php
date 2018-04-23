<?php
namespace app\admin\model;

use think\Collection;
use think\Db;
use think\facade\Config;
use think\facade\Request;
use think\Model;

/**
 * @project  广告位模型
 * @author   千叶
 * @date     2018-04-14
 */
class Ad extends Model
{

	protected $name = 'ad';
	protected $autoWriteTimestamp = true;

	/**
	 * 根据类型获取广告
	 * @param $type
	 * @return array
	 */
	public function getAd($type)
	{
		$ads = $this->where("location={$type} AND status=1")->order('sort')->field('name,img')->select();
		Collection::make($ads)->each(function ($ad) {
			$ad['img'] = Request::domain() . '/uploads/' . $ad['img'];
			return $ad;
		});
		return $ads;
	}

	/**
	 * 广告图片添加
	 * @param $data
	 * @return array
	 */
	public function createAd($data)
	{
		$this->save($data);
		return ['code' => 1];
	}

	/**
	 * 修改广告
	 * @param $id
	 * @param $data
	 * @return array
	 */
	public function editAd($id, $data)
	{
		try {
			$this->where("id={$id}")->update($data);
			return ['code' => 1];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '修改失败：' . $e->getMessage()];
		}
	}

	/**
	 * 根据条件获取广告图片
	 * @param $map
	 * @param $cur_page
	 * @param $limits
	 * @return array
	 */
	public function getDataByWhere($map, $cur_page, $limits)
	{
		try {
			$count = $this->where($map)->count();
			$list = $this->where($map)->page($cur_page, $limits)->order('location,sort')->select();
			$json = [
				'code' => 0,
				'msg' => '',
				'count' => $count,
				'data' => $list
			];
			return $json;
		} catch (\Exception $e) {
			return ['code' => 404, 'msg' => $e->getMessage()];
		}
	}

	/**
	 * 根据广告ID获取单条广告数据
	 * @param $id
	 * @return array|bool|null|\PDOStatement|string|Model
	 */
	public function getDataById($id)
	{
		try {
			return Db::name($this->name)->where("id={$id}")->field(true)->find();
		} catch (\Exception $e) {
			Log::error('通过ID获取广告错误');
			return null;
		}
	}

	/**
	 * 修改状态（启用或者禁用）
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
			return ['code' => 0, 'msg' => $msg . '广告失败：' . $e->getMessage()];
		}
	}

	/**
	 * 位置获取器
	 * @param $value
	 * @return mixed
	 */
	public function getLocationAttr($value)
	{
		$status = [1 => '首页轮播', 2 => '内页'];
		return $status[$value];
	}
}
