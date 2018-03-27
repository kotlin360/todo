<?php /*a:3:{s:49:"D:\WWW\shop\application/admin/view\menu\edit.html";i:1522050585;s:53:"D:\WWW\shop\application/admin/view\public\header.html";i:1521987856;s:53:"D:\WWW\shop\application/admin/view\public\footer.html";i:1521785805;}*/ ?>
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
<div style="width:580px;padding:20px 5px">
	<form class="layui-form" lay-filter="editForm" id="editForm">
		<div class="layui-form-item">
			<label class="layui-form-label">菜单名称</label>
			<div class="layui-input-inline">
				<input type="text" name="title" value="<?php echo htmlentities($menu['title']); ?>" required lay-verify="required" placeholder="请输入菜单名称" autocomplete="off" class="layui-input">
			</div>
			<div class="layui-form-mid layui-word-aux">如：用户管理</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">节点URL</label>
			<div class="layui-input-inline">
				<input type="text" name="name" value="<?php echo htmlentities($menu['name']); ?>" required lay-verify="required" placeholder="模块/控制器/方法，顶级菜单填写#" autocomplete="off" class="layui-input">
			</div>
			<div class="layui-form-mid layui-word-aux">如：admin/user/adduser</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">CSS图标</label>
			<div class="layui-input-inline">
				<input type="text" name="css" value="<?php echo htmlentities($menu['css']); ?>" required lay-verify="required" placeholder="请输入菜单名称前显示的CSS图标" autocomplete="off" class="layui-input">
			</div>
			<div class="layui-form-mid layui-word-aux">如：如fa fa-user，<a href="http://fontawesome.dashgame.com/" target="_blank">选择图标</a></div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">排序</label>
			<div class="layui-input-inline">
				<input type="text" name="sort" value="<?php echo htmlentities($menu['sort']); ?>" required lay-verify="required" placeholder="请输入排序值" autocomplete="off" class="layui-input">
			</div>
			<div class="layui-form-mid layui-word-aux">如：数值越小越优先显示</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">状态</label>
			<div class="layui-input-inline">
				<input type="checkbox" name="status" value="1" lay-skin="switch" lay-text="开启|禁用" <?php if($menu['status'] == '1'): ?>checked<?php endif; ?>>
			</div>
			<div class="layui-form-mid layui-word-aux">默认开启</div>
		</div>
		<div class="hr-line-dashed2"></div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<input type="hidden" name="id" value="<?php echo htmlentities($menu['id']); ?>"/>
				<button class="layui-btn" lay-submit lay-filter="editForm">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
	layui.use(['form', 'layer', 'jquery'], function () {
		var form = layui.form, layer = layui.layer, $ = layui.jquery;
		//监听提交
		form.on('submit(editForm)', function (data) {
			$.post("<?php echo url('menu/edit'); ?>", data.field, function (result) {
				if (result.code == 1) {
					layer.msg('菜单修改成功', {icon: 1, time: 1000, offset: 't'}, function (index) {
						window.parent.location.reload(); //刷新父页面
					});
				} else {
					layer.msg(result.msg, {offset: '10px', icon: 2});
				}
			}, 'json');
			return false;
		});
	});
</script>
</div>
</div>
</body>
</html>