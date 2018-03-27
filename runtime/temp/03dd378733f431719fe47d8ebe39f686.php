<?php /*a:1:{s:51:"D:\WWW\shop\application/admin/view\index\index.html";i:1522112100;}*/ ?>
<!-- 头部公共文件 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title><?php echo htmlentities($site); ?>后台管理</title>
	<link type="text/css" rel="stylesheet" href="/static/admin/layui/css/layui.css" media="all"/>
	<link type="text/css" rel="stylesheet" href="/static/admin/css/app.css" media="all"/>
	<link type="text/css" rel="stylesheet" href="/static/admin/css/themes/orange.css" media="all" id="skin" kit-skin/>
	<link type="text/css" rel="stylesheet" href="/static/admin/css/admin.css"/>
	<link type="text/css" rel="stylesheet" href="/static/admin/css/font-awesome.min.css" media="all"/>
	<link type="text/css" rel="stylesheet" href="/static/admin/css/style.css" media="all"/>
</head>
<body class="kit-theme">
<div class="layui-layout layui-layout-admin kit-layout-admin">
	<div class="layui-header">
		<div class="layui-logo" id="logo"><span><?php echo htmlentities($site); ?>后台管理</span></div>
		<ul class="layui-nav layui-layout-left kit-nav kit-tab-tool-body">
			<li class="layui-nav-item"><a id="kit-side-fold" title="左侧菜单" style="color:#333;"><i class="fa fa-arrow-left" aria-hidden="true"></i></a></li>
			<li class="layui-nav-item"><a href="<?php echo url('index/index'); ?>" target="_block" title="主页" style="color:#333;"><i class="fa fa-life-ring" aria-hidden="true"></i></a></li>
			<li class="layui-nav-item"><a id="clear" title="清空缓存" style="color:#333;"><i class="fa fa-university" aria-hidden="true"></i></a></li>
			<li class="layui-nav-item"><a class="kit-item" data-target="refresh" title="刷新当前页" style="color:#333;" id="refresh"><i class="fa fa-refresh" aria-hidden="true"></i></a></li>
		</ul>
		<ul class="layui-nav layui-layout-right kit-nav">
			<li class="layui-nav-item" style="background-color: transparent !important;">
				<a href="javascript:;" id="color" style="color:#333;" class="refresh">皮肤<span class="layui-badge-dot"></span></a>
			</li>
			<li class="layui-nav-item">
				<a href="javascript:;" style="color:#333;">
					<img src="/static/admin/images/face.jpg" class="layui-nav-img">欢迎, <?php echo htmlentities(app('session')->get('auth.real_name')); ?> </a>
			</li>
			<li class="layui-nav-item"><a href="<?php echo url('login/changepwd'); ?>" id="changepwd" style="color:#333;"><span><i class="fa fa-expeditedssl" aria-hidden="true"></i> 修改密码</span></a></li>
			<li class="layui-nav-item"><a href="javascript:void(0);" id="logout" style="color:#333;"><span><i class="fa fa-sign-out" aria-hidden="true"></i> 退出</span></a></li>
		</ul>
	</div>
	<!-- 左侧公共菜单文件 -->
	<div class="layui-side layui-bg-black kit-side">
		<div class="layui-side-scroll">
			<ul class="layui-nav layui-nav-tree" lay-filter="kitNavbar" kit-navbar>
				<?php if(!empty($menus)): if(is_array($menus) || $menus instanceof \think\Collection || $menus instanceof \think\Paginator): $i = 0; $__LIST__ = $menus;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$first): $mod = ($i % 2 );++$i;?>
				<li class="layui-nav-item">
					<a href="javascript:;"><i class="<?php echo htmlentities($first['css']); ?>" aria-hidden="true"></i><span class="menuTitle"><?php echo htmlentities($first['title']); ?></span></a>
					<ul class="menu_ul layui-nav-child">
						<?php if(!empty($first['child'])): if(is_array($first['child']) || $first['child'] instanceof \think\Collection || $first['child'] instanceof \think\Paginator): $i = 0; $__LIST__ = $first['child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$second): $mod = ($i % 2 );++$i;?>
						<li>
							<a href="javascript:void(0)" data-url="<?php echo htmlentities(url($second['name'])); ?>" data-icon="fa-bullseye" data-title="<?php echo htmlentities($second['title']); ?>" kit-target data-id='<?php echo htmlentities($second['id']); ?>'>
								<i class="fa fa-caret-right"></i><span class="menuTitle"><?php echo htmlentities($second['title']); ?></span>
							</a>
						</li>
						<?php endforeach; endif; else: echo "" ;endif; endif; ?>
					</ul>
				</li>
				<?php endforeach; endif; else: echo "" ;endif; endif; ?>
			</ul>
		</div>
	</div>
	<div class="layui-body" id="container" style="padding:0 2px;">
		<!-- 内容主体区域 -->
		<div style="padding: 15px;"><i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop">&#xe63e;</i> 正在拼命加载...</div>
	</div>
</div>
<script type="text/javascript" src="/static/admin/layui/layui.js"></script>
<script type="text/javascript" src="/static/admin/js/jquery.min.js"></script>
<script type="text/javascript">
	var message;
	layui.config({
		base: '/static/admin/js/',
		version: '1.0.1'
	}).use(['app', 'message'], function () {
		var app = layui.app,
			$ = layui.jquery,
			layer = layui.layer;
		//将message设置为全局以便子页面调用
		message = layui.message;
		//主入口
		app.set({
			type: 'iframe'
		}).init();

		$('dl.skin > dd').on('click', function () {
			var $that = $(this);
			var skin = $that.children('a').data('skin');
			switchSkin(skin);
		});
		var setSkin = function (value) {
				layui.data('kit_skin', {
					key: 'skin',
					value: value
				});
			},
			getSkinName = function () {
				return layui.data('kit_skin').skin;
			},
			switchSkin = function (value) {
				var _target = $('link[kit-skin]')[0];
				_target.href = _target.href.substring(0, _target.href.lastIndexOf('/') + 1) + value + _target.href.substring(_target.href.lastIndexOf('.'));
				setSkin(value);
			},
			initSkin = function () {
				var skin = getSkinName();
				switchSkin(skin === undefined ? 'orange' : skin);
			}();

		$('#color').click(function () {
			layer.open({
				type: 1,
				title: '配色方案',
				area: ['290px', 'calc(100% - 52px)'],
				offset: 'rb',
				shadeClose: true,
				id: 'colors',
				anim: 2,
				shade: 0.2,
				closeBtn: 0,
				isOutAnim: false,
				resize: false,
				move: false,
				skin: 'color-class',
				btn: ['黑白格', '橘子橙', '原谅绿', '少女粉', '天空蓝', '枫叶红'],
				yes: function (index, layero) {
					switchSkin('default');
				}
				, btn2: function (index, layero) {
					switchSkin('orange');
					return false;
				}
				, btn3: function (index, layero) {
					switchSkin('green');
					return false;
				}
				, btn4: function (index, layero) {
					switchSkin('pink');
					return false;
				}
				, btn5: function (index, layero) {
					switchSkin('blue.1');
					return false;
				}
				, btn6: function (index, layero) {
					switchSkin('red');
					return false;
				}
			});
		});
		$('#changepwd').on('click', function () {
			var _this = $(this), url = _this.attr('href');
			layer.open({
				type: 2,
				title: '修改密码',
				area: ['500px', '350px'],
				shadeClose: true,
				content: [url, 'no']
			});
			return false;
		})
	});
</script>
<script type="text/javascript">
	layui.use('jquery', function () {
		var $ = layui.jquery;
		$('#clear').on('click', function () {
			var the = $(this).find('i');
			the.attr("class", "fa fa-spinner");
			$.post("<?php echo url('base/clear'); ?>?t=" + new Date().getTime(), function (data) {
				if (data.code == 1) {
					$('#clear i').attr("class", "fa fa-institution");
					layer.msg('缓存清空成功', {icon: 1, time: 3000, offset: 't'});
				} else {
					layer.msg(data.msg, {icon: 2, time: 3000, offset: 't'});
				}
			}, 'json');
		});
	});

	$('#logout').click(function () {
		layer.confirm('真的要退出?', {icon: 3, title: '提示', anim: 2}, function (index) {
			$.post("<?php echo url('login/loginout'); ?>", function (data) {
				if (data.code == 1) {
					window.location.href = "<?php echo url('login/index'); ?>";
				}
			}, 'json');
		})
	});

	$('.layui-nav-item').click(function () {
		$(this).siblings('li').attr('class', 'layui-nav-item');
	});
</script>
</body>
</html>