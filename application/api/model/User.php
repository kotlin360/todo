<?php
namespace app\api\model;

use app\common\facade\Log;
use app\common\facade\Param as ParamFacade;
use GuzzleHttp\Exception\GuzzleException;
use think\Container;
use think\Db;
use think\facade\Env;
use think\facade\Request as RequestFacade;
use think\Model;
use think\Request;
use think\facade\Config;
use app\api\facade\Message as MessageFacade;

/**
 * @project  用户接口模型
 * @author   千叶
 * @date     2018-04-12
 */
class User extends Model
{
	protected $autoWriteTimestamp = true;

	/**
	 * 用户中心首页
	 * @param $uid
	 * @return array
	 */
	public function getUserInfo($uid)
	{
		try {
			$user = $this->where("id={$uid}")
				->field('id,username,nickname,score,money,avatar,tel,nickname,gender,birthday,station_name,manufactor,duty')->find();
			if (strpos($user['avatar'], 'https') === false) {
				//  用户修改了头像
				$user['avatar'] = Container::get('request')->domain() . $user['avatar'];
			}
			// 获取有效尚未使用优惠券的数量
			$now = $_SERVER['REQUEST_TIME'];
			$where = "uid={$uid} AND status=0 AND start <= {$now} AND end >= {$now}";
			$couponCount = Db::name('coupon_log')->where($where)->count();
			$user['coupon'] = $couponCount;
			return ['code' => 1, 'data' => $user];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '获取用户信息失败：' . $e->getMessage()];
		}
	}

	/**
	 * 小程序注册接口逻辑
	 * @param $request
	 * @return array|\think\response\Json
	 */
	public function register(Request $request)
	{
		$phone = $request->post('phone', '18653282019'); // 注册手机号码
		$verifyCode = input('verifyCode', ''); // 用户填写的短信验证码
		$code = $request->post('code'); // 小程序临时登录code
		$encryptedData = $request->post('encryptedData');
		$iv = $request->post('iv');
		// 需要首先验证短信验证码是否正确
//		$realcode = MessageFacade::getCode($phone);
//		if (!$realcode) {
//			return ['code' => 0, 'msg' => '验证码已过期，请重新获取'];
//		}
//		if ($realcode !== $verifyCode) {
//			return ['code' => 0, 'msg' => '您填写的验证码不正确'];
//		}
		$params = ParamFacade::getSystemParam();
		// 下面是正式的数据
		$weixinParam = [
			'appid' => $params['config_wechat_appid'],
			'secret' => $params['config_wechat_appsecret'],
			'js_code' => $code,
			'grant_type' => 'authorization_code'
		];
		// 下面是本人自己的测试数据
		$weixinParam = [
			'appid' => 'wxe0437523294fb4e7',
			'secret' => 'ce048c9b8f071bb516398b0baf2289a9',
			'js_code' => $code,
			'grant_type' => 'authorization_code'
		];
		try {
			$client = new \GuzzleHttp\Client();
			// 发送请求获取session_key和openid
			$response = $client->request('get', $params['config_wechat_url'], ['query' => $weixinParam]);
			$body = json_decode($response->getBody());
			if (isset($body->errcode) && $body->errcode !== 0) {
				return ['code' => 0, 'msg' => '注册失败：' . $body->errmsg];
			}
			$openid = $body->openid;
			$session_key = $body->session_key;
			// 如果需要获取敏感数据，需要对前台接口返回的加密数据(encryptedData)进行对称解密
			$extend_path = Env::get('extend_path');
			include_once($extend_path . "weixinCrypt/wxBizDataCrypt.php");
			$pc = new \wxBizDataCrypt($weixinParam['appid'], $session_key);
			$errCode = $pc->decryptData($encryptedData, $iv, $data);
			if ($errCode != 0) {
				return ['code' => 0, 'msg' => '获取用户信息失败'];
			}
			$info = json_decode($data);
			// 写自己的逻辑，把用户信息openid，昵称，头像信息写入到数据库
			$userinfo = [
				'username' => $phone,
				'tel' => $phone,
				'gender' => $info->gender,
				'open_id' => $info->openId,
				'passwd' => password_hash($request->post('passwd'), PASSWORD_DEFAULT),
				'nickname' => $info->nickName,
				'avatar' => $info->avatarUrl,
				'birthday' => $info->birthday,
				'station_name' => $request->post('station_name'),
				'manufactor' => $request->post('manufactor'),
				'duty' => $request->post('duty'),
				'create_ip' => $request->ip(),
			];
			$this->save($userinfo);
			$uid = $this->getLastInsID();
			// 把用户的uid、username、open_id加密后发送给前台
			$token = authcode($uid . '|' . $phone . '|' . $info->openId, 'ENCODE');
			return ['code' => 1, 'token' => $token];
		} catch (GuzzleException $e) {
			return ['code' => 0, 'msg' => '登录失败：' . $e->getMessage()];
		}
	}

	/**
	 * 用户登录
	 * @param $data
	 * @return array
	 */
	public function login($data)
	{
		try {
			$user = $this->where("username={$data['username']}")->field('id,username,open_id,status')->find();
			if (!password_verify($data['passwd'], $user['passwd'])) {
				return ['code' => 0, 'msg' => '登录失败，密码不正确'];
			}
			if ($user['status'] !== 1) {
				return ['code' => 0, 'msg' => '登录失败，用户已被禁用'];
			}
			// 更新用户登录信息
			$updateData = ['last_time' => $_SERVER['REQUEST_TIME'], 'last_ip' => RequestFacade::ip()];
			$this->where("id={$user['id']}")->update($updateData);
			// 登录成功，写日志
			Log::info($user['username'] . '登录成功', $user['id']);
			// 把用户的uid、username、open_id加密后发送给前台
			$token = authcode($user['id'] . '|' . $user['username'] . '|' . $user['open_id'], 'ENCODE');
			return ['code' => 1, 'token' => $token];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '登录失败，用户不存在'];
		}
	}

	/**
	 * 找回密码
	 * @param $data
	 * @return array
	 */
	public function forgot($data)
	{
		// 需要首先验证短信验证码是否正确
		$realcode = MessageFacade::getCode($data['username']);
		if (!$realcode) {
			return ['code' => 0, 'msg' => '验证码已过期，请重新获取'];
		}
		if ($realcode !== $data['verifyCode']) {
			return ['code' => 0, 'msg' => '您填写的验证码不正确'];
		}
		$newPasswd = password_hash($data['passwd'], 1);
		$result = $this->where("usename={$data['username']}")->update(['passwd' => $newPasswd]);
		if ($result !== false) {
			return ['code' => 1];
		} else {
			return ['code' => 0, 'msg' => '密码更新失败，请稍后再试'];
		}
	}

	/**
	 * 头像上传
	 * @param $uid
	 * @param $file
	 * @return array
	 */
	public function avatarUpload($uid = 1, $file)
	{
		try {
			$subpath = date('Ym'); // 子目录格式
			$size_allow = Config::get('file_upload_size');
			$ext_allow = 'gif,jpg,jpeg,bmp,png';
			$info = $file->validate(['size' => $size_allow, 'ext' => $ext_allow])->rule('uniqid')
				->move('./uploads' . '/' . date('Ym'));
			// 更新用户头像信息
			$this->where("id={$uid}")->update(['avatar' => '/uploads/' . $subpath . '/' . $info->getSaveName()]);
			return ['code' => 1];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => $file->getError()];
		}
	}

}
