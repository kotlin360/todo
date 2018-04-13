<?php
namespace app\admin\controller;

use app\admin\model\Category as CategoryModel;
use app\admin\model\Config as ConfigModel;
use app\admin\model\Goods as GoodsModel;
use app\admin\model\Spec as SpecModel;
use app\admin\validate\Goods as GoodsValidate;
use think\facade\Config;

/**
 * @project  商品管理控制器
 * @author   千叶
 * @date     2018-03-28
 */
class Goods extends Base
{
	/**
	 * 商品列表
	 * @param GoodsModel $goodsModel
	 * @return mixed|\think\response\Json
	 */
	public function index(GoodsModel $goodsModel)
	{
		if ($this->request->isAjax()) {
			$cur_page = input('page', 1, 'intval');
			$keyword = input('keyword', '', 'urldecode');
			$page_size = input('limit', Config::get('page_size'), 'intval');
			$map = $keyword ? "g.title like '%{$keyword}%'" : '';
			$json = $goodsModel->getDataByWhere($map, $cur_page, $page_size);
			return json($json);
		} else {
			$page_size = Config::get('page_size');
			return $this->assign('page_size', $page_size)->fetch();
		}
	}

	/**
	 * 新增商品
	 * @param GoodsModel    $goodsModel
	 * @param GoodsValidate $goodsValidate
	 * @param CategoryModel $categoryModel
	 * @param ConfigModel   $configModel
	 * @return mixed|\think\response\Json
	 */
	public function add(GoodsModel $goodsModel, GoodsValidate $goodsValidate,
	                    CategoryModel $categoryModel, ConfigModel $configModel)
	{
		if ($this->request->isAjax()) {
			$spec_key = input('spec_key', null);
			// 基本信息部分
			$data = [
				'title' => input('title', ''),
				'cate_id' => input('cate_id/d', 0),
				'sn' => input('sn', ''),
				'unit' => input('unit', '件'),
				'status' => input('status/d', 1),
				'description' => input('description', ''),
				'imgs' => input('imgs/a')
			];
			// 下面是规格扩展
			if ($spec_key === null) {
				// 没有规格
				$extend = [
					'spec_sn' => input('spec_sn'),
					'location' => input('location'),
					'spec_key' => null,
					'spec_value' => null,
					'stock' => input('stock/d', 0),
					'warning_line' => input('warning_line/d', 0),
					'style' => input('style/d'),
					'cash' => input('cash'),
					'score' => input('score'),
					'freight' => input('freight', 0),
					'gift' => input('gift', 0),
					'is_online' => input('is_online/d', 1)
				];
			} else {
				// 存在多个规格
				$extend = [
					'spec_sn' => input('spec_sn/a'),
					'location' => input('location/a'),
					'spec_key' => $spec_key,
					'spec_value' => input('spec_value/a', null),
					'stock' => input('stock/a'),
					'warning_line' => input('warning_line/a'),
					'style' => input('style/a'),
					'cash' => input('cash/a'),
					'score' => input('score/a'),
					'freight' => input('freight/a'),
					'gift' => input('gift/a'),
					'is_online' => input('is_online/a')
				];
			}
			if (!$goodsValidate->check($data)) {
				return json(['code' => 0, 'msg' => $goodsValidate->getError()]);
			}
			$result = $goodsModel->createGoods($data, $extend);
			return json($result);
		} else {
			$cate = $categoryModel->getAllCate(); // 商品类别
			$cate === null && $this->redirect(url('system/mistake'));
			$sn = 'G' . date('ymd') . time();
			// 获取商品和积分的一些配置参数
			$params = $configModel->getAllParam();
			$this->assign(['sn' => $sn, 'cate' => $cate, 'params' => $params]);
			return $this->fetch();
		}
	}

	/**
	 * 修改商品
	 * @param GoodsModel    $goodsModel
	 * @param GoodsValidate $goodsValidate
	 * @param CategoryModel $categoryModel
	 * @param ConfigModel   $configModel
	 * @return mixed
	 */
	public function edit(GoodsModel $goodsModel, GoodsValidate $goodsValidate,
	                     CategoryModel $categoryModel, ConfigModel $configModel)
	{
		$goods_id = input('id/d', 0);
		if ($this->request->isAjax()) {
			$spec_key = input('spec_key', null);
			// 基本信息部分
			$base = [
				'title' => input('title', ''),
				'cate_id' => input('cate_id/d', 0),
				'sn' => input('sn', ''),
				'unit' => input('unit', '件'),
				'status' => input('status/d', 1),
				'description' => input('description', ''),
				'imgs' => input('imgs/a')
			];
			// 下面是规格扩展
			if ($spec_key === null) {
				// 没有规格
				$extend = [
					'spec_sn' => input('spec_sn'),
					'location' => input('loation'),
					'spec_key' => null,
					'spec_value' => null,
					'stock' => input('stock/d', 0),
					'warning_line' => input('warning_line/d', 0),
					'style' => input('style/d'),
					'cash' => input('cash'),
					'score' => input('score'),
					'freight' => input('freight', 0),
					'gift' => input('gift', 0),
					'is_online' => input('is_online/d', 1)
				];
			} else {
				// 存在多个规格
				$extend = [
					'spec_sn' => input('spec_sn/a'),
					'location' => input('location/a'),
					'spec_key' => $spec_key,
					'spec_value' => input('spec_value/a', null),
					'stock' => input('stock/a'),
					'warning_line' => input('warning_line/a'),
					'style' => input('style/a'),
					'cash' => input('cash/a'),
					'score' => input('score/a'),
					'freight' => input('freight/a'),
					'gift' => input('gift/a'),
					'is_online' => input('is_online/a')
				];
			}
			if (!$goodsValidate->check($base)) {
				return json(['code' => 0, 'msg' => $goodsValidate->getError()]);
			}
			$result = $goodsModel->editGoods($goods_id, $base, $extend);
			return json($result);
		} else {
			$cate = $categoryModel->getAllCate(); // 商品类别
			$base = $goodsModel->getGoodsById($goods_id); // 商品基本信息
			if ($cate === null || $base == null) {
				$this->redirect(url('system/mistake'));
			}
			$params = $configModel->getAllParam();
			$this->assign(['cate' => $cate, 'base' => $base, 'params' => $params]);
			return $this->fetch();
		}
	}

	/**
	 * 商品规格详情查看
	 * @param GoodsModel $goodsModel
	 * @param            $id
	 * @return \think\response\Json
	 */
	public function detail(GoodsModel $goodsModel, $id)
	{
		return json($goodsModel->getSpecById($id));
	}

	/**
	 * 修改商品上下架状态（上架或者下架）
	 * @param GoodsModel $goodsModel
	 * @return \think\response\Json
	 */
	public function change_status(GoodsModel $goodsModel)
	{
		$id = input('param.id', 0, 'intval');
		$status = input('param.status', 1, 'intval');
		return json($goodsModel->changeStatus($id, $status));
	}

	/**
	 * 添加商品选择规格界面
	 * @param SpecModel $specModel
	 * @return mixed
	 */
	public function spec_select(specModel $specModel)
	{
		$spec = $specModel->getAllSpec();// 商品规格
		return $this->assign('spec', $spec)->fetch();
	}
}
