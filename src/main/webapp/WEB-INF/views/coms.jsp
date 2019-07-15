<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("WEB_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="${WEB_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${WEB_PATH }/static/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="${WEB_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<style type="text/css">
.damu-carousel {
	margin-top: 50px;
}
</style>
<title>Insert title here</title>
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
					<li class="active"><a href="#">商城<span class="sr-only">(current)</span></a></li>
					<li><a href="${WEB_PATH}/carts/intoCarts">购物车</a></li>
				</ul>
				<form class="navbar-form navbar-left" action="coms/comInfo"
					method="get">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search"
							name="searchName">
					</div>
					<button type="submit" class="btn btn-success">找找看</button>
				</form>
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
	<!-- 商品缩略图 -->
	<div class="damu-carousel">
	<c:forEach items="${PageInfo.list}" var="coms">
		<div class="col-sm-6 col-md-4">
			<div class="thumbnail">
				<img src="${coms.comImg.imgUrl}">
				<div class="caption">
					<span class="label label-primary">名称</span>${coms.comName }<br>
					<br> <span class="label label-success">售价</span>${coms.unitPrice }元<br>
					<br> <span class="label label-info">描述</span>
					<p>${coms.comDescr }</p>
					<p>
						<a onclick="addCar(this)" class="btn btn-primary" role="button" bh="${coms.comCode}" sj="${coms.unitPrice}" sm="${coms.comName }">添加到购物车</a> <a
							href="#" class="btn btn-success" role="button">立即购买</a>
					</p>
				</div>
			</div>
		</div>
	</c:forEach>
	</div>


	<!-- 分页信息 -->
	<div class="col-md-7">当前${PageInfo.pageNum }页,总${PageInfo.pages }页,总共
		${PageInfo.total }条记录</div>
	<!-- 分页表 -->
	<div class="col-md-5">
		<nav aria-label="Page navigation">
			<ul class="pagination">

				<li><a href="${WEB_PATH }/coms/comInfo?pn=1&searchName=${msg}">首页</a></li>

				<!-- 上一页判断 -->
				<c:if test="${PageInfo.hasPreviousPage }">
					<li><a
						href="${WEB_PATH }/coms/comInfo?pn=${PageInfo.pageNum-1}&searchName=${msg}"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>

				<c:forEach items="${PageInfo.navigatepageNums }" var="page_Num">
					<c:if test="${page_Num == PageInfo.pageNum}">
						<li class="active"><a href="#">${page_Num}</a></li>
					</c:if>
					<c:if test="${page_Num != PageInfo.pageNum}">
						<li><a
							href="${WEB_PATH }/coms/comInfo?pn=${page_Num}&searchName=${msg}">${page_Num}</a></li>
					</c:if>
				</c:forEach>
				<!-- 下一页判断 -->
				<c:if test="${PageInfo.hasNextPage}">
					<li><a
						href="${WEB_PATH }/coms/comInfo?pn=${PageInfo.pageNum+1}&searchName=${msg}"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
				<li><a
					href="${WEB_PATH }/coms/comInfo?pn=${PageInfo.pages}&searchName=${msg}">末页</a></li>
			</ul>
		</nav>
	</div>
<script type="text/javascript" src="${WEB_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">

function addCar(sss){
	var comCode = $(sss).attr("bh");
	var unitPrice = $(sss).attr("sj");
	var comName = $(sss).attr("sm")
	$.ajax({
		url:"${WEB_PATH }/carts/join",
		type:"POST",
		data:{
			comCode:comCode,
			unitPrice:unitPrice,
			comName:comName
		},
		success:function(){
			alert("添加成功");
		}
	});
}
</script>
</body>
</html>