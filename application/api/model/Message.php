<?php
namespace app\api\model;

use app\common\facade\Param as ParamFacade;
use Mrgoon\AliSms\AliSms;
use think\Model;

/**
 * @project  短信模型
 * @author   千叶
 * @date     2018-04-13
 */
class Message extends Model
{

	/**
	 * 阿里大于发送短信
	 * @param $phone
	 * @param $type 1 注册 2找回密码
	 * @return mixed|\SimpleXMLElement
	 */
	public function send($phone, $type)
	{
		// 生成验证码,这里此验证码要写入数据库，便于以后注册的时候验证
		$verify_code = mt_rand(1000, 9999);
		$this->setCode($phone, $verify_code);
		$param = ParamFacade::getSystemParam();
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

	/**
	 * 根据条件获取短信验证码
	 * @param $phone
	 * @return mixed|null
	 */
	public function getCode($phone)
	{
		try {
			$message = $this->where("phone={$phone}")->field('code,add_time')->findOrFail();
			$diff = $message['add_time'] + 5 * 3600 - time();
			return $diff <= 0 ? null : $message['code'];
		} catch (\Exception $e) {
			return null;
		}
	}

	/**
	 * 写入短信验证码到数据库
	 * @param $phone
	 * @param $code
	 */
	private function setCode($phone, $code)
	{
		$id = $this->where("phone={$phone}")->value('id');
		if ($id) {
			// 存在，需要更新
			$this->where("phone={$phone}")->update(['code' => $code, 'add_time' => time()]);
		} else {
			// 不存在，直接插入
			$this->insert(['phone' => $phone, 'code' => $code, 'add_time' => time()]);
		}
	}
}
