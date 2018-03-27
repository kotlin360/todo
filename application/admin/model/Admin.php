<?php
namespace app\admin\model;

use app\admin\facade\UserType;
use app\common\facade\Log;
use think\Db;
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
				Log::error($user->id, $user->username, '用户【' . $user->username . '】登录失败：密码错误');
				return ['code' => 0, 'msg' => '登录失败，密码错误'];
			}
			if (1 != $user->status) {
				Log::error($user->id, $user->username, '用户【' . $user->username . '】登录失败：该账号被禁用');
				return ['code' => 0, 'msg' => '登录失败，该账号被禁用'];
			}
			//获取该管理员的角色信息
			$info = UserType::getRoleInfo($user->groupid);
			// 先执行登录写SESSION，权限后期完成
			Session::set('auth', [
				'uid' => $user->id,
				'username' => $user->username,
				'real_name' => $user->real_name,
				'rolename' => $info['title'], //角色名
				'rule' => $info['rules'], //角色节点
				'name' => $info['name'], //角色权限
			]);
			//更新管理员状态
			$param = [
				'loginnum' => ++$user->loginnum,
				'last_login_ip' => Request::ip(),
				'last_login_time' => $_SERVER['REQUEST_TIME']
			];
			$this->where('id', $user->id)->update($param);
			Log::info($user->id, $user->username, '用户【' . $user->username . '】登录成功');
			return ['code' => 1, 'url' => url('index/index'), 'msg' => '登录成功,正在跳转到后台'];
		} catch (\Exception $e) {
			echo $e->getMessage();
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

	public function getUserByWhere($map, $cur_page, $page_size)
	{
		$sql = Db::name('admin')->alias('a')
			->join('auth_group_access AS aga ON a.id = aga.uid');
	}
}