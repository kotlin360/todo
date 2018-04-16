<?php
namespace app\admin\widget;

use think\Controller;
use think\Db;

/**
 * @project  商品规格修改小部件，用于规格修改
 * @author   千叶
 * @date     2018-04-08
 */
class Goods extends Controller
{
	/**
	 * 规格修改处理
	 * @param $id
	 * @return mixed
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function spec($id)
	{
		$specs = Db::name('goods')->where("id={$id}")->value('specs');
		if ($specs == null) {
			// 不存在存在规格
			$extend = Db::name('goods_products')->where("goods_id={$id}")->field(true)->find();
		} else {
			// 存在规格
			$specs = unserialize($specs);
			$spec_ids = '';
			foreach ($specs as $v) {
				$spec_ids .= $v['id'] . ',';
				$spec_key[] = $v['name'];
			}
			$spec_ids = rtrim($spec_ids, ',');
			$cursor = Db::name('goods_products')->where("goods_id={$id}")->field('spec_sn,spec_value,stock,warning_line,style,cash,score,freight,gift,is_online')->cursor();
			// 3:银色,8:6G
			foreach ($cursor as $k => $v) {
				$spec_value = '';
				$spec_string = [];
				$extend[$k] = $v;
				$specs = unserialize($v['spec_value']);
				foreach ($specs as $val) {
					$spec_string[] = $val['value'][1];
					$spec_value .= $val['value'][0] . ':' . $val['value'][1] . ',';
				}
				$spec_value = rtrim($spec_value, ',');
				$extend[$k]['spec_string'] = $spec_string;
				$extend[$k]['spec_value'] = $spec_value;
			}
			$this->assign('spec_ids', $spec_ids);
		}
		$this->assign('specs', $specs);
		$this->assign('extend', $extend);
		return $this->fetch('goods/goods_widget');
	}
}