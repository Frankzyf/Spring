<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("WEB_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 上面三条一定要在前面！ -->
		<title>男人的衣柜！</title>
		<!-- Bootstrap -->
		<link href="${WEB_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- 站点图标 -->
		<link rel="shortcut icon" href="static/img/图标1.jpg" type="image/x icon" />

		<style>
			/*图片*/
			/*img{ width:100%;}*/
			 /* 轮播图*/
			 .damu-carousel{
				 margin-top: 50px;
				 height:500px;
				 overflow: hidden;
			 }
			 
			/*缩略图图片*/
			 .damu-thumbnail img {
				 width: auto;
			 }
			 
			 /*三列布局*/
			 .daum-threeC{
				 margin-top: 50px;
			 }
			/*线*/
			 .daum-xian{
				 margin-top: 50px auto;
			 }
			 
		 </style>
	</head>
	<body>
		<!--导航-->
		<nav class="navbar navbar-default navbar-inverse navbar-fixed-top">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					 aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">衣柜</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="${WEB_PATH }/">商城<span class="sr-only">(current)</span></a></li>
						<li><a href="${WEB_PATH}/carts/intoCarts">购物车</a></li>
						<li class="dropdown" id="dropdown-nav">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">四季好货
								<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#chun">春装</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#xia">夏装</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#qiu">秋装</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#dong">冬装</a></li>
							</ul>
						</li>
						<li class="dropdown" id="dropdown-nav">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">商品分类
								<span class="caret"></span></a>
							<ul class="dropdown-menu multi-level" role="menu" aria-labelledby="dropdownMenu">
								<li class="dropdown-submenu">
								  <a href="javascript:;">男装</a>
								  <ul class="dropdown-menu">
								   <li class="divider"><a href="javascript:;">1</a></li>
								    <li class="divider"><a href="javascript:;">1</a></li>
								     <li class="divider"><a href="javascript:;">1</a></li>
								  </ul>
								</li>
								<li role="separator" class="divider"></li>
								<li><a href="#">女装</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">童装</a></li>
							</ul>
						</li>
					</ul>
					<form class="navbar-form navbar-left" action="${WEB_PATH }/coms/comInfo" method="get">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search" name="searchName">
						</div>
						<button type="submit" class="btn btn-success">找找看</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">用户设置
								<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">更改头像</a></li>
								<li><a href="#">更该用户信息</a></li>
								<li><a href="${WEB_PATH}/login">退出</a></li>
							</ul>
						</li>
					</ul>
				</div><!-- /.navbar-collapse -->
			</div><!-- /.container-fluid -->
		</nav>
		<!--   轮播图     -->
		<div id="carousel-example-generic" class="carousel slide damu-carousel" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				<li data-target="#carousel-example-generic" data-slide-to="3"></li>
				<li data-target="#carousel-example-generic" data-slide-to="4"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="/photo/衬衫男1.jpg">
					<div class="carousel-caption">
					</div>
				</div>
				<div class="item">
					<img src="/photo/衬衫男1.jpg">
					<div class="carousel-caption">
					</div>
				</div>
				<div class="item active">
					<img src="/photo/衬衫男1.jpg">
					<div class="carousel-caption">
					</div>
				</div>
				<div class="item active">
					<img src="/photo/衬衫男1.jpg">
					<div class="carousel-caption">
					</div>
				</div>
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>



		<!--三列容器-->
		<div class="container daum-threeC">
			<div class="row">
				<div class="col-md-4 damu-thumbnail text-center">
					<img src="/photo/衬衫男1.jpg" style="height: 450px; width: 300px;">
					<div class="caption">
						<h3>英伦风格男士衬衫</h3>
						<p>英伦风格男士衬衫</p>
						<p><a href="${WEB_PATH}/coms/details?comCode=A101" class="btn btn-default" role="button">商品详情</a></p>
					</div>
				</div>
				<div class="col-md-4 damu-thumbnail text-center">
					<img src="/photo/衬衫男1.jpg" style="height: 450px; width: 300px;">
					<div class="caption">
						<h3>高端大气女士T恤</h3>
						<p>高端大气女士T恤</p>
						<p><a href="${WEB_PATH}/coms/details?comCode=A102" class="btn btn-default" role="button">商品详情</a></p>
					</div>
				</div>
				<div class="col-md-4 damu-thumbnail text-center">
					<img src="/photo/衬衫男1.jpg" style="height: 450px; width: 300px;">
					<div class="caption">
						<h3>高端大气女士T恤</h3>
						<p>高端大气女士T恤</p>
						<p><a href="${WEB_PATH}/coms/details?comCode=A103" class="btn btn-default" role="button">商品详情</a></p>
					</div>
				</div>

				<div class="row">
					<div class="col-md-4 damu-thumbnail text-center">
						<img src="/photo/衬衫男1.jpg" style="height: 450px; width: 300px;">
						<div class="caption">
							<h3>英伦风格男士衬衫</h3>
							<p>英伦风格男士衬衫</p>
							<p><a href="${WEB_PATH}/coms/details?comCode=A104" class="btn btn-default" role="button">商品详情</a></p>
						</div>
					</div>
					<div class="col-md-4 damu-thumbnail text-center">
						<img src="/photo/衬衫男1.jpg" style="height: 450px; width: 300px;">
						<div class="caption">
							<h3>高端大气女士T恤</h3>
							<p>高端大气女士T恤</p>
							<p><a href="${WEB_PATH}/coms/details?comCode=A105" class="btn btn-default" role="button">商品详情</a></p>
						</div>
					</div>
					<div class="col-md-4 damu-thumbnail text-center">
						<img src="/photo/衬衫男1.jpg" style="height: 450px; width: 300px;">
						<div class="caption">
							<h3>高端大气女士T恤</h3>
							<p>高端大气女士T恤</p>
							<p><a href="${WEB_PATH}/coms/details?comCode=A106" class="btn btn-default" role="button">商品详情</a></p>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!--线-->
		<div class="container daum-xian">
			<hr />
		</div>

		<!--标签页-->
		<div class="container" id="damu-tab">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist" id="nav-list">
				<li role="presentation" class="active"><a href="#chun" aria-controls="home" role="tab" data-toggle="tab">春装</a></li>
				<li role="presentation"><a href="#xia" aria-controls="profile" role="tab" data-toggle="tab">夏装</a></li>
				<li role="presentation"><a href="#qiu" aria-controls="messages" role="tab" data-toggle="tab">秋装</a></li>
				<li role="presentation"><a href="#dong" aria-controls="settings" role="tab" data-toggle="tab">冬装</a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="chun">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-7 text-center">
								<h1>暖春三月</h1>
								<p>精美春装，欢迎赏鉴</p>
							</div>
							<div class="col-md-5">
								<img src="/photo/衬衫女1.jpg" style="width: 380px; height: 500px;" />
							</div>

						</div>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane" id="xia">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-7">
								<img src="/photo/衬衫男1.jpg" style="width: 380px; height: 500px;" />
							</div>
							<div class="col-md-5 text-center">
								<h1>流火七月</h1>
								<p>精美春装，欢迎赏鉴</p>
							</div>
						</div>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane" id="qiu">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-7 text-center">
								<h1>金秋十月</h1>
								<p>精美春装，欢迎赏鉴</p>
							</div>
							<div class="col-md-5">
								<img src="/photo/T恤女3.jpg" style="width: 380px; height: 500px;" />
							</div>

						</div>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane" id="dong">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-7">
								<img src="/photo/裤子女2.jpg" style="width: 380px; height: 500px;" />
							</div>
							<div class="col-md-5 text-center">
								<h1>飘雪冬日</h1>
								<p>精美春装，欢迎赏鉴</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 底部 -->
		<div class="container">
			<footer class="modal-footer col-lg-12">
				<span class="glyphicon glyphicon-user col-lg-2">版权人：张亚飞</span>
				<span class="glyphicon glyphicon-phone col-lg-6">17667939351</span>
			</footer>
		</div>

		<!--模态框-->

		<script type="text/javascript" src="${WEB_PATH }/static/js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="${WEB_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<script>
			$("#dropdown-nav li a").click(function() {
				var href = $(this).attr("href");
				$("#nav-list li a[href='" + (href) + "']").tab("show");
				$(document).scrollTop($("#damu-tab").offset().top);

			});
		</script>
	</body>
</html>
