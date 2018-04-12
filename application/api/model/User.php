<?php
namespace app\api\model;

use GuzzleHttp\Exception\GuzzleException;
use think\Db;
use think\facade\Cache;
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
	 * @param $code
	 * @param $encryptedData    加密的用户数据
	 * @param $iv               与用户数据一同返回的初始向量
	 * @return array
	 */
	public function register($code, $encryptedData, $iv)
	{
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
		} catch (GuzzleException $e) {
			return ['code' => 0, 'msg' => '登录失败：' . $e->getMessage()];
		}

	}

	/**
	 * 获取微信小程序配置参数
	 * 如果缓存不存在，就到数据库中查询
	 */
	private function _getWeChatParam()
	{
		$config = Cache::get('system_params', null);
		if ($config) {
			$this['appid'] = $config['config_wechat_appid'];
			$this['secret'] = $config['config_wechat_appsecret'];
			$this['request_url'] = $config['config_wechat_url'];
		} else {
			// 如果不存在查询全部的配置数据，并放入缓存
			$cursor = Db::name('config')->cursor();
			$config = [];
			foreach ($cursor as $v) {
				$config[$v['key']] = $v['value'];
			}
			$this['appid'] = $config['config_wechat_appid'];
			$this['secret'] = $config['config_wechat_appsecret'];
			$this['request_url'] = $config['config_wechat_url'];
			// 写入缓存
			Cache::set('system_params', $config);
		}
	}
}
