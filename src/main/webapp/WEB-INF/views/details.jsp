<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("WEB_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品详情</title>
<link href="${WEB_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${WEB_PATH }/static/js/jquery-3.4.1.min.js"></script>

</head>
<body>
	<!--导航-->
	<nav class="navbar navbar-default navbar-inverse navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">衣柜</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#">商城<span class="sr-only">(current)</span></a></li>
					<li><a href="${WEB_PATH}/carts/intoCarts">购物车</a></li>
					<li class="active"><a href="#">商品详情</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">用户设置 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">更改头像</a></li>
							<li><a href="#">更该用户信息</a></li>
							<li><a href="#">查看收货地址</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
   <div class="container" style="margin-top:50px;">
			<div class="col-lg-6">
				<img src="/photo/${img.imgUrl}" style="width: 450Px; height:600px;" class="img-rounded" />
			</div>
			<div class="col-lg-6">
				<div class="row" style="width:500px;height: 550px;">
					<div style="height:100px;">
						<h2>${com.comName}</h2>
						<input type="hidden" value="${com.comCode}" id="comCode"/>
					</div>
					<div style="height:200px;">
						<div style="height:60px;">
							<h1 id="unitPrice" jiage="${com.unitPrice}">当前售价：${com.unitPrice}<span class="glyphicon glyphicon-usd"></span></h1>
						</div>
					</div>
					<div style="height:100px;">

						<button class="btn btn-primary" type="button">
							当前库存：<span class="badge">${com.stock}</span>
						</button>
					</div>
					<div style="height:250px;">
						<div class="panel panel-warning">
							<div class="panel-body">
								商品详情
							</div>
							<div class="panel-footer">
								<h3>${com.comDescr}</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<button class="btn btn-success btn-block" id="joinCarts">加入购物车</button>
				</div>
			</div>
		</div>
		
	
	<script type="text/javascript"
		src="${WEB_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript">
       $("#joinCarts").click(function(){
    	   var comCode = $("#comCode").val();
    	   var unitPrice = $("#unitPrice").attr("jiage");
    	   alert(unitPrice);
    	   $.ajax({
    		   url:"${WEB_PATH }/carts/join?comCode="+comCode+"&unitPrice="+unitPrice,
    		   type:"POST",
    		   success:function(){
    			   alert("添加购物车成功！");
    		   }
    	   });
       });
	</script>
</body>
</html>