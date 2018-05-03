<?php
namespace app\common\service;

/**
 * 由于在php7.1之后mcrypt_encrypt会被废弃，因此使用openssl_encrypt方法来替换
 * @project  openssl加解密
 * @author   千叶
 * @date     2018-05-03
 */
class OpensslEncryptHelper
{
	// 16位向量
	const IV = "6899453728692606";

	// 默认秘钥,16位
	const KEY = 'shenbang@2018123';

	/**
	 * 解密字符串
	 * @param string $data 字符串
	 * @param string $key  加密key
	 * @param string $iv
	 * @return string
	 */
	public static function decrypt($data, $key = self::KEY, $iv = self::IV)
	{
		$data = str_replace(['[a]', '[b]', '[c]'], ['+', '&', '/'], $data);
		$mod4 = strlen($data) % 4;
		if ($mod4) {
			$data .= substr('====', $mod4);
		}
		return openssl_decrypt(base64_decode($data), "AES-128-CBC", $key, OPENSSL_RAW_DATA, $iv);
	}

	/**
	 * 加密字符串，适合安全url传输
	 * @param string $data 字符串
	 * @param string $key  加密key
	 * @param string $iv
	 * @return string
	 */
	public static function encrypt($data, $key = self::KEY, $iv = self::IV)
	{
		$data = base64_encode(openssl_encrypt($data, "AES-128-CBC", $key, OPENSSL_RAW_DATA, $iv));
		$data = str_replace(['+', '&', '/', '='], ['[a]', '[b]', '[c]', ''], $data);
		return $data;
	}

}