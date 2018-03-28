<?php
namespace app\admin\model;

use think\Db;
use think\Model;

/**
 * @project  用户角色模型
 * @author   千叶
 * @date     2018-03-28
 */
class UserType extends Model
{
	protected $name = 'auth_group';

	// 开启自动写入时间戳字段
	protected $autoWriteTimestamp = true;

	/**
	 * 根据条件获取角色列表信息
	 * @param $map
	 * @param $cur_page
	 * @param $limits
	 * @return array
	 */
	public function getDataByWhere($map, $cur_page, $limits)
	{
		try {
			$count = $this->where($map)->count();
			$list = $this->where($map)->page($cur_page, $limits)->order('id desc')->select();
			$json = [
				'code' => 0,
				'msg' => '',
				'count' => $count,
				'data' => $list
			];
			return $json;
		} catch (\Exception $e) {
			Log::error('根据条件获取角色列表信息');
			return ['code' => 404, 'msg' => '系统异常，请稍后再试'];
		}
	}

	/**
	 * 根据条件获取所有的角色数量
	 * @param $where
	 * @return int|string
	 */
	public function getAllRole($where)
	{
		return $this->where($where)->count();
	}

	/**
	 * 获取角色信息
	 * @param $id
	 */
	public function getRoleInfo($id)
	{
		// 一个管理员可能属于多个角色组
		$sql = "SELECT ag.title FROM think_auth_group ag where id in
	(SELECT group_id FROM think_auth_group_access  aga WHERE aga.uid = {$id}";
		$groups = Db::query($sql);
		p($groups);
		die;
//		$result = Db::name('auth_group')->where('id', $id)->find();
//		if (empty($result['rules'])) {
//			$where = '';
//		} else {
//			$where = 'id in(' . $result['rules'] . ')';
//		}
//		$res = Db::name('auth_rule')->field('name')->where($where)->select();
//		foreach ($res as $key => $vo) {
//			if ('#' != $vo['name']) {
//				$result['name'][] = $vo['name'];
//			}
//		}
//		return $result;
	}

	/**
	 * 插入角色信息
	 * @param $param
	 * @return array
	 */
	public function insertRole($param)
	{
		try {
			$result = $this->save($param);
			if (false === $result) {
				return ['code' => 0, 'msg' => $this->getError()];
			} else {
				return ['code' => 1, 'msg' => '添加角色成功'];
			}
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => $e->getMessage()];
		}
	}

	/**
	 * 获取系统所有的角色名称和id，除了系统管理
	 * @return array
	 */
	public function getAllSystemRoles()
	{
		$where = [
			'id' => ['id', '<>', '1'],
			'status' => ['status', '=', '1'],
		];
		try {
			return Db::name($this->name)->where($where)->field('id,title')->select();
		} catch (\Exception $e) {
			return null;
		}
	}
}