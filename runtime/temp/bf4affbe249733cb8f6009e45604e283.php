<?php /*a:3:{s:50:"D:\WWW\shop\application/admin/view\menu\index.html";i:1522070830;s:53:"D:\WWW\shop\application/admin/view\public\header.html";i:1521987856;s:53:"D:\WWW\shop\application/admin/view\public\footer.html";i:1521785805;}*/ ?>
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
		<button class="layui-btn" id="addBtn"><i class="fa fa-plus"></i> 新增菜单</button>
	</div>
</fieldset>
<div class="hr-line-dashed"></div>
<table class="layui-table">
	<colgroup>
		<col width="50">
		<col width="200">
		<col width="180">
		<col width="80">
		<col width="180">
		<col width="180">
		<col width="80">
		<col width="180">
	</colgroup>
	<thead>
	<tr>
		<th>ID</th>
		<th>菜单名称</th>
		<th>节点URL</th>
		<th>状态</th>
		<th>创建时间</th>
		<th>修改时间</th>
		<th>排序</th>
		<th>操作</th>
	</tr>
	</thead>
	<tbody>
	<?php if(is_array($menuTree) || $menuTree instanceof \think\Collection || $menuTree instanceof \think\Paginator): if( count($menuTree)==0 ) : echo "" ;else: foreach($menuTree as $key=>$v): ?>
	<tr>
		<td><?php echo htmlentities($v['id']); ?></td>
		<td><?php echo space($v['level']); ?><?php echo htmlentities($v['lefthtml']); ?><?php echo htmlentities($v['title']); ?></td>
		<td><?php echo htmlentities($v['name']); ?></td>
		<td>
			<?php if($v['status'] == 1): ?>
			<a class="layui-btn layui-btn-xs changeStatus" href="<?php echo url('menu/change_status',['id'=>$v['id']]); ?>" status="<?php echo htmlentities($v['status']); ?>">已开启</a>
			<?php else: ?>
			<a class="layui-btn layui-btn-danger layui-btn-xs changeStatus" href="<?php echo url('menu/change_status',['id'=>$v['id']]); ?>" status="<?php echo htmlentities($v['status']); ?>">>已关闭</a>
			<?php endif; ?>
		</td>
		<td><?php echo htmlentities(date('Y-m-d H:i:s',!is_numeric($v['create_time'])? strtotime($v['create_time']) : $v['create_time'])); ?></td>
		<td><?php echo htmlentities(date('Y-m-d H:i:s',!is_numeric($v['update_time'])? strtotime($v['update_time']) : $v['update_time'])); ?></td>
		<td style="padding: 3px">
			<div>
				<input type="text" name="sort" value="<?php echo htmlentities($v['sort']); ?>" placeholder="排序值" autocomplete="off" class="layui-input" style="text-align:center">
			</div>
		</td>
		<td>
			<a href="<?php echo url('menu/edit',['id'=>$v['id']]); ?>" class="layui-btn layui-btn-xs editMenu"><i class="fa fa-edit"></i>编辑</a>&nbsp;&nbsp;
			<a href="<?php echo url('menu/del',['id'=>$v['id']]); ?>" class="layui-btn layui-btn-danger layui-btn-xs deleteMenu"><i class="fa fa-trash-o"></i>删除</a>
		</td>
	</tr>
	<?php endforeach; endif; else: echo "" ;endif; ?>
	</tbody>
</table>
<script type="text/javascript">
	layui.use(['form', 'layer', 'jquery'], function () {
		var form = layui.form, layer = layui.layer, $ = layui.jquery;
		$(function () {
			$('.changeStatus').on('click', function () {
				var _this = $(this), url = _this.attr('href'), status = _this.attr('status'), tip = '';
				if (parseInt(status) == 1) {
					tip = '您确定要禁用该菜单吗？<br />提示：如果有启用的子菜单则无法禁用父菜单';
				} else {
					tip = '您确定要开启该菜单吗？';
				}
				layer.confirm(tip, {title: '修改菜单状态', icon: 0, btn: ['确定', '取消']}, function () {
					$.post(url + '?t=' + new Date().getTime(), function (data) {

					}, 'json');
				}, function () {
				});
				return false;
			});
		});
		// 添加菜单事件
		$('#addBtn').on('click', function () {
			$.post("<?php echo url('menu/index',['floor'=>2]); ?>", function (data) {
				if (data.code == 1) {
					var menus = data.data, options = '';
					menus.forEach(function (item) {
						options += '<option value="' + item.id + '-' + item.level + '">' + item.lefthtml + item.title + '</option>'
					});
					layer.open({
						type: 1,
						title: '新增菜单',
						area: '600px',
						scrollbar: false,
						anim: 2,
						shadeClose: true,
						content: $('#addHtml').html()
					});
					$('#parentSelect').append(options);
					//更新 lay-filter="addForm" 所在容器内的全部表单状态
					form.render(null, 'addForm');
				} else {
					layer.msg(data.msg, {offset: '10px'});
				}
			}, 'json');
		});
		// 编辑菜单
		$('.editMenu').on('click', function () {
			var _this = $(this), url = _this.attr('href');
			layer.open({
				type: 2,
				title: '编辑菜单(提示：编辑成功后需重新登录左侧菜单才生效)',
				area: ['600px', '450px'],
				anim: 2,
				shadeClose: true,
				content: [url, 'no']
			});
			return false;
		});
		// 删除菜单
		$('.deleteMenu').on('click', function () {
			var _this = $(this), url = _this.attr('href');
			layer.confirm('确定要删除此菜单吗？有子菜单的不允许删除<br>(提示：删除成功后需重新登录左侧菜单才生效)', {title: '菜单删除', icon: 0, btn: ['确定', '取消']}, function () {
				$.post(url + '?t=' + new Date().getTime(), function (data) {
					if (data.code == 1) {
						layer.msg('删除成功', {icon: 1, time: 1000, offset: 't'}, function (index) {
							window.location.reload(true);
						});
					} else {
						layer.msg(data.msg, {offset: 't', icon: 2});
					}
				}, 'json');
			}, function () {
			});
			return false;
		});
		//监听提交
		form.on('submit(addForm)', function (data) {
			$.post("<?php echo url('menu/add_rule'); ?>", data.field, function (result) {
				if (result.code == 1) {
					layer.msg('菜单添加成功', {icon: 1, time: 1000, offset: '0'}, function (index) {
						window.location.reload(true);
					});
				} else {
					layer.msg(result.msg, {offset: '10px'});
				}
			}, 'json');
			return false;
		});
	});
</script>
<script type="text/x-template" id="addHtml">
	<div style="width:580px;padding:20px 5px">
		<form class="layui-form" lay-filter="addForm" id="addForm">
			<div class="layui-form-item">
				<label class="layui-form-label">所属父级</label>
				<div class="layui-input-inline">
					<select name="pid" lay-verify="required" id="parentSelect">
						<!--此处的value值为pid-level，后台需要对level+1-->
						<option value="0-0">==顶级菜单==</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">菜单名称</label>
				<div class="layui-input-inline">
					<input type="text" name="title" required lay-verify="required" placeholder="请输入菜单名称" autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">如：用户管理</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">节点URL</label>
				<div class="layui-input-inline">
					<input type="text" name="name" required lay-verify="required" placeholder="模块/控制器/方法，顶级菜单填写#" autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">如：admin/user/adduser</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">CSS图标</label>
				<div class="layui-input-inline">
					<input type="text" name="css" required lay-verify="required" placeholder="请输入菜单名称前显示的CSS图标" autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">如：如fa fa-user，<a href="http://fontawesome.dashgame.com/" target="_blank">选择图标</a></div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">排序</label>
				<div class="layui-input-inline">
					<input type="text" name="sort" value="1000" required lay-verify="required" placeholder="请输入排序值" autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">如：数值越小越优先显示</div>
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