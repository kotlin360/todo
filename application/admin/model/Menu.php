<?php
namespace app\admin\model;

use app\common\facade\Log;
use think\Db;
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
			$where = "level <= $floor";
		}
		$menus = Db::name($this->name)->where($where)->order('sort')->field(true)->select();
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
	public function makeMenuTree($menus, $lefthtml = '╍', $pid = 0, $lvl = 0, $leftpin = 0)
	{
		$tree = [];
		foreach ($menus as $v) {
			if ($v['pid'] == $pid) {
				$v['lvl'] = $lvl + 1;
				$v['leftpin'] = $leftpin + 2;//左边距
				$v['lefthtml'] = $v['pid'] === 0 ? '' : '└' . str_repeat($lefthtml, $lvl);
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
			$where = empty($nodeStr) ? 'status = 1 and level < 3' : 'status = 1 and id in(' . $nodeStr . ') and level < 3';
			$result = Db::name($this->name)->where($where)->order('sort')->select();
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
			$this->where("id={$id}")->delete();
			$json = ['code' => 1];
		}
		return $json;
	}

	/**
	 * [insertMenu 添加菜单]
	 * @author [田建龙] [864491238@qq.com]
	 */
	public function insertMenu($param)
	{
		try {
			list($pid, $level) = explode('-', $param['pid']);
			$param['pid'] = $pid;
			$param['level'] = ++$level;
			$param['name'] = $pid == 0 ? '#' : $param['name'];
			$result = $this->save($param);
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
	 * [editMenu 编辑菜单]
	 * @author [田建龙] [864491238@qq.com]
	 */
	public function editMenu($param)
	{
		try {
			$result = $this->save($param, ['id' => $param['id']]);
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
}
