<?php
namespace app\admin\model;

use think\Db;
use think\facade\Config;
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
	 * @param $data       商品基本信息
	 * @param $extend     规格扩展属性
	 * @return array
	 */
	public function createGoods($data, $extend)
	{
		Db::startTrans();
		try {
			//1、首先处理规格笛卡尔积
			$value_dcr = []; //value的笛卡尔积
			$specs_goods = []; // 写入商品表的规格数组，需要序列化
			$values_array = [];
			$spec_key = $extend['spec_key'];
			$spec_key_array = explode(',', $spec_key);
			$spec_value = $extend['spec_value'];
			if (is_array($spec_value)) {
				// 开启了规格，打个比方$spec['spec_value']为数组：[[0] => 2:金色,8:6G,[1] => 2:金色,9:8G]
				foreach ($spec_value as $item) {
					// 第一次循环 $values = [ 2:金色，8:6G]
					$values = explode(',', $item);
					foreach ($values as $value) {
						$value_items = explode(':', $value);
						$values_array[$value_items[0]] = $value_items;
					}
				}
				// $values_array为[[2=>[2,金色]],[8=>[8,6G]],[9=>[9,8G]]]
				$value_ids = implode(',', array_keys($values_array));
				$specs = Db::name('goods_spec')->where("id in ({$spec_key})")->field('id,name,value,status')->select();
				$values = Db::name('goods_spec_value')->where("id in ({$value_ids})")->order('sort')->select();
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
					$values = explode(',', $item);
					$key_code = ';';
					foreach ($values as $k => $value) {
						$value_items = explode(':', $value);
						$key = $spec_key_array[$k];
						$tem[$key] = $specs_goods[$key];
						$tem[$key]['value'] = $values_array[$value_items[0]];
						$key_code .= $key . ':' . $values_array[$value_items[0]][0] . ';';
					}
					$value_dcr[$key_code] = $tem;
				}
			}
			//2、把商品基本信息写入到表中，获得商品的id
			$data['specs'] = !empty($specs_goods) ? serialize($specs_goods) : null;
			$this->save($data);
			$goods_id = $this->getLastInsID();
			//3、写商品的相册
			$imgData = [];
			foreach ($data['imgs'] as $v) {
				$imgData[] = ['goods_id' => $goods_id, 'img' => $v];
			}
			Db::name('goods_images')->insertAll($imgData);
			//4、最后处理规格问题
			$k = 0;
			foreach ($value_dcr as $key => $value) {
				$products = [
					'goods_id' => $goods_id,
					'spec_sn' => $extend['spec_sn'][$k],
					'spec_value' => serialize($value),
					'spec_key' => $key,
					'stock' => $extend['stock'][$k],
					'warning_line' => $extend['warning_line'][$k],
					'style' => $extend['style'][$k],
					'cash' => $extend['cash'][$k],
					'score' => $extend['score'][$k],
					'gift' => $extend['gift'][$k],
					'is_online' => $extend['is_online'][$k]
				];
				Db::name('goods_products')->insert($products);
				$k++;
			}
			if ($k == 0) {
				// 没有规格
				$extend['goods_id'] = $goods_id;
				Db::name('goods_products')->insert($extend);
			}
			Db::commit();
			return ['code' => 1];
		} catch (\Exception $e) {
			Db::rollback();
			return ['code' => 0, 'msg' => '创建失败：' . $e->getMessage()];
		}
	}

	/**
	 * 根据商品id获取商品所有信息，用于修改商品
	 * @param $id
	 * @return array|null
	 */
	public function getGoodsById($id)
	{
		try {
			$base = Db::name('goods')->where("id={$id}")->find();
			$base['imgs'] = json_encode(Db::name('goods_images')->where("goods_id={$id}")->field('id,img')->select());
			return $base;
		} catch (\Exception $e) {
			return null;
		}
	}

	/**
	 * 根据商品ID获取商品规格信息，用于查看商品详情
	 * @param $id
	 * @return array
	 */
	public function getSpecById($id)
	{
		try {
			$specs = $this->where("id={$id}")->value('specs');
			if ($specs == null) {
				$products = Db::name('goods_products')->where("goods_id={$id}")->field(true)->find();
			} else {
				$cursor = Db::name('goods_products')->where("goods_id={$id}")->field('spec_sn,spec_value,stock,warning_line,style,cash,score,gift,is_online')->cursor();
				foreach ($cursor as $k => $v) {
					$products[$k] = $v;
					$products[$k]['spec_value'] = unserialize($v['spec_value']);
				}
			}
			return ['code' => 1, 'specs' => unserialize($specs), 'products' => $products];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => '获取详情失败：' . $e->getMessage()];
		}
	}

	/**
	 * 修改商品上下架状态（上架或者下架）
	 * @param $id
	 * @param $status
	 * @return array
	 */
	public function changeStatus($id, $status)
	{
		$msg = $status == 1 ? '下架' : '上架';
		try {
			$tableName = Config::get('database.prefix') . $this->name;
			$sql = "UPDATE {$tableName} SET status = (case status when 0 then 1 else 0  end) WHERE id={$id}";
			Db::execute($sql);
			return ['code' => 1];
		} catch (\Exception $e) {
			return ['code' => 0, 'msg' => $msg . '商品失败：' . $e->getMessage()];
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
				->field('g.*,c.name as cate_name')->order('g.update_time DESC')->select();
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
