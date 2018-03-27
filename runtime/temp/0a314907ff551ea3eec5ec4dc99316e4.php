<?php /*a:3:{s:50:"D:\WWW\shop\application/admin/view\role\index.html";i:1522043843;s:53:"D:\WWW\shop\application/admin/view\public\header.html";i:1521987856;s:53:"D:\WWW\shop\application/admin/view\public\footer.html";i:1521785805;}*/ ?>
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
				<input type="text" name="keyword" autocomplete="off" placeholder="输入角色名称关键词，如果为空查询全部" class="layui-input layui-btn-sm">
			</div>
			<button type="submit" lay-submit lay-filter="searchForm" class="layui-btn layui-btn-warm"><i class="fa fa-search"></i> 搜索</button>
			<button class="layui-btn" id="addBtn"><i class="fa fa-plus"></i> 新增角色</button>
		</div>
	</form>
</fieldset>
<div class="hr-line-dashed"></div>
<table id="datatable" lay-filter="datatable"></table>
<script type="text/html" id="toobar">
	<a class="layui-btn layui-btn-xs" lay-event="detail"><i class="fa fa-hand-o-right"></i> 权限分配</a>
	<a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="edit"><i class="fa fa-edit"></i> 编辑</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="fa fa-trash-o"></i> 删除</a>
</script>
<script type="text/javascript">
	layui.use(['table', 'form', 'layer', 'jquery'], function () {
		var table = layui.table, form = layui.form, layer = layui.layer, $ = layui.jquery;
		var datatable = table.render({
			elem: '#datatable',
			height: 'full-120',
			limit: "<?php echo htmlentities($page_size); ?>",
			url: "<?php echo url('role/index'); ?>?t=" + new Date().getTime(),
			page: true,
			cols: [[
				{field: 'id', title: 'ID', align: 'center', width: 80},
				{field: 'title', title: '角色名称', align: 'center', width: 200},
				{
					field: 'status', title: '状态', align: 'center', width: 80, templet: function (v) {
						if (v.status == 1) {
							return '<a class="layui-btn layui-btn-xs changeStatus" href="<?php echo url('role/change_status'); ?>?id="' + v.id + '.html status="' + v.status + '">已开启</a>';
						} else {
							return '<a class="layui-btn layui-btn-danger layui-btn-xs changeStatus" href="<?php echo url('role/change_status'); ?>?id="' + v.id + '.html status="\' + v.status + \'">>已禁用</a>\n';
						}
					}
				},
				{field: 'create_time', title: '创建时间', align: 'center', width: 200},
				{field: 'update_time', title: '更新时间', align: 'center', width: 200},
				{fixed: 'right', title: '操作', align: 'center', toolbar: '#toobar'}
			]]
		});
		// 添加菜单事件
		var addBox = $('#addBtn').on('click', function () {
			layer.open({
				type: 1,
				title: '新增角色',
				area: '520px',
				scrollbar: false,
				anim: 2,
				shadeClose: true,
				content: $('#addHtml').html()
			});
			form.render(null, 'addForm');
			return false;
		});

		//监听搜索提交
		form.on('submit(searchForm)', function (data) {
			var keyword = encodeURI($('input[name=keyword]').val());
			datatable.reload({where: {keyword: keyword, page: 1}});
			return false;
		});

		//监听新增角色提交
		form.on('submit(addForm)', function (data) {
			$.post("<?php echo url('role/create'); ?>?t=" + new Date().getTime(), data.field, function (data) {
				layer.closeAll();
				if (data.code == 1) {
					layer.msg('角色添加成功', {icon: 1, time: 1500, offset: '0'}, function (index) {
						datatable.reload();
					});
				} else {
					layer.msg(data.msg, {offset: '0', icon: 2});
				}
			}, 'json');
			return false;
		});
	});
</script>
<script type="text/x-template" id="addHtml">
	<div style="width:500px;padding:20px 5px">
		<form class="layui-form" lay-filter="addForm" id="addForm">
			<div class="layui-form-item">
				<label class="layui-form-label">角色名称</label>
				<div class="layui-input-inline">
					<input type="text" name="title" lay-verify="required" placeholder="请输入角色名称" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">状态</label>
				<div class="layui-input-inline">
					<input type="checkbox" name="status" value="1" lay-skin="switch" lay-text="开启|禁用" checked>
				</div>
				<div class="layui-form-mid layui-word-aux">默认开启</div>
			</div>
			<div class="hr-line-dashed2"></div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="addForm">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form>
	</div>
</script>
</div>
</div>
</body>
</html>