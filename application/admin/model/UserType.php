<?php
namespace app\admin\model;

use think\Collection;
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
		$info = ['title' => '', 'rules' => ''];
		if ($id == 1) {
			return ['title' => '超级管理员', 'rules' => ''];
		}

		// 获取当前用户的角色组ID，可能有多个
		$authGroupAccess = Db::name('auth_group_access')->where("uid={$id}")->field('group_id')->select();
		$authString = array_reduce($authGroupAccess, function ($authString, $item) {
			$authString .= $item['group_id'] . ',';
			return $authString;
		}, '');
		$authString = substr($authString, 0, -1);

		// 根据角色组ID获取角色信息，比方角色名称、角色菜单ID等
		$rules = Db::name('auth_group')->where("id in({$authString}) AND status=1")->select();
		$info['title'] = join('，', array_column($rules, 'title'));
		$info['rules'] = join(',', array_column($rules, 'rules'));

		$rulesArray = explode(',', $info['rules']);
		$info['rules'] = join(',', array_unique($rulesArray));
		return $info;

	}

	/**
	 * 插入角色信息，这里收到的$data['rules']全部都是第三级别的
	 * @param $data
	 * @return array
	 */
	public function insertRole($data)
	{
		try {
			// 获取全部的第二级别
			$seconds = Db::name('auth_rule')->where("id in({$data['rules']}) AND level=3")->field("pid")->select();
			$secondRules = array_unique(array_column($seconds, 'pid'));
			$secondString = join(',', $secondRules);

			// 获取全部的第一级别
			$first = Db::name('auth_rule')->where("id in({$secondString}) AND level=2")->field("pid")->select();
			$firstRules = array_unique(array_column($first, 'pid'));
			$firstString = join(',', $firstRules);

			$data['rules'] .= ',' . $secondString . ',' . $firstString;
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
			$thirdRules = $data['rules']; // 第三层权限 是数组
			$thirdString = join(',', $thirdRules);
			// 获取全部的第二级别
			$seconds = Db::name('auth_rule')->where("id in({$thirdString}) AND level=3")->field("pid")->select();
			$secondRules = array_unique(array_column($seconds, 'pid'));
			$secondString = join(',', $secondRules);

			// 获取全部的第一级别
			$first = Db::name('auth_rule')->where("id in({$secondString}) AND level=2")->field("pid")->select();
			$firstRules = array_unique(array_column($first, 'pid'));

			$rules = array_unique(array_merge($firstRules, $secondRules, $thirdRules));

			$data['rules'] = join(',', $rules);

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