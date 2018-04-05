<?php
namespace app\admin\model;

use think\Db;
use think\facade\Config;
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
	 * @param $data
	 * @return array
	 */
	public function insertRole($data)
	{
		try {
			$result = $this->save($data);
			if (false === $result) {
				return ['code' => 0, 'msg' => '创建角色失败，请稍后再试'];
			} else {
				return ['code' => 1, 'msg' => '创建角色成功'];
			}
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '创建角色失败：' . $e->getMessage()];
		}
	}

	/**
	 * 修改角色信息
	 * @param $id
	 * @param $data
	 * @return array
	 */
	public function editRole($id, $data)
	{
		try {
			$this->where("id={$id}")->update($data);
			return ['code' => 1];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '修改角色失败：' . $e->getMessage()];
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

	/**
	 * 根据id获取auth_group表中的菜单角色信息，用于修改角色
	 * @param $id
	 * @return array|null|\PDOStatement|string|Model
	 */
	public function getRoleById($id)
	{
		return Db::name($this->name)->where("id={$id}")->field('id,title,status,rules')->find();
	}

	/**
	 * 修改角色状态（启用或者禁用）
	 * @param $id
	 * @param $status
	 * @return array
	 */
	public function changeStatus($id, $status)
	{
		$msg = $status == 1 ? '禁用' : '启用';
		try {
			$tableName = Config::get('database.prefix') . $this->name;
			$name = Db::name($this->name)->where("id={$id}")->value('title');
			$sql = "UPDATE {$tableName} SET status = (case status when 0 then 1 else 0  end) WHERE id={$id}";
			Db::execute($sql);
			return ['code' => 1];
		} catch (\Exception $e) {
			Log::error("{$msg}角色{$name}失败," . $e->getMessage());
			return ['code' => 0, 'msg' => $msg . '角色【' . $name . '】失败，请联系管理员'];
		}
	}

	/**
	 * 删除角色，删除之前需要判断此角色是否存在用户
	 * 如果存在，禁止删除；需要先到系统用户处解绑角色
	 * @param $id
	 * @return array
	 */
	public function del($id)
	{
		try {
			$uid = Db::name('auth_group_access')->where("group_id={$id}")->value('uid');
			if ($uid) {
				return ['code' => 0, 'msg' => '角色删除失败，此角色下存在用户信息'];
			} else {
				$this->where("id={$id}")->delete();
			}
			return ['code' => 1];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '角色删除失败：' . $e->getMessage()];
		}
	}
}