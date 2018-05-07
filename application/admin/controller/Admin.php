<?php
namespace app\admin\controller;

use app\admin\model\Admin as AdminModel;
use app\admin\model\UserType as UserTypeModel;
use app\admin\validate\Admin as AdminValidate;
use think\Db;
use think\facade\Cache;
use think\facade\Config;

/**
 * @project  系统用户管理控制器
 * @author   千叶
 * @date     2018-03-27
 */
class Admin extends Base
{
	/**
	 * 系统用户列表
	 * @param AdminModel $adminModel
	 * @return mixed|\think\response\Json
	 */
	public function index(AdminModel $adminModel)
	{
		if ($this->request->isAjax()) {
			$cur_page = input('page', 1, 'intval');
			$keyword = input('keyword', '', 'urldecode');
			$page_size = input('limit', Config::get('page_size'), 'intval');
			$map = $keyword ? "real_name like '%{$keyword}%' " : '';
			$json = $adminModel->getDataByWhere($map, $cur_page, $page_size);
			return json($json);
		} else {
			$page_size = Config::get('page_size');
			return $this->assign('page_size', $page_size)->fetch();
		}
	}

	/**
	 * 创建系统用户，并分配角色
	 * @param AdminModel    $adminModel
	 * @param AdminValidate $adminValidate
	 * @param UserTypeModel $userTypeModel
	 * @return mixed|\think\response\Json
	 */
	public function add(AdminModel $adminModel, AdminValidate $adminValidate, UserTypeModel $userTypeModel)
	{
		if ($this->request->isAjax()) {
			$data = [
				'username' => input('username', ''),
				'real_name' => input('real_name', ''),
				'group_id' => input('group_id/a', ''),
				'status' => input('status', 0, 'intval'),
			];
			if (!$adminValidate->check($data)) {
				return json(['code' => 0, 'msg' => $adminValidate->getError()]);
			}
			$result = $adminModel->createSystemUser($data);
			return json($result);
		} else {
			$this->assign('roles', $userTypeModel->getAllSystemRoles());
			return $this->fetch();
		}
	}

	/**
	 * 系统用户修改
	 * @param AdminModel    $adminModel
	 * @param AdminValidate $adminValidate
	 * @param UserTypeModel $userTypeModel
	 * @return mixed|\think\response\Json
	 */
	public function edit(AdminModel $adminModel, AdminValidate $adminValidate,
	                     UserTypeModel $userTypeModel)
	{
		$id = input('param.id', 0, 'intval');
		if ($this->request->isAjax()) {
			$data = [
				'username' => input('username', ''),
				'real_name' => input('real_name', ''),
				'group_id' => input('group_id/a', ''),
				'status' => input('status', 0, 'intval'),
			];
			if (!$adminValidate->scene('edit')->check($data)) {
				return json(['code' => 0, 'msg' => $adminValidate->getError()]);
			}
			return json($adminModel->editSystemUser($id, $data));
		} else {
			$user = $adminModel->getUserById($id);
			$roles = $userTypeModel->getAllSystemRoles();
			if ($user === null || $roles === null) {
				$this->redirect(url('system/mistake'));
			}
			$this->assign(['user' => $user, 'roles' => $roles]);
			return $this->fetch('admin/add');
		}
	}

	/**
	 * 重置系统用户密码
	 * @param AdminModel $adminModel
	 * @return \think\response\Json
	 */
	public function resetpwd(AdminModel $adminModel)
	{
		$id = input('param.id', 0, 'intval');
		return json($adminModel->resetpwd($id));
	}

	/**
	 * 修改系统用户状态（开启或者禁用）
	 * @param AdminModel $adminModel
	 * @return \think\response\Json
	 */
	public function change_status(AdminModel $adminModel)
	{
		$id = input('param.id', 0, 'intval');
		$status = input('param.status', 1, 'intval');
		return json($adminModel->change_status($id, $status));
	}

	/**
	 * 修改网站参数，保存到配置表config
	 * @return mixed|\think\response\Json
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function setting()
	{
		if ($this->request->isAjax()) {
			// 保存
			$dataRaw = input('post.');
			$data = $this->handleValue($dataRaw);
			try {
				if (!empty($data['insertConfig'])) {
					Db::name('config')->insertAll($data['insertConfig']);
				}
				if (!empty($data['updateConfig'])) {
					foreach ($data['updateConfig'] as $v) {
						Db::name('config')->update($v);
					}
				}
				// 因为配置参数放入到缓存中，修改的话必须清空
				Cache::rm('system_params');
				return json(['code' => 1]);
			} catch (\Exception $e) {
				return json(['code' => 0, 'msg' => '保存失败：' . $e->getMessage()]);
			}
		} else {
			// 展示
			$settings = Db::name('config')->field(true)->select();
			$config = [];
			foreach ($settings as $v) {
				$config[$v['key'] . '_uuid'] = $v['id'];
				$config[$v['key']] = $v['value'];
			}
			// 保存到缓存
			Cache::set('system_params', $config);
			return $this->assign('config', $config)->fetch();
		}
	}

	/**
	 * 处理接受到的配置参数
	 * @param $data
	 * @return mixed
	 */
	private function handleValue($data)
	{
		if (isset($data['config_service_phone'])) {
			$data['config_service_phone'] = str_replace('，', ',', $data['config_service_phone']);
		}
		if (isset($data['config_service_qq'])) {
			$data['config_service_qq'] = str_replace('，', ',', $data['config_service_qq']);
		}
		$insertConfig = [];
		$updateConfig = [];
		foreach ($data as $k => $v) {
			if (endsWith($k, '_uuid')) {
				if ($v == '') {
					continue;
				}
				// 如果是_uuid结尾的
				$keyWithoutUUID = substr($k, 0, -5);
				$updateConfig[] = ['id' => $data["$k"], 'value' => $data["$keyWithoutUUID"], 'update_time' => $_SERVER['REQUEST_TIME']];
			} else {
				if (!isset($data[$k . '_uuid']) || $data[$k . '_uuid'] == '') {
					$insertConfig[] = ['key' => $k, 'value' => $v, 'create_time' => $_SERVER['REQUEST_TIME']];
				}
			}
		}
		return ['insertConfig' => $insertConfig, 'updateConfig' => $updateConfig];
	}
}
