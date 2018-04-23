<?php
namespace app\admin\controller;

use think\Controller;
use think\facade\Config;
use think\Image;

/**
 * @project  系统错误异常控制器和文件上传等功能
 * @author   千叶
 * @date     2018-03-28
 */
class System extends Controller
{
	/**
	 * 系统异常页面展示，主要用于layer弹窗
	 * @return mixed
	 */
	public function mistake()
	{
		return $this->fetch('public/mistake');
	}

	/**
	 * 商品图册轮播图片上传
	 * 保存到根目录下的uploads目录下的年月子目录
	 */
	public function upload()
	{
		$file = $this->request->file('file');
		$size_allow = Config::get('file_upload_size');
		$ext_allow = 'gif,jpg,jpeg,bmp,png';
		$subpath = date('Ym'); // 子目录格式
		$info = $file->validate(['size' => $size_allow, 'ext' => $ext_allow])->rule('uniqid')
			->move('./uploads/' . $subpath);
		if ($info) {
			// 成功上传后,缩放图片340*228,获取上传信息
			$image = $subpath . '/' . $info->getSaveName();
			$thumbImage = './uploads/' . $subpath . '/m_' . $info->getSaveName();
			Image::open('./uploads/' . $image)->thumb(160, 114, Image::THUMB_CENTER)->save($thumbImage);
			$json = ['code' => 1, 'filename' => $image];
		} else {
			// 上传失败获取错误信息
			$json = ['code' => 0, 'msg' => $file->getError()];
		}
		return json($json);
	}

	/**
	 * 因为百度UM对格式返回要要求，就单独重写了UM的上传
	 * @return \think\response\Json
	 */
	public function um_upload()
	{
		ini_set("max_execution_time", 0);
		$file = $this->request->file('upfile');
		$fileInfo = $file->getInfo();
		$size_allow = Config::get('file_upload_size');
		$ext_allow = 'gif,jpg,jpeg,bmp,png';
		$subpath = date('Ym'); // 子目录格式
		$info = $file->validate(['size' => $size_allow, 'ext' => $ext_allow])->rule('uniqid')
			->move('./uploads/' . date('Ym'));
		if ($info) {
			// 成功上传后 获取上传信息
			$json = [
				'state' => 'SUCCESS',
				'originalName' => $fileInfo['name'],
				'name' => $info->getFilename(),
				'size' => $info->getSize(),
				'type' => '.' . $info->getExtension(),
				'url' => 'uploads/' . $subpath . '/' . $info->getSaveName()
			];
		} else {
			// 上传失败获取错误信息
			$json = ['state' => $file->getError()];
		}
		return json($json);
	}
}
