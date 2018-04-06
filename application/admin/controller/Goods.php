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
	 * @return mixed
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
	 * @return mixed|\think\response\Json
	 */
	public function add(GoodsModel $goodsModel, GoodsValidate $goodsValidate,
	                    CategoryModel $categoryModel, ConfigModel $configModel)
	{
		if ($this->request->isAjax()) {
			$data = [
				// 基本信息部分
				'base' => [
					'title' => input('title', ''),
					'cate_id' => input('cate_id', 0, 'intval'),
					'sn' => input('sn', ''),
					'unit' => input('unit', ''),
					'freight' => input('freight', 0, 'intval'),
					'status' => input('status', 1, 'intval'),
					'description' => input('description', ''),
					'imgs' => input('imgs/a', '')
				],
				// 下面是规格扩展
				'extend' => [
					'spec_sn' => input('spec_sn/a'),
					'spec_key' => input('spec_key',null), // 只有一个，不需用数组接
					'spec_value' => input('spec_value/a',null),
					'stock' => input('stock/a'),
					'warning_line' => input('warning_line/a'),
					'style' => input('style/a'),
					'cash' => input('cash/a'),
					'score' => input('score/a'),
					'gift' => input('gift/a'),
					'is_online' => input('is_online/a')
				]
			];
			if (!$goodsValidate->check($data['base'])) {
				return json(['code' => 0, 'msg' => $goodsValidate->getError()]);
			}
			$result = $goodsModel->createGoods($data);
			return json($result);
		} else {
			$cate = $categoryModel->getAllCate(); // 商品类别
			$cate === null && $this->redirect(url('system/mistake'));
			$sn = 'G' . date('ymd') . time();
			// 获取商品和积分的一些配置参数
			$params = $configModel->getAllParam();
			// $params_json_string = json_encode((object)$params, JSON_UNESCAPED_UNICODE);
			// $this->assign(['sn' => $sn, 'cate' => $cate, 'params' => $params_json_string]);
			$this->assign(['sn' => $sn, 'cate' => $cate, 'params' => $params]);
			return $this->fetch();
		}
	}

	/**
	 * 添加商品选择规格界面
	 * @return mixed
	 */
	public function spec_select(specModel $specModel)
	{
		$spec = $specModel->getAllSpec();// 商品规格
		return $this->assign('spec', $spec)->fetch();
	}
}