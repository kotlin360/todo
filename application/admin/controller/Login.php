<?php
namespace app\admin\controller;

use app\admin\model\Admin as AdminModel;
use app\admin\validate\Login as LoginValidate;
use app\admin\validate\Passwd as PasswdValidate;
use think\captcha\Captcha;
use think\Controller;
use think\facade\Session;

/**
 * @project  登录控制器
 * @author   千叶
 * @date     2018-03-22
 */
class Login extends Controller
{
	/**
	 * 登录页面
	 * @return mixed
	 */
	public function index()
	{
		$this->assign('site', '某某公司');
		return $this->fetch();
	}

	/**
	 * 登录动作
	 * @param LoginValidate $validate
	 * @param Captcha       $captcha
	 * @param AdminModel    $adminModel
	 * @return \think\response\Json
	 */
	public function do_login(LoginValidate $validate, Captcha $captcha, AdminModel $adminModel)
	{
		$data = [
			'username' => input('post.username'),
			'password' => input('post.password'),
			'code' => input('post.code'),
		];
		// 校验数据合法性
		if (!$validate->check($data)) {
			$json = ['code' => 0, 'msg' => $validate->getError()];
			return json($json);
		}
		// 校验验证码
		if (!$captcha->check($data['code'])) {
			$json = ['code' => 0, 'msg' => '验证码填写错误'];
			return json($json);
		}
		// 调用模型，执行登录
		return json($adminModel->doLogin($data));
	}

	/**
	 * 生成验证码
	 * @return mixed
	 */
	public function make_verify()
	{
		$config = [
			'codeSet' => '123456789',
			'fontttf' => '4.ttf',
			// 验证码字体大小
			'fontSize' => 18,
			'imageH' => 36,
			'imageW' => 130,
			// 验证码位数
			'length' => 4,
			// 关闭验证码杂点
			'useNoise' => false,
		];
		$captcha = new Captcha($config);
		return $captcha->entry();
	}

	// 修改管理员密码
	public function changepwd(PasswdValidate $passwdValidate, AdminModel $adminModel)
	{
		if ($this->request->isAjax()) {
			$data = [
				'passwd_old' => input('passwd_old', ''),
				'passwd' => input('passwd', ''),
				'repasswd' => input('repasswd', ''),
			];
			// 检查数据是否合法
			if (!$passwdValidate->check($data)) {
				return json(['code' => 0, 'msg' => $passwdValidate->getError()]);
			}
			// 检验老密码是否正确，如果正确将新密码写入数据库,此处调用模型
			$json = $adminModel->change_pwd($data);
			return json($json);
		}
		return $this->fetch();
	}

	/**
	 * 退出系统
	 */
	public function loginout()
	{
		Session::clear();
		return json(['code' => 1]);
	}
}
