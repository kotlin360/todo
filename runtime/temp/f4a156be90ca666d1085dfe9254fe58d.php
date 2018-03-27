<?php /*a:3:{s:50:"D:\WWW\shop\application/admin/view\data\index.html";i:1522051490;s:53:"D:\WWW\shop\application/admin/view\public\header.html";i:1521987856;s:53:"D:\WWW\shop\application/admin/view\public\footer.html";i:1521785805;}*/ ?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link rel="stylesheet" href="/static/admin/layui/css/layui.css" media="all">
	<link rel="stylesheet" href="/static/admin/css/font-awesome.min.css" media="all">
	<link rel="stylesheet" href="/static/admin/css/admin-1.css" media="all">
	<link rel="stylesheet" href="/static/admin/css/style.css" media="all">
	<script type="text/javascript" src="/static/admin/layui/layui.js"></script>
	<script type="text/javascript" src="/static/admin/js/jquery.min.js"></script>
</head>
<body class="layui-layout-body" style="overflow-y:visible;">
<!-- 主体内容 -->
<div class="layadmin-tabsbody-item layui-show">
	<div class="layui-fluid">

<fieldset class="layui-elem-field" style="border:0">
	<div class="layui-form-item" style="float: left;">
		<button class="layui-btn layui-btn-warm backup"><i class="fa fa-copy"></i> 立即备份</button>
		<button class="layui-btn optimizeBatch"><i class="fa fa-gavel"></i> 优化表</button>
		<button class="layui-btn layui-btn-danger repaireBatch"><i class="fa fa-gear"></i> 修复表</button>
	</div>
</fieldset>
<blockquote class="layui-elem-quote layui-quote-nm">
	提示：1、您对可变长度的行进行了大量的更新，您也不须要常常执行优化，每周一次或每月一次就可以，仅仅对特定的表执行。2、在备份、优化或者修复执行过程中，MySQL会锁定表
</blockquote>
<div class="hr-line-dashed"></div>
<table id="datatable" lay-filter="datatable"></table>
<script type="text/html" id="toobar">
	<a class="layui-btn layui-btn-xs" lay-event="optimize"><i class="fa fa-gavel"></i> 优化表</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="repair"><i class="fa fa-gear"></i> 修复表</a>
</script>
<script type="text/javascript">
	// 优化表函数
	function ajax_optimize(ids) {
		$.post("<?php echo url('data/optimize'); ?>" + '?t=' + new Date().getTime(), {ids: ids}, function (data) {
			if (data.code == 1) {
				layer.msg('数据表优化成功', {icon: 1, time: 1000, offset: 't'});
			} else {
				layer.msg(data.msg, {offset: 't', icon: 2});
			}
		}, 'json');
	}

	// 修复表函数
	function ajax_repair(ids) {
		$.post("<?php echo url('data/repair'); ?>" + '?t=' + new Date().getTime(), {ids: ids}, function (data) {
			if (data.code == 1) {
				layer.msg('数据表修复成功', {icon: 1, time: 1000, offset: 't'});
			} else {
				layer.msg(data.msg, {offset: 't', icon: 2});
			}
		}, 'json');
	}

	layui.config({
		base: '/static/admin/js/'
	}).use(['table', 'form', 'layer', 'jquery', 'utils', 'laytpl', 'element'], function () {
		var table = layui.table, form = layui.form,
			layer = layui.layer, $ = layui.jquery,
			utils = layui.utils, laytpl = layui.laytpl,
			element = layui.element;
		var datatable = table.render({
			elem: '#datatable',
			height: 'full-120',
			page: false,
			url: "<?php echo url('data/index'); ?>?t=" + new Date().getTime(),
			cols: [[
				{checkbox: true},
				{field: 'name', title: '表名', align: 'center', width: 200},
				{
					field: 'rows', title: '数据量', align: 'center', width: 180,
					templet: '<div>【{{ d.rows}}】条记录</div>'
				},
				{
					field: 'data_length', title: '数据大小', align: 'center', width: 150,
					templet: '<div>{{ layui.utils.formatFileSize(d.data_length)}}</div>'
				},
				{
					field: 'add_time', title: '创建时间', align: 'center', width: 180,
					templet: '<div>{{ layui.utils.toDateString(d.add_time*1000) }}</div>'
				},
				{
					title: '备份状态', align: 'center', width: 120,
					templet: '<div>等待备份...</div>'
				},
				{title: '操作', align: 'center', width: 200, toolbar: '#toobar'}
			]]
		});
		table.on('tool(datatable)', function (obj) {
			var row = obj.data; //获得当前行数据
			var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			if (layEvent === 'optimize') {
				ajax_optimize(row.name);
			} else if (layEvent === 'repair') {
				ajax_repair(row.name);
			}
		});

		// 获取批量选中的行，包含表名name
		function getSelectedRow() {
			var checkStatus = table.checkStatus('datatable');
			var checkgroup = [];
			if (checkStatus.data.length < 1) {
				layer.msg("至少选择一行", {icon: 5, anim: 6, offset: 't'});
				return false;
			}
			checkStatus.data.forEach(function (v) {
				checkgroup.push(v.name);
			});
			return checkgroup.join(',');
		}

		$(function () {
			$('.backup').on('click', function () {
				var ids = getSelectedRow();
				console.log(ids);
				if (ids !== false) {
					$.ajax({
						url: "<?php echo url('data/backup'); ?>?t=" + new Date().getTime(),
						type: 'post',
						data: 'ids=' + ids,
						dataType: 'json',
						beforeSend: function () {
							loading = layer.msg('数据库备份中，请稍后……', {
								icon: 16, shade: 0.3, shadeClose: false, time: 0
							});
						},
						success: function (data) {
							layer.close(loading);
							if (data.code == 1) {
								layer.msg('数据表备份成功，马上跳转到备份列表页……', {icon: 1, time: 2000, offset: 't'}, function () {
									window.location.href = data.url;
								})
							} else {
								layer.msg(data.msg, {offset: 't', icon: 2});
							}
						}
					})
				}
			});
			$('.optimizeBatch').on('click', function () {
				var ids = getSelectedRow();
				if (ids !== false) {
					ajax_optimize(ids);
				}
			});
			$('.repaireBatch').on('click', function () {
				var ids = getSelectedRow();
				if (ids !== false) {
					ajax_repair(ids);
				}
			})
		})
	});
</script>
</div>
</div>
</body>
</html>