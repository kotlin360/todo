<?php
namespace app\admin\model;

use think\Db;
use think\Model;

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
	 * @return array|\PDOStatement|string|\think\Collection
	 * @throws \think\exception\DbException
	 * @throws db\exception\DataNotFoundException
	 * @throws db\exception\ModelNotFoundException
	 */
	public function getRoleByWhere($map, $cur_page, $limits)
	{
		return $this->where($map)->page($cur_page, $limits)->order('id desc')->select();
	}

	/**
	 * [getRoleByWhere 根据条件获取所有的角色数量]
	 */
	public function getAllRole($where)
	{
		return $this->where($where)->count();
	}

	/**
	 * [getRoleInfo 获取角色信息]
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
	 * [insertRole 插入角色信息]
	 * @author [田建龙] [864491238@qq.com]
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
		return Db::name($this->name)->where($where)->field('id,title')->select();
	}
}