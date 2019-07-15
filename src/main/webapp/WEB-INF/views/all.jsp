<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${PATH}/static/layui/css/layui.css" />

<meta charset="UTF-8">
<title>后台管理系统</title>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">后台管理系统</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="">控制台</a></li>
				<li class="layui-nav-item"><a href="">用户</a></li>
				<li class="layui-nav-item"><a href="javascript:;">其它系统</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">邮件管理</a>
						</dd>
						<dd>
							<a href="">消息管理</a>
						</dd>
						<dd>
							<a href="">授权管理</a>
						</dd>
					</dl></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img"> 贤心
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">基本资料</a>
						</dd>
						<dd>
							<a href="">安全设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="${PATH}/login">退了</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->

				<ul class="layui-nav layui-nav-tree" lay-filter="test">
				   <li class="layui-nav-item layui-nav-itemed"><a class=""
							href="javascript:;">后台管理</a>
					 <dl class="layui-nav-child">
						<dd>
							<a onclick="getUrl(this)" dizhi="http://localhost:8080/b2c/manage" id="bbb">商品管理</a>
						</dd>
						<dd>
							<a onclick="getUrl(this)" dizhi="http://localhost:8080/b2c/orderM" id="bbb">订单管理</a>
						</dd>
					 </dl>
					</li>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<div style="padding: 5px; height: 100%">
				<!-- 内容主体区域 -->
				<iframe id="pannel" src="" width="100%"
					height="100%" frameborder="0"></iframe>
			</div>
		</div>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			© layui.com - 欢迎使用！
		</div>
	</div>

	<script src="${PATH}/static/layui/layui.js" type="text/javascript"></script>
	<script type="text/javascript"
		src="${PATH}/static/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		layui.use('element', function() {
			var $ = layui.jquery, element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块  
		});
	</script>
	<script type="text/javascript">
      function getUrl(url){
          var u = $(url).attr("dizhi");
          $("#pannel").attr("src",u);
          }
	</script>
</body>
</html>