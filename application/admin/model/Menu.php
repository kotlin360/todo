<?php
namespace app\admin\model;

use app\common\facade\Log;
use think\Db;
use think\facade\Cache;
use think\Model;

/**
 * @project  菜单模型
 * @author   千叶
 * @date     2018-03-28
 */
class Menu extends Model
{

	protected $name = 'auth_rule';

	// 开启自动写入时间戳字段
	protected $autoWriteTimestamp = true;

	/**
	 * 获取全部菜单
	 * @param int $floor 如果$floor=2,只返回2层，如果3就返回3层的树
	 */
	public function getAllMenu($floor)
	{

		$where = '';
		if ($floor == 2) {
			$where = "level <= $floor AND status=1";
		}
		$menus = Db::name($this->name)->where($where)->order('sort')
			->field(true)->select();
		$menuTree = $this->makeMenuTree($menus);

		return $menuTree;
	}

	/**
	 * 生成菜单树
	 * @param        $menus
	 * @param string $lefthtml
	 * @param int    $pid
	 * @param int    $lvl
	 * @param int    $leftpin
	 * @return array
	 */
	public function makeMenuTree($menus, $lefthtml = '---', $pid = 0, $lvl = 0, $leftpin = 0)
	{
		$tree = [];
		foreach ($menus as $v) {
			if ($v['pid'] == $pid) {
				$v['lvl'] = $lvl + 1;
				$v['leftpin'] = $leftpin + 4;//左边距
				$v['lefthtml'] = $v['pid'] === 0 ? '' : '|' . str_repeat($lefthtml, $lvl);
				$tree[] = $v;
				$tree = array_merge($tree, $this->makeMenuTree($menus, $lefthtml, $v['id'], $lvl + 1, $leftpin + 20));
			}
		}
		return $tree;
	}

	/**
	 * 根据节点数据获取对应的菜单
	 * @param string $nodeStr
	 * @return array
	 */
	public function getRoleMenu($nodeStr = '')
	{
		//超级管理员没有节点数组
		try {
			$where = empty($nodeStr) ? 'status = 1' : "status = 1 AND id in({$nodeStr})";
			$result = Db::name('auth_rule')->where($where)->order('sort')->select();
			$menu = prepareMenu($result);
			return $menu;
		} catch (\Exception $e) {
			return [];
		}
	}

	/**
	 * 删除菜单
	 * @param $id
	 * @return array
	 */
	public function del($id)
	{
		// 首先查询看是否存在子菜单
		$where['pid'] = ['pid', '=', $id];
		$where['status'] = ['status', '=', 1];
		$result = $this->where($where)->value('id');
		if ($result) {
			$json = ['code' => 0, 'msg' => '删除失败，此菜单下有子菜单'];
		} else {
			Cache::clear('menuTree');
			$this->where("id={$id}")->delete();
			$json = ['code' => 1];
		}
		return $json;
	}

	/**
	 * 添加菜单
	 * @param $param
	 * @return array
	 */
	public function insertMenu($param)
	{
		try {
			list($pid, $level) = explode('-', $param['pid']);
			$param['pid'] = $pid;
			$param['level'] = ++$level;
			$param['name'] = $pid == 0 ? '#' : $param['name'];
			$result = $this->save($param);
			Cache::clear('menuTree');
			if (false === $result) {
				Log::error('添加菜单失败');
				return ['code' => 0, 'msg' => $this->getError()];
			} else {
				Log::info('添加菜单成功');
				return ['code' => 1, 'msg' => '添加菜单成功'];
			}
		} catch (\PDOException $e) {
			return ['code' => 0, 'msg' => $e->getMessage()];
		}
	}

	/**
	 * 编辑菜单
	 * @param $param
	 * @return array
	 */
	public function editMenu($param)
	{
		try {
			$result = $this->save($param, ['id' => $param['id']]);
			Cache::clear('menuTree');
			if (false === $result) {
				Log::error('编辑菜单失败');
				return ['code' => 0, 'msg' => $this->getError()];
			} else {
				Log::info('编辑菜单成功');
				return ['code' => 1];
			}
		} catch (\PDOException $e) {
			return ['code' => 0, 'msg' => $e->getMessage()];
		}
	}

	/**
	 * 修改菜单状态
	 * @param $id
	 * @return array
	 */
	public function changeStatus($id)
	{
		try {
			$hasSonMenu = Db::name('auth_rule')->where("pid={$id} AND status=1")->value('id');
			if ($hasSonMenu) {
				return ['code' => 0, 'msg' => '菜单状态修改失败：存在子菜单'];
			}
			$tableName = \think\facade\Config::get('database.prefix') . 'auth_rule';
			$sql = "UPDATE {$tableName} SET status = (case status when 0 then 1 else 0  end) WHERE id={$id}";
			Db::execute($sql);
			return ['code' => 1];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '菜单状态修改失败：' . $e->getMessage()];
		}
	}

	/**
	 * 根据菜单id获取一条信息
	 * @param $id
	 * @return array|null|\PDOStatement|string|Model
	 */
	public function getMenuById($id)
	{
		try {
			return $this->where("id={$id}")->find();
		} catch (\Exception $e) {
			Log::error('获取单个菜单失败');
		}
	}

	/**
	 * 生成菜单数，用于添加角色的时候选择权限
	 * @return array
	 */
	public function getTree()
	{
		$menus = Db::name($this->name)->order('sort')->field('id,title,level,pid')->select();
		$trees = prepareMenu($menus);
		return $trees;
	}

	/**
	 * 修改菜单排序
	 * @param $id
	 * @param $sort
	 * @return array
	 */
	public function changeSort($id, $sort)
	{
		$result = $this->where("id={$id}")->update(['sort' => $sort]);
		Cache::clear('menuTree');
		if ($result !== false) {
			return ['code' => 1];
		} else {
			return ['code' => 0, 'msg' => '排序修改失败'];
		}
	}
}
