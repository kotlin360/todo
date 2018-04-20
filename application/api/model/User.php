<?php
namespace app\api\model;

use app\common\facade\Log;
use app\common\facade\Param as ParamFacade;
use GuzzleHttp\Exception\GuzzleException;
use think\Container;
use think\Db;
use think\facade\Env;
use think\Model;
use think\Request;
use think\facade\Config;
use app\api\facade\Message as MessageFacade;
use app\api\validate\Userinfo as UserinfoValidate;

/**
 * @project  用户接口模型
 * @author   千叶
 * @date     2018-04-12
 */
class User extends Model
{
	protected $autoWriteTimestamp = true;

	/**
	 * 完善用户的手机号码等信息
	 * @param Request          $request
	 * @param UserinfoValidate $userinfoValidate
	 * @param                  $user
	 * @return array
	 */
	public function updateUserInfo(Request $request, UserinfoValidate $userinfoValidate, $user)
	{
		$messageCode = $request->post('messageCode', '');// 用户填写的短信验证码
		$updateData = [
			'username' => $request->post('phone', ''), // 手机号码
			'tel' => $request->post('phone', ''),
			'birthday' => $request->post('birthday', ''),
			'station_name' => $request->post('station_name', ''),
			'manufactor' => $request->post('manufactor', ''),
			'duty' => $request->post('duty', ''),
			'last_time' => $_SERVER['REQUEST_TIME'],
			'last_ip' => $request->ip()
		];
		if (!$userinfoValidate->check(['username' => $updateData['username'], $messageCode => $messageCode])) {
			return ['code' => 0, 'msg' => $userinfoValidate->getError()];
		}
		// 需要首先验证短信验证码是否正确
//		$realcode = MessageFacade::getCode($updateData['username']);
//		if (!$realcode) {
//			return ['code' => 0, 'msg' => '验证码已过期，请重新获取'];
//		}
//		if ($realcode !== $messageCode) {
//			return ['code' => 0, 'msg' => '填写的验证码不正确'];
//		}
		try {
			// 更新用户完善信息
			$this->where("id={$user['uid']}")->update($updateData);
			// 查询用户信息
			$realUser = $this->where("id={$user['uid']}")->field('id,username,open_id')->find();
			if ($user['username'] && $realUser['open_id']) {
				// 登录成功，写日志
				Log::info($realUser['username'] . '登录成功', $realUser['id']);
				// 把用户的uid、username、open_id加密后发送给前台
				$token = authcode($realUser['id'] . '|' . $realUser['username'] . '|' . $realUser['open_id'], 'ENCODE');
				return ['code' => 1, 'token' => $token];
			}
			throw  new \Exception('请稍后再试');
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '操作失败：' . $e->getMessage()];
		}
	}

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
		// 加密算法的初始向量
		$iv = $request->post('iv');
		// wx.login登录时获取的code,用于后续获取session_key
		$js_code = $request->post('code');
		// 包括敏感数据在内的完整用户信息的加密数据
		$encryptedData = $request->post('encryptedData');
		$params = ParamFacade::getSystemParam();
		// 下面是正式的数据
		$weixinParam = [
			'appid' => $params['config_wechat_appid'],
			'secret' => $params['config_wechat_appsecret'],
			'js_code' => $js_code,
			'grant_type' => 'authorization_code'
		];
		// 下面是本人自己的测试数据
//		$weixinParam = [
//			'appid' => 'wxe0437523294fb4e7',
//			'secret' => 'ce048c9b8f071bb516398b0baf2289a9',
//			'js_code' => $js_code,
//			'grant_type' => 'authorization_code'
//		];
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
			// 拿到open_id和部分用户信息（没有手机号码）之后需要到数据中查询存在不存在
			$user = Db::name('user')->where("open_id='{$openid}'")->field('id,username')->find();
			if ($user === null) {
				// 如果用户$user === null说明是第一次登录授权，需要对前台接口返回的加密数据(encryptedData)进行对称解密把用户部分信息(没有手机号码)写入到数据库
				$extend_path = Env::get('extend_path');
				include_once($extend_path . "weixinCrypt/wxBizDataCrypt.php");
				$pc = new \wxBizDataCrypt($weixinParam['appid'], $session_key);
				$errCode = $pc->decryptData($encryptedData, $iv, $data);
				if ($errCode != 0) {
					return ['code' => 0, 'msg' => '获取用户信息失败'];
				}
				$info = json_decode($data);
				$userinfo = [
					'gender' => $info->gender,
					'open_id' => $info->openId,
					'nickname' => $info->nickName,
					'avatar' => $info->avatarUrl,
					'create_ip' => $request->ip(),
				];
				$this->save($userinfo);
				$uid = $this->getLastInsID();
				// 返回临时token，让用户去完善信息
				$token_temp = authcode($uid . '|fake123|' . $openid, 'ENCODE');
				return ['code' => 1, 'token' => $token_temp];
			} else if (!$user['username']) {
				// 返回临时token，让用户去完善信息
				$token_temp = authcode($user['id'] . '|fake123|' . $openid, 'ENCODE');
				return ['code' => 1, 'token' => $token_temp];
			} else {
				$updateData = [
					'last_time' => $_SERVER['REQUEST_TIME'],
					'last_ip' => $request->ip()
				];
				$this->where("id={$user['id']}")->update($updateData);
				// 登录成功，写日志
				Log::info($user['username'] . '登录成功', $user['id']);
				// 把用户的uid、username、open_id加密后发送给前台
				$token = authcode($user['id'] . '|' . $user['username'] . '|' . $openid, 'ENCODE');
				return ['code' => 2, 'token' => $token];
			}
		} catch (GuzzleException $e) {
			return ['code' => 0, 'msg' => '登录失败：' . $e->getMessage()];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '登录失败：' . $e->getMessage()];
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
