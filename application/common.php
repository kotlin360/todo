<?php

use think\Collection;

// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------
// 应用公共文件
function p($arr)
{
	echo '<pre>';
	print_r($arr);
	echo '</pre>';
}

/**
 * 随机生成订单号
 * @return string
 */
function build_order_no()
{
	$random1 = date('Ymd') . str_pad(mt_rand(1, 9999), 4, '0', STR_PAD_LEFT);
	$random2 = substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 4, 4);
	return $random1 . $random2;
}

/**
 * Create a collection from the given value
 * @param null $value
 * @return static
 */
function collect($value = null)
{
	return Collection::make($value);
}