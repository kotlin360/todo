<?php

namespace app\common\service;

use app\common\facade\Param as ParamFacade;
use think\facade\Env;
use think\facade\Request;

/**
 * @project  微信支付
 * @author   千叶
 * @date     2018-05-14
 */
class Wxpay
{

	protected $config = null;
	// 证书路径
	protected $SSLCERT_PATH = '';
	protected $SSLKEY_PATH = '';

	public function __construct()
	{
		// 系统参数
		$this->config = ParamFacade::getSystemParam();

		$this->SSLCERT_PATH = Env::get('ROOT_PATH') . '/weixinCert/apiclient_cert.pem';
		$this->SSLKEY_PATH = Env::get('ROOT_PATH') . '/weixinCert/apiclient_key.pem';
	}

	/**
	 * 订单预支付请求接口
	 * @param $bill
	 * @return array
	 */
	public function prepay($bill)
	{
		//统一下单参数构造
		$unifiedorder = array(
			'appid' => $this->config['config_wechat_appid'],
			'mch_id' => $this->config['config_mch_id'],
			'nonce_str' => self::getNonceStr(),
			'body' => '深邦智能-订单支付',
			'out_trade_no' => $bill['order_no'],
			// 'total_fee' => 0.01 * 100, // 测试数据
			'total_fee' => $bill['pay_weixin'] * 100, // 正式数据
			'spbill_create_ip' => Request::ip(),
			'notify_url' => Request::domain() . '/index/weixin/bill_pay_notify.html',
			'trade_type' => 'JSAPI',
			'openid' => $bill['openid']
		);

		$unifiedorder['sign'] = self::makeSign($unifiedorder);
		//请求数据
		$xmldata = self::array2xml($unifiedorder);
		$res = self::curl_post_ssl('https://api.mch.weixin.qq.com/pay/unifiedorder', $xmldata);
		if (!$res) {
			return ['code' => 0, 'msg' => '预支付失败，不能连接微信服务器'];
		}

		$content = self::xml2array($res);
		if (strval($content['result_code']) == 'FAIL') {
			return ['code' => 0, 'msg' => '预支付失败：' . strval($content['err_code_des'])];
		}
		if (strval($content['return_code']) == 'FAIL') {
			return ['code' => 0, 'msg' => '预支付失败：' . strval($content['return_msg'])];
		}

		// 获取预支付信息(prepar_id)，将组合数据再次签名,返回到小程序
		$data = [
			'appId' => $content['appid'],
			'timeStamp' => strval(time()),
			'nonceStr' => self::getNonceStr(),
			'package' => 'prepay_id=' . $content['prepay_id'],
			'signType' => 'MD5'
		];
		$data['paySign'] = self::makeSign($data);
		return ['code' => 2, 'data' => $data];
	}

	/**
	 * 如果有微信支付，订单支付成功后的通知
	 * @param $xml
	 * @return array|bool
	 */
	public function billPayNotify($xml)
	{
		//将服务器返回的XML数据转化为数组
		$data = self::xml2array($xml);
		// 保存微信服务器返回的签名sign
		$data_sign = $data['sign'];
		// sign不参与签名算法
		unset($data['sign']);
		$sign = self::makeSign($data);

		// 判断签名是否正确  判断支付状态
		if (($sign === $data_sign) && ($data['return_code'] == 'SUCCESS') && ($data['result_code'] == 'SUCCESS')) {
			return $data;
		} else {
			return false;
		}
	}

	/**
	 * 用户退款,不需要异步通知
	 * @param $bill
	 * @return array
	 */
	public function refund($bill)
	{
		//通过微信api进行退款流程
		$param = array(
			'appid' => $this->config['config_wechat_appid'],
			'mch_id' => $this->config['config_mch_id'],
			'nonce_str' => self::getNonceStr(),
			'out_refund_no' => $bill['refund_no'],
			'out_trade_no' => $bill['order_no'],
			'total_fee' => $bill['pay_weixin'] * 100,
			'refund_fee' => $bill['pay_weixin'] * 100
		);

		$param['sign'] = self::makeSign($param);
		//请求数据
		$xmldata = self::array2xml($param);
		$res = self::curl_post_ssl('https://api.mch.weixin.qq.com/secapi/pay/refund', $xmldata, true);
		if (!$res) {
			return ['code' => 0, 'msg' => '退款提交失败，不能连接微信服务器'];
		}

		$content = self::xml2array($res);

		if (strval($content['return_code']) == 'FAIL') {
			return ['code' => 0, 'msg' => '退款提交失败：' . strval($content['return_msg'])];
		}

		if (strval($content['result_code']) == 'FAIL') {
			return ['code' => 0, 'msg' => '退款提交失败：' . strval($content['err_code_des'])];
		}
		return ['code' => 1, 'data' => $content];
	}

	/**
	 * 用户提现微信接口
	 * @param $withdraw
	 * @return array
	 */
	public function withdraw($withdraw)
	{
		$param = array(
			'mch_appid' => $this->config['config_wechat_appid'],
			'mchid' => $this->config['config_mch_id'],
			'nonce_str' => self::getNonceStr(),
			'partner_trade_no' => $withdraw['order_no'],
			'openid' => $withdraw['openid'],
			'check_name' => 'NO_CHECK',
			'amount' => $withdraw['value'] * 100,
			'desc' => '用户提现',
			'spbill_create_ip' => Request::ip()
		);

		$param['sign'] = self::makeSign($param);
		//请求数据
		$xmldata = self::array2xml($param);
		$res = self::curl_post_ssl('https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers', $xmldata, true);
		if (!$res) {
			return ['code' => 0, 'msg' => '提现失败，不能连接微信服务器'];
		}

		$content = self::xml2array($res);

		if (strval($content['return_code']) == 'FAIL') {
			return ['code' => 0, 'msg' => '提现失败：' . strval($content['return_msg'])];
		}

		if (strval($content['result_code']) == 'FAIL') {
			return ['code' => 0, 'msg' => '提现失败：' . strval($content['err_code_des'])];
		}
		return ['code' => 1, 'data' => $content];
	}

	/**
	 * 预充值统一订单,其实跟下订单是一样的
	 * @param $recharge
	 * @return array
	 */
	public function preRecharge($recharge)
	{
		//统一下单参数构造
		$unifiedorder = array(
			'appid' => $this->config['config_wechat_appid'],
			'mch_id' => $this->config['config_mch_id'],
			'nonce_str' => self::getNonceStr(),
			'body' => '深邦智能-用户充值',
			'out_trade_no' => $recharge['order_no'],
			'total_fee' => 0.01 * 100, // 测试数据
			// 'total_fee' => $bill['pay_weixin'] * 100, // 正式数据
			'spbill_create_ip' => Request::ip(),
			'notify_url' => Request::domain() . '/index/weixin/recharge_notify.html',
			'trade_type' => 'JSAPI',
			'openid' => $recharge['openid'],
			// 附加数据,用户充值列表的id，用于充值成功后赠送优惠券
			'attach' => $recharge['id']
		);

		$unifiedorder['sign'] = self::makeSign($unifiedorder);
		//请求数据
		$xmldata = self::array2xml($unifiedorder);
		$res = self::curl_post_ssl('https://api.mch.weixin.qq.com/pay/unifiedorder', $xmldata);
		if (!$res) {
			return ['code' => 0, 'msg' => '预充值失败，不能连接微信服务器'];
		}

		$content = self::xml2array($res);
		if (strval($content['result_code']) == 'FAIL') {
			return ['code' => 0, 'msg' => '预充值失败：' . strval($content['err_code_des'])];
		}
		if (strval($content['return_code']) == 'FAIL') {
			return ['code' => 0, 'msg' => '预充值失败：' . strval($content['return_msg'])];
		}

		// 获取预支付信息(prepar_id)，将组合数据再次签名,返回到小程序
		$data = [
			'appId' => $content['appid'],
			'timeStamp' => strval(time()),
			'nonceStr' => self::getNonceStr(),
			'package' => 'prepay_id=' . $content['prepay_id'],
			'signType' => 'MD5'
		];
		$data['paySign'] = self::makeSign($data);
		return ['code' => 1, 'data' => $data];
	}

	/**
	 * 将一个数组转换为 XML 结构的字符串
	 * @param array $arr   要转换的数组
	 * @param int   $level 节点层级, 1 为 Root.
	 * @return string XML 结构的字符串
	 */
	protected function array2xml($arr, $level = 1)
	{
		$s = $level == 1 ? "<xml>" : '';
		foreach ($arr as $tagname => $value) {
			if (is_numeric($tagname)) {
				$tagname = $value['TagName'];
				unset($value['TagName']);
			}
			if (!is_array($value)) {
				$s .= "<{$tagname}>" . (!is_numeric($value) ? '<![CDATA[' : '') . $value . (!is_numeric($value) ? ']]>' : '') . "</{$tagname}>";
			} else {
				$s .= "<{$tagname}>" . $this->array2xml($value, $level + 1) . "</{$tagname}>";
			}
		}
		$s = preg_replace("/([\x01-\x08\x0b-\x0c\x0e-\x1f])+/", ' ', $s);
		return $level == 1 ? $s . "</xml>" : $s;
	}

	/**
	 * 将xml转为array
	 * @param  string $xml xml字符串
	 * @return array    转换得到的数组
	 */
	protected function xml2array($xml)
	{
		//禁止引用外部xml实体
		libxml_disable_entity_loader(true);
		$result = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
		return $result;
	}

	/**
	 * 产生随机字符串，不长于32位
	 * @param int $length
	 * @return string
	 */
	protected function getNonceStr($length = 32)
	{
		$chars = "abcdefghijklmnopqrstuvwxyz0123456789";
		$str = "";
		for ($i = 0; $i < $length; $i++) {
			$str .= substr($chars, mt_rand(0, strlen($chars) - 1), 1);
		}
		return $str;
	}

	/**
	 * 生成签名
	 * @param $data
	 * @return string
	 */
	protected function makeSign($data)
	{
		//获取微信支付秘钥
		$key = $this->config['config_pay_apikey'];
		// 去空
		$data = array_filter($data);
		//签名步骤一：按字典序排序参数
		ksort($data);
		$string_a = http_build_query($data);
		$string_a = urldecode($string_a);
		//签名步骤二：在string后加入KEY
		$string_sign_temp = $string_a . "&key=" . $key;
		//签名步骤三：MD5加密
		$sign = md5($string_sign_temp);
		// 签名步骤四：所有字符转为大写
		$result = strtoupper($sign);
		return $result;
	}

	/**
	 * 微信支付发起请求curl
	 * @param       $url
	 * @param       $xmldata
	 * @param bool  $useCert
	 * @param int   $second
	 * @param array $aHeader
	 * @return bool|mixed
	 */
	protected function curl_post_ssl($url, $xmldata, $useCert = false, $second = 30, $aHeader = array())
	{
		$ch = curl_init();
		//超时时间
		curl_setopt($ch, CURLOPT_TIMEOUT, $second);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);

		if (count($aHeader) >= 1) {
			curl_setopt($ch, CURLOPT_HTTPHEADER, $aHeader);
		}

		if ($useCert == true) {
			//设置证书，使用证书：cert 与 key 分别属于两个.pem文件
			curl_setopt($ch, CURLOPT_SSLCERTTYPE, 'PEM');
			curl_setopt($ch, CURLOPT_SSLCERT, $this->SSLCERT_PATH);
			curl_setopt($ch, CURLOPT_SSLKEYTYPE, 'PEM');
			curl_setopt($ch, CURLOPT_SSLKEY, $this->SSLKEY_PATH);
		}

		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $xmldata);
		$data = curl_exec($ch);
		if ($data) {
			curl_close($ch);
			return $data;
		} else {
			$error = curl_errno($ch);
			echo "call faild, errorCode:$error\n";
			curl_close($ch);
			return false;
		}
	}
}