<?php /*a:3:{s:55:"D:\WWW\shop\application/admin/view\login\changepwd.html";i:1522064502;s:53:"D:\WWW\shop\application/admin/view\public\header.html";i:1521987856;s:53:"D:\WWW\shop\application/admin/view\public\footer.html";i:1521785805;}*/ ?>
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
	<form class="layui-form" lay-filter="passwdForm" id="passwdForm">
		<div class="layui-form-item">
			<label class="layui-form-label">旧密码</label>
			<div class="layui-input-inline">
				<input type="password" name="passwd_old" required lay-verify="required" placeholder="请输入旧密码" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">新密码</label>
			<div class="layui-input-inline">
				<input type="password" name="passwd" id="passwd" required lay-verify="passwd" placeholder="新密码，至少6位且不能出现空格" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">确认新密码</label>
			<div class="layui-input-inline">
				<input type="password" name="repasswd" required lay-verify="repasswd" placeholder="确认新密码，至少6位且不能出现空格" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="hr-line-dashed2"></div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="passwdForm">立即修改</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
	layui.use(['form', 'layer', 'jquery'], function () {
		var form = layui.form, layer = layui.layer, $ = layui.jquery;
		form.verify({
			passwd: function (value, item) {
				if ($.trim(value).length < 6) {
					return '新密码长度不能小于6位';
				}
			},
			repasswd: function (value, item) {
				if ($.trim($('#passwd').val()) != value) {
					return '两次输入密码不一致，请重新输入';
				}
			}
		});
		//监听提交
		form.on('submit(passwdForm)', function (data) {
			$.post("<?php echo url('login/changepwd'); ?>?t=" + new Date().getTime(), data.field, function (result) {
				if (result.code == 1) {
					parent.layer.closeAll();
					parent.layer.msg('新密码修改成功,请牢记新密码', {icon: 1, time: 3000, offset: 't'});
				} else {
					parent.layer.msg(result.msg, {icon: 2, time: 5000, offset: 't'});
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