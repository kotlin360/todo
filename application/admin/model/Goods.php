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
	 * @return array
	 */
	public function createGoods($data)
	{
		Db::startTrans();
		try {

			//1、首先处理规格笛卡尔积
			$value_dcr = []; //value的笛卡尔积
			$specs_goods = []; // 写入商品表的规格数组，需要序列化
			$values_array = [];
			$spec_key = $data['extend']['spec_key'];
			$spec_key_array = explode(",", $spec_key);
			$spec_value = $data['extend']['spec_value'];
			if (is_array($spec_value)) {
				// 如果开启了规格会进入此if
				// 打个比方$spec['spec_value']为数组：[[0] => 2:金色,8:6G,[1] => 2:金色,9:8G]
				foreach ($spec_value as $item) {
					// 第一次循环 $values = [ 2:金色，8:6G]
					$values = explode(",", $item);
					foreach ($values as $value) {
						$value_items = explode(":", $value);
						$values_array[$value_items[0]] = $value_items;
					}
				}
				// $values_array为[[2=>[2,金色]],[8=>[8,6G]],[9=>[9,8G]]]
				$value_ids = implode(",", array_keys($values_array));
				$specs = Db::name('goods_spec')->where("id in ({$spec_key})")->field('id,name,value,status')->select();
				$values = Db::name('goods_spec_value')->where("id in ({$value_ids})")->sort('sort')->select();
				$values_new = [];
				foreach ($values as $k => $row) {
					$current = $values_array[$row['id']];
					$values_new[$row['spec_id']][$row['id']] = $row;
				}
				foreach ($specs as $key => $value) {
					$value['value'] = isset($values_new[$value['id']]) ? $values_new[$value['id']] : null;
					$specs_goods[$value['id']] = $value;
				}
				foreach ($spec_value as $item) {
					$values = explode(",", $item);
					$key_code = ';';
					foreach ($values as $k => $value) {
						$value_items = explode(":", $value);
						$key = $spec_key_array[$k];
						$tem[$key] = $specs_goods[$key];
						$tem[$key]['value'] = $values_array[$value_items[0]];
						$key_code .= $key . ':' . $values_array[$value_items[0]][0] . ';';
					}
					$value_dcr[$key_code] = $tem;
				}
			}
			//2、把商品基本信息写入到表中，获得商品的id
			$data['base']['specs'] = serialize($specs_goods);
			$this->save($data['base']);
			$goods_id = $this->getLastInsID();
			//3、写商品的相册
			$imgData = [];
			foreach ($data['base']['imgs'] as $v) {
				$imgData[] = ['goods_id' => $goods_id, 'img' => $v];
			}
			Db::name('goods_images')->insertAll($imgData);
			//4、最后处理规格问题
			$k = 0;
			foreach ($value_dcr as $key => $value) {
				$products = [
					'goods_id' => $goods_id, 
					'spec_sn' => $data['extend']['spec_sn'][$k],
					'spec' => serialize($value),
					'specs_key' => $key,
					'stock' => $data['extend']['stock'][$k],
					'warning_line' => $data['extend']['warning_line'][$k],
					'style' => $data['extend']['style'][$k],
					'cash' => $data['extend']['cash'][$k],
					'score' => $data['extend']['score'][$k],
					'gift' => $data['extend']['gift'][$k],
					'is_online' => $data['extend']['is_online'][$k]
				];
				Db::name('products')->insert($products);
				$k++;
			}
			if($k == 0) {
				// 没有规格
				$data['extend']['goods_id'] = $goods_id;
				Db::name('goods_products')->insert($spec,$data['extend']);
			} 			
			Db::commit();
			//return ['code' => 1];
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
