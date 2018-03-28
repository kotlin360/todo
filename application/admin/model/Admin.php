<?php
namespace app\admin\model;

use app\common\facade\Log;
use think\Db;
use think\exception\DbException;
use think\facade\Config;
use think\facade\Request;
use think\facade\Session;
use think\Model;

/**
 * @project  管理员模型
 * @author   千叶
 * @date     2018-03-22
 */
class Admin extends Model
{
	/**
	 * 管理员登录
	 * @param $data
	 * @return array
	 */
	public function doLogin($data)
	{
		$where['username'] = $data['username'];
		try {
			$user = $this->where($where)->field(true)->find();
			if ($user == null) {
				return ['code' => 0, 'msg' => '登录失败，管理员不存在'];
			}
			if (md5(md5($data['password']) . config('auth_key')) != $user->password) {
				Log::error('用户【' . $user->username . '】登录失败：密码错误', $user->id);
				return ['code' => 0, 'msg' => '登录失败，密码错误'];
			}
			if (1 != $user->status) {
				Log::error('用户【' . $user->username . '】登录失败：该账号被禁用', $user->id);
				return ['code' => 0, 'msg' => '登录失败，该账号被禁用'];
			}
			//获取该管理员的角色信息
//			$info = UserType::getRoleInfo($user->id);
//			if ($info === false) {
//				return ['code' => 0, 'msg' => '登录失败，该账号尚未分配角色'];
//			}
			// 先执行登录写SESSION，权限后期完成
			Session::set('auth', [
				'uid' => $user->id,
				'username' => $user->username,
				'real_name' => $user->real_name,
//				'rolename' => $info['title'], //角色名
//				'rule' => $info['rules'], //角色节点
//				'name' => $info['name'], //角色权限
			]);
			//更新管理员状态
			$param = [
				'loginnum' => ++$user->loginnum,
				'last_login_ip' => Request::ip(),
				'last_login_time' => $_SERVER['REQUEST_TIME']
			];
			$this->where('id', $user->id)->update($param);
			Log::info('登录成功');
			return ['code' => 1, 'url' => url('index/index'), 'msg' => '登录成功,正在跳转到后台'];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '登录失败，请联系系统管理员'];
		}
	}

	/**
	 * 修改密码
	 * @param $data
	 * @return array
	 */
	public function change_pwd($data)
	{
		try {
			$where['id'] = ['id', '=', Session::get('auth.uid')];
			$passwod_db = $this->where($where)->value('password');
			if (md5(md5($data['passwd_old']) . config('auth_key')) !== $passwod_db) {
				return ['code' => 0, 'msg' => '密码修改失败，旧密码不正确'];
			}
			$this->where($where)->update([
				'password' => md5(md5($data['passwd']) . config('auth_key'))
			]);
			return ['code' => 1];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => $e->getMessage()];
		}
	}

	/**
	 * 根据条件获取系统用户
	 * @param $map
	 * @param $cur_page
	 * @param $limits
	 * @return array
	 */
	public function getDataByWhere($map, $cur_page, $limits)
	{
		try {
			$count = $this->where($map)->count();
			$list = $this->where($map)->page($cur_page, $limits)
				->field('password', true)->order('id')->select();
			$json = [
				'code' => 0,
				'msg' => '',
				'count' => $count,
				'data' => $list
			];
			return $json;
		} catch (\Exception $e) {
			Log::error('根据条件获取系统用户getDataByWhere');
			return ['code' => 404, 'msg' => $e->getMessage()];
		}
	}

	/**
	 * 创建系统用户
	 * @param $data
	 * @return array
	 */
	public function createSystemUser($data)
	{
		$data['password'] = md5(md5('123456') . config('auth_key'));
		// 启动事务
		Db::startTrans();
		try {
			$uid = Db::name('admin')->strict(false)->insertGetId($data);
			foreach ($data['group_id'] as $v) {
				$groupData[] = ['uid' => $uid, 'group_id' => $v];
			}
			Db::name('auth_group_access')->insertAll($groupData);
			Db::commit();
			return ['code' => 1];
		} catch (\Exception $e) {
			// 回滚事务
			Db::rollback();
			return ['code' => 0, 'msg' => '创建用户失败，请联系系统管理员'];
		}
	}

	/**
	 * 根据用户ID获取系统用户的信息和所在的组
	 * @param $id
	 * @return array|null|\PDOStatement|string|Model
	 */
	public function getUserById($id)
	{
		try {
			$user = Db::name('admin')->where("id={$id}")
				->field('id,username,real_name,status')->find();
			$group = Db::name('auth_group_access')->where("uid={$id}")->column('group_id');
			$groupString = implode(',', $group);
			$user['group'] = $groupString;
			return $user;
		} catch (DbException $e) {
			Log::error('根据用户ID获取系统用户的信息和所在的组');
			return null;
		}
	}

	/**
	 * 修改系统用户
	 * @param $id
	 * @param $data
	 * @return array
	 */
	public function editSystemUser($id, $data)
	{
		// 启动事务
		Db::startTrans();
		try {
			Db::name('admin')->where("id={$id}")->strict(false)->update($data);
			foreach ($data['group_id'] as $v) {
				$groupData[] = ['uid' => $id, 'group_id' => $v];
			}
			// 首先删除auth_group_access表中的角色组id
			Db::name('auth_group_access')->where("uid={$id}")->delete();
			Db::name('auth_group_access')->insertAll($groupData);
			Db::commit();
			return ['code' => 1];
		} catch (\Exception $e) {
			// 回滚事务
			Db::rollback();
			return ['code' => 0, 'msg' => '修改用户失败，请联系系统管理员'];
		}
	}

	/**
	 * 重置系统用户密码
	 * @param $id
	 * @return array
	 */
	public function resetpwd($id)
	{
		$data['password'] = md5(md5('123456') . config('auth_key'));
		try {
			$name = Db::name('admin')->where("id={$id}")->value('real_name');
			Db::name('admin')->where("id={$id}")->update($data);
			Log::info("重置系统用户{$name}密码成功");
			return ['code' => 1];
		} catch (\Exception $e) {
			Log::error("重置系统用户{$name}密码失败," . $e->getMessage());
			return ['code' => 0, 'msg' => '重置密码失败，请联系管理员'];
		}
	}

	/**
	 * 修改系统用户状态（启用或者禁用）
	 * @param $id
	 * @param $status
	 * @return array
	 */
	public function change_status($id, $status)
	{
		$msg = $status == 1 ? '禁用' : '启用';
		try {
			$tableName = Config::get('database.prefix') . 'admin';
			$name = Db::name('admin')->where("id={$id}")->value('real_name');
			$sql = "UPDATE {$tableName} SET status = (case status when 0 then 1 else 0  end) WHERE id={$id}";
			Db::execute($sql);
			Log::info("{$msg}用户{$name}成功");
			return ['code' => 1];
		} catch (\Exception $e) {
			Log::error("{$msg}用户{$name}失败," . $e->getMessage());
			return ['code' => 0, 'msg' => $msg . '用户【' . $name . '】失败，请联系管理员'];
		}
	}
}