<?php
namespace app\admin\model;

use think\Db;
use think\Model;

/**
 * @project  商品模型
 * @author   千叶
 * @date     2018-03-28
 */
class Goods extends Model
{
	// 开启自动写入时间
	protected $autoWriteTimestamp = true;

	/**
	 * 创建商品
	 * @param $data
	 * @param $spec
	 * @return array
	 */
	public function createGoods($data, $spec)
	{
		Db::startTrans();
		try {
			// 首先把商品基本信息写入到表中，获得商品的id
			$this->save($data);
			$goods_id = $this->getLastInsID();
			// 然后写商品的相册
			$imgData = [];
			foreach ($data['imgs'] as $v) {
				$imgData[] = ['goods_id' => $goods_id, 'img' => $v];
			}
			Db::name('goods_images')->insertAll($imgData);
			// 最后处理规格问题
			if ($data['is_spec'] == 1) {
				// 开启了规格
				p($spec);
				die;
			} else {
				// 没有规格
				$spec['goods_id'] = $goods_id;
				Db::name('goods_products')->insert($spec);
			}
			Db::commit();
			return ['code' => 1];
		} catch (\Exception $e) {
			Db::rollback();
			return ['code' => 0, 'msg' => '创建失败：' . $e->getMessage()];
		}
	}

	/**
	 * 根据条件获取商品
	 * @param $map
	 * @param $cur_page
	 * @param $limits
	 * @return array
	 */
	public function getDataByWhere($map, $cur_page, $limits)
	{
		try {
			$count = $this->where($map)->count();
			$list = $this->alias('g')
				->join('goods_category c', 'g.cate_id = c.id')
				->where($map)->page($cur_page, $limits)
				->field('g.*,c.name as cate_name')->select();
			$json = [
				'code' => 0,
				'msg' => '',
				'count' => $count,
				'data' => $list
			];
			return $json;
		} catch (\Exception $e) {
			return ['code' => 404, 'msg' => '商品获取失败：' . $e->getMessage()];
		}
	}
}
