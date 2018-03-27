<?php
/**
 * 递归获取排序的权限树
 * @param     $menuTree
 * @param int $id
 * @return array
 */
function prepareMenu($menuTree, $id = 0)
{
	$tree = [];
	foreach ($menuTree as $v) {
		if ($v['pid'] == $id) {
			$v['child'] = prepareMenu($menuTree, $v['id']);
			$tree[] = $v;
		}
		continue;
	}
	return $tree;
}

/**
 * 显示多个空格
 * @param $num
 * @return string
 */
function space($num)
{
	$px = --$num * 15;
	return "<span style=padding-left:{$px}px></span>";
}

/**
 * 格式化字节大小
 * @param  number $size      字节数
 * @param  string $delimiter 数字和单位分隔符
 * @return string            格式化后的带单位的大小
 */
function format_bytes($size, $delimiter = '')
{
	$units = array('B', 'KB', 'MB', 'GB', 'TB', 'PB');
	for ($i = 0; $size >= 1024 && $i < 5; $i++) $size /= 1024;
	return round($size, 2) . $delimiter . $units[$i];
}

/**
 * 如果直接使用base64_encode和base64_decode方法的话，生成的字符串可能不适用URL地址
 * URL安全的字符串编码
 * @param $string
 * @return mixed|string
 */
function urlsafe_b64encode($string)
{
	$data = base64_encode($string);
	$data = str_replace(array('+', '/', '='), array('-', '_', ''), $data);
	return $data;
}

/**
 * 如果直接使用base64_encode和base64_decode方法的话，生成的字符串可能不适用URL地址
 * URL安全的字符串解码
 * @param $string
 * @return bool|string
 */
function urlsafe_b64decode($string)
{
	$data = str_replace(array('-', '_'), array('+', '/'), $string);
	$mod4 = strlen($data) % 4;
	if ($mod4) {
		$data .= substr('====', $mod4);
	}
	return base64_decode($data);
}