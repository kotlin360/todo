<?php /*a:1:{s:51:"D:\WWW\shop\application/admin/view\login\index.html";i:1522112100;}*/ ?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title><?php echo htmlentities($site); ?>后台登录</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link type="text/css" rel="stylesheet" href="/static/admin/layui/css/layui.css"/>
	<link type="text/css" rel="stylesheet" href="/static/admin/css/layuiAdmin.css"/>
	<link type="text/css" rel="stylesheet" href="/static/admin/css/login.css"/>
	<link type="text/css" rel="stylesheet" href="/static/admin/css/font-awesome.min.css"/>
</head>
<body class="layui-layout-body">
<div id="LAY_app">
	<div class="layadmin-user-login" id="LAY-user-login" style="display: none;">
		<div class="layadmin-user-login-main">
			<div class="layadmin-user-login-box layadmin-user-login-header">
				<h2><?php echo htmlentities($site); ?>后台管理</h2>
			</div>
			<div class="layadmin-user-login-box layadmin-user-login-body layui-form">
				<form class="layui-form" id="login">
					<div class="layui-form-item">
						<label class="layadmin-user-login-icon layui-icon layui-icon-username" for="username"><i class="fa fa-user"></i></label>
						<input type="text" name="username" lay-verify="required" autocomplete="off" placeholder="用户名" class="layui-input" id="username">
					</div>
					<div class="layui-form-item">
						<label class="layadmin-user-login-icon layui-icon layui-icon-password" for="password"><i class="fa fa-unlock-alt"></i></label>
						<input type="password" name="password" lay-verify="required" autocomplete="off" placeholder="密码" class="layui-input" id="password">
					</div>
					<div class="layui-form-item">
						<label class="layadmin-user-login-icon layui-icon layui-icon-password" for="code"><i class="fa fa-code"></i></label>
						<input type="text" name="code" lay-verify="required" autocomplete="off" placeholder="验证码" class="layui-input" style="width:58%;float: left" id="code">
						<img src="<?php echo url('login/make_verify'); ?>" id="captcha" alt="captcha" style="margin-top:1px;float:right"/>
					</div>
					<div class="layui-form-item">
						<input type="checkbox" lay-skin="primary" title="记住账号" name="remember" value="1">
						<div class="layui-unselect layui-form-checkbox noselect" unselectable="on" lay-skin="primary">
							<span>记住账号，一周有效</span><i class="layui-icon"></i>
						</div>
					</div>
					<div class="layui-form-item">
						<button class="layui-btn layui-btn-lg layui-btn-fluid" lay-submit lay-filter="login">登 录</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="/static/admin/layui/layui.js"></script>
<script type="text/javascript" src="/static/admin/js/jquery.min.js"></script>
<script type="text/javascript">
	var loginUrl = "<?php echo url('login/do_login'); ?>";

	// 验证码切换
	function changeCaptcha() {
		var _self = $('#captcha'), url = "<?php echo url('login/make_verify'); ?>";
		_self.attr('src', url + '?' + new Date().getTime());
	}

	layui.use(['layer', 'form'], function () {
		var layer = layui.layer,
			$ = layui.jquery,
			form = layui.form;
		$(function () {
			$('#captcha').on('click', function () {
				changeCaptcha();
			});
			form.on('submit(login)', function (data) {
				$.ajax({
					url: loginUrl + '?t=' + new Date().getTime(),
					data: $('#login').serialize(),
					type: 'post',
					async: false,
					success: function (data) {
						if (data.code == 1) {
							layer.msg('恭喜您，登录成功', {icon: 1, time: 1000, offset: 't'}, function (index) {
								window.location.href = data.url;
							});
						} else {
							layer.msg(data.msg, {offset: 't', icon: 2});
							$('#captcha').click();
						}
					}
				});
				return false;
			});
		});
	});
</script>
</body>
</html>