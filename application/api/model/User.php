<?php
namespace app\api\model;

use GuzzleHttp\Exception\GuzzleException;
use think\facade\Env;
use think\Model;

/**
 * @project  用户接口模型
 * @author   千叶
 * @date     2018-04-12
 */
class User extends Model
{
	/**
	 * 小程序注册接口逻辑
	 * @param $request
	 * @return array|\think\response\Json
	 */
	public function register($request)
	{
		$code = $request->post('code');
		$encryptedData = $request->post('encryptedData');
		$iv = input('iv');
		$username = input('username');
		$verify_code = input('verify_code', '');
		// 需要首先验证短信验证码是否正确
		/**
		 * 正式
		 * $this->_getWeChatParam();
		 * $param = [
		 * 'appid' => $this['appid'],
		 * 'secret' => $this['secret'],
		 * 'js_code' => $code,
		 * 'grant_type' => 'authorization_code'
		 * ];
		 **/
		$param = [
			'appid' => 'wxe0437523294fb4e7',
			'secret' => '47f531085429b940fdb7c3428863f7cc',
			'js_code' => $code,
			'grant_type' => 'authorization_code'
		];
		$this['request_url'] = 'https://api.weixin.qq.com/sns/jscode2session';
		try {
			$client = new \GuzzleHttp\Client();
			// 发送请求获取session_key和openid
			$response = $client->request('get', $this['request_url'], ['query' => $param]);
			$body = json_decode($response->getBody());
			if (isset($body->errcode) && $body->errcode !== 0) {
				return json(['code' => 0, 'msg' => '注册失败：' . $body->errmsg]);
			}
			$openid = $body->openid;
			$session_key = $body->session_key;
			// 如果需要获取敏感数据，需要对前台接口返回的加密数据(encryptedData)进行对称解密
			$extend_path = Env::get('extend_path');
			include_once($extend_path . "weixinCrypt/wxBizDataCrypt.php");
			// $pc = new \wxBizDataCrypt($this['appid'], $session_key);
			$pc = new \wxBizDataCrypt($param['appid'], $session_key);
			$errCode = $pc->decryptData($encryptedData, $iv, $data);
			if ($errCode != 0) {
				return json(['code' => 0, 'msg' => '获取用户信息失败']);
			}
			$info = json_decode($data);
			p($info);
			// 写自己的逻辑，把用户信息openid，昵称，头像信息写入到数据库
			$user = [
				'username' => '123'
			];
		} catch (GuzzleException $e) {
			return ['code' => 0, 'msg' => '登录失败：' . $e->getMessage()];
		}

	}

}
