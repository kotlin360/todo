<?php
namespace app\api\model;

use app\api\facade\ParamService;
use Mrgoon\AliSms\AliSms;

/**
 * @project  阿里大于发送短信
 * @author   千叶
 * @date     2018-04-13
 */
class Alidayu
{

	/**
	 * 发送短信
	 * @param $phone
	 * @param $type 1 注册 2找回密码
	 * @return mixed|\SimpleXMLElement
	 */
	public function send($phone, $type)
	{
		// 生成验证码
		$verify_code = mt_rand(1000, 9999);
		// 这里此验证码要写入数据库，便于以后注册的时候验证
		$param = ParamService::getSystemParam();
		$config = [
			'access_key' => $param['config_dy_accesskeyid'],
			'access_secret' => $param['config_dy_accesskeysecret'],
			'sign_name' => $param['config_dy_signname'],
		];
		$code = $type === 1 ? $param['config_dy_regist_code'] : $param['config_dy_passwd_code'];
		// 调用阿里云服务，发送短信
		$aliSms = new AliSms();
		$response = $aliSms->sendSms($phone, $code, ['code' => $verify_code], $config);
		if ($response->Code === 'OK') {
			return ['code' => 1];
		} else {
			return ['code' => 0, 'msg' => $response->Message];
		}
	}
}