<?php /*a:3:{s:51:"D:\WWW\shop\application/admin/view\admin\index.html";i:1522143769;s:53:"D:\WWW\shop\application/admin/view\public\header.html";i:1522112100;s:53:"D:\WWW\shop\application/admin/view\public\footer.html";i:1522112100;}*/ ?>
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
				<input type="text" name="keyword" autocomplete="off" placeholder="输入真实姓名关键字，如果为空查询全部" class="layui-input layui-btn-sm">
			</div>
			<button type="submit" lay-submit lay-filter="searchForm" class="layui-btn layui-btn-warm"><i class="fa fa-search"></i> 搜索</button>
			<button class="layui-btn" id="addBtn"><i class="fa fa-plus"></i> 新增系统用户（默认初始密码123456）</button>
		</div>
	</form>
</fieldset>
<div class="hr-line-dashed"></div>
<table id="datatable" lay-filter="datatable"></table>
<script type="text/html" id="toobar">
	{{# if(d.id !=1){ }}
	<a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="edit"><i class="fa fa-edit"></i> 编辑</a>
	{{# } }}
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="resetpwd"><i class="fa fa-lock"></i> 密码重置</a>
</script>
<script type="text/javascript">
	layui.config({
		base: '/static/admin/js/'
	}).use(['table', 'form', 'layer', 'jquery', 'utils'], function () {
		var table = layui.table, form = layui.form,
			layer = layui.layer, $ = layui.jquery,
			utils = layui.utils;
		var datatable = table.render({
			elem: '#datatable',
			height: 'full-120',
			limit: "<?php echo htmlentities($page_size); ?>",
			url: "<?php echo url('admin/index'); ?>?t=" + new Date().getTime(),
			page: true,
			cols: [[
				{field: 'id', title: 'UID', align: 'center', width: 80},
				{field: 'username', title: '用户名', align: 'center', width: 120},
				{field: 'real_name', title: '真实姓名', align: 'center', width: 120},
				{field: 'loginnum', title: '登录次数', align: 'center', width: 120},
				{field: 'last_login_ip', title: '最后登录IP', align: 'center', width: 150},
				{
					field: 'last_login_time', title: '最后登录时间', align: 'center', width: 180,
					templet: '<span>{{ layui.utils.toDateString(d.last_login_time*1000) }}</span>'
				},
				{
					field: 'status', title: '状态', align: 'center', width: 80, templet: function (v) {
						if (v.status == 1 && v.id == 1) {
							return '已开启';
						} else if (v.status == 1) {
							return '<a class="layui-btn layui-btn-xs changeStatus" href="<?php echo url('admin/change_status'); ?>?id="' + v.id + '.html status="' + v.status + '">已开启</a>';
						} else {
							return '<a class="layui-btn layui-btn-danger layui-btn-xs changeStatus" href="<?php echo url('admin/change_status'); ?>?id="' + v.id + '.html status="\' + v.status + \'">已禁用</a>\n';
						}
					}
				},
				{title: '操作', align: 'center', toolbar: '#toobar', width: 220}
			]]
		});
		table.on('tool(datatable)', function (obj) {
			var data = obj.data;
			var layEvent = obj.event;

			if (layEvent === 'edit') {
				layer.open({
					type: 2,
					title: '修改系统用户',
					area: ['620px', '450px'],
					scrollbar: false,
					anim: 2,
					shadeClose: true,
					content: "<?php echo url('admin/edit'); ?>?t=" + new Date().getTime() + '&id=' + data.id
				});
			} else if (layEvent === 'resetpwd') {
				layer.confirm('确定要重置 "' + data.real_name + '" 的密码吗？<br>(提示：重置后密码为123456)', {title: '密码重置提示', icon: 0, btn: ['确定', '取消']}, function () {
					$.post("<?php echo url('admin/resetpwd'); ?>?t=" + new Date().getTime(), {id: data.id}, function (data) {
						if (data.code == 1) {
							layer.msg('密码重置成功', {icon: 1, time: 1500, offset: 't'});
						} else {
							layer.msg(data.msg, {offset: 't', icon: 2});
						}
					}, 'json');
				});
			}
		});
		// 添加菜单事件
		$('#addBtn').on('click', function () {
			layer.open({
				type: 2,
				title: '新增系统用户（默认初始密码123456）',
				area: ['620px', '450px'],
				scrollbar: false,
				anim: 2,
				shadeClose: true,
				content: "<?php echo url('admin/add'); ?>"
			});
			return false;
		});
		//监听搜索提交
		form.on('submit(searchForm)', function (data) {
			var keyword = encodeURI($('input[name=keyword]').val());
			datatable.reload({where: {keyword: keyword, page: 1}});
			return false;
		});
	});
</script>
</div>
</div>
</body>
</html>