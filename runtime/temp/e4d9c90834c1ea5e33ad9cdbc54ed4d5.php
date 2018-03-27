<?php /*a:3:{s:49:"D:\WWW\shop\application/admin/view\log\index.html";i:1522081377;s:53:"D:\WWW\shop\application/admin/view\public\header.html";i:1521987856;s:53:"D:\WWW\shop\application/admin/view\public\footer.html";i:1521785805;}*/ ?>
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
	<form class="layui-form" lay-filter="searchForm" id="searchForm">
		<div class="layui-form-item" style="float: left;">
			<div class="layui-input-inline">
				<input type="text" name="keyword" autocomplete="off" placeholder="输入查询的用户名，如果为空查询全部" class="layui-input layui-btn-sm">
			</div>
			<button type="submit" lay-submit lay-filter="searchForm" class="layui-btn layui-btn-warm"><i class="fa fa-search"></i> 搜索</button>
			<button class="layui-btn layui-btn-danger delBatch"><i class="fa fa-trash-o"></i> 批量删除</button>
		</div>
	</form>
</fieldset>
<div class="hr-line-dashed"></div>
<table id="datatable" lay-filter="datatable"></table>
<script type="text/html" id="toobar">
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="fa fa-trash-o"></i> 删除</a>
</script>
<script type="text/javascript">
	layui.config({
		base: '/static/admin/js/'
	}).use(['table', 'form', 'layer', 'jquery', 'utils', 'laytpl'], function () {
		var table = layui.table, form = layui.form,
			layer = layui.layer, $ = layui.jquery,
			utils = layui.utils, laytpl = layui.laytpl;
		var datatable = table.render({
			elem: '#datatable',
			height: 'full-120',
			limit: "<?php echo htmlentities($page_size); ?>",
			url: "<?php echo url('log/index'); ?>?t=" + new Date().getTime(),
			page: true,
			cols: [[
				{checkbox: true},
				{field: 'log_id', title: 'ID', align: 'center', width: 80},
				{field: 'admin_id', title: '用户ID', align: 'center', width: 80},
				{field: 'admin_name', title: '操作用户', align: 'center', width: 100},
				{field: 'description', title: '描述', align: 'center', width: 300},
				{field: 'ip', title: '操作IP', align: 'center', width: 100},
				{
					field: 'status', title: '状态', align: 'center', width: 80, templet: function (v) {
						if (v.status == 1) {
							return '<span class="layui-badge layui-bg-green">操作成功</span>';
						} else {
							return '<span class="layui-badge">操作失败</span>';
						}
					}
				},
				{
					field: 'add_time', title: '操作时间', align: 'center', width: 180,
					templet: '<div>{{ layui.utils.toDateString(d.add_time*1000) }}</div>'
				},
				{fixed: 'right', title: '操作', align: 'center', width: 100, toolbar: '#toobar'}
			]]
		});
		table.on('tool(datatable)', function (obj) {
			var row = obj.data; //获得当前行数据
			var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			if (layEvent === 'del') { //查看
				layer.confirm('确定要删除此日志吗？)', {title: '日志删除', icon: 0, btn: ['确定', '取消']}, function () {
					$.post("<?php echo url('log/del'); ?>" + '?t=' + new Date().getTime(), {log_id: row.log_id}, function (data) {
						if (data.code == 1) {
							layer.msg('日志删除成功', {icon: 1, time: 1000, offset: 't'}, function (index) {
								datatable.reload();
							});
						} else {
							layer.msg(data.msg, {offset: 't'});
						}
					}, 'json');
				});
			}
		});
		//监听搜索提交
		form.on('submit(searchForm)', function (data) {
			var keyword = encodeURI($('input[name=keyword]').val());
			datatable.reload({where: {keyword: keyword, page: 1}});
			return false;
		});
		// 批量删除
		$('.delBatch').on('click', function () {
			var checkStatus = table.checkStatus('datatable');
			if (checkStatus.data.length < 1) {
				layer.msg("至少选择一行", {icon: 5, anim: 6, offset: 't'});
				return false;
			}
			var checkgroup = [];
			checkStatus.data.forEach(function (v) {
				checkgroup.push(v.log_id);
			});
			var ids = checkgroup.join(',');
			layer.confirm('确定要批量删除选中的日志吗？)', {title: '日志批量删除', icon: 0, btn: ['确定', '取消']}, function () {
				$.post("<?php echo url('log/del'); ?>" + '?t=' + new Date().getTime(), {log_id: ids}, function (data) {
					if (data.code == 1) {
						layer.msg('日志批量删除成功', {icon: 1, time: 1000, offset: 't'}, function (index) {
							datatable.reload();
						});
					} else {
						layer.msg(data.msg, {offset: 't'});
					}
				}, 'json');
			});
			return false;
		})
	});
</script>
</div>
</div>
</body>
</html>