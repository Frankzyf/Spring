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
<title>订单详情</title>
<link href="${WEB_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${WEB_PATH }/static/js/jquery-3.4.1.min.js"></script>
<style>
img {
	width: 90px;
	height: 120px;
}

.com_tr {
	height: 100px;
}

.com_td {
	padding: 40px 40px 40px 0;
}
</style>
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
					<li class="active"><a href="#">订单</a></li>
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

	<div style="margin-top: 50px;margin-bottom:70px" class="container">
		<div class="container-fluid">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>图片</th>
						<th>商品信息</th>
						<th>商品数量</th>
						<th>商品总价</th>
					</tr>
				</thead>
				<tbody id="com_order_body">
				  <c:forEach items="${list}" var="coms" varStatus="s">
				     <tr class="com_tr">
						<td class="col-lg-3"><img src="/photo/${img[s.count-1]}"
							class="img-rounded"></td>
						<td class="col-lg-3">${coms.comName}</td>
						<td class="col-lg-3">${coms.comNum}</td>
						<td class="col-lg-3">${coms.totalPrice*coms.comNum}</td>
						<td><input type="hidden" value="${coms.comCode}"/></td>
					</tr>
				  </c:forEach>
				</tbody>
			</table>
		</div>
		<!--底部-->
		<nav class="navbar navbar-default navbar-fixed-bottom">
			<div class="container">
				<div class="com_bar">
					<!--地址-->
					<div class="col-lg-9">
						<form action="" method="post" class="form-inline">
							<span class="glyphicon glyphicon-home">地址：</span>
							<div class="form-group">
								<label for="exampleInputName2">省：</label> <select id="select1">
									<option>山东</option>
									<option>山东</option>
									<option>山东</option>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleInputName2">市：</label> <select id="select2">
									<option>山东</option>
									<option>山东</option>
									<option>山东</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleInputName2">区：</label> <select id="select3">
									<option>山东</option>
									<option>山东</option>
									<option>山东</option>
								</select>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="exampleInputName2"
									placeholder="详细地址">
							</div>
						</form>
					</div>
					<!--商品-->
					<div class="com_button col-lg-2">
						<div class="">
							商品数量：<span id="order_num"></span>
						</div>
						<div class="">
							商品价格：<span id="order_price"></span>
						</div>
						<div class="">
							<button class="btn btn-success btn-block" id="plase_an_order">确认下单</button>
						</div>
					</div>
				</div>

			</div>
		</nav>
	</div>
	
	<script type="text/javascript"
		src="${WEB_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	var comCode="";
       $(function(){
    	   var total_num = 0;
    	   var total_money=0;
    	   $("#com_order_body").find("tr").each(function(){
    		   var td2 = $(this).find("td:eq(2)").html();
    		   total_num = parseInt(total_num)+parseInt(td2);
    		   var td3 = $(this).find("td:eq(3)").html();
    		   total_money = parseInt(total_money)+parseInt(td3);
    		   var com = $(this).children().eq(4).find("input").val()
    		   comCode+=com+",";
    	   });
    	  $("#order_num").html(total_num+"件");
    	  $("#order_price").html(total_money+".0元")
       });
       
       
       //确认订单
       $("#plase_an_order").click(function(){
    	   comCode = comCode.substring(0,comCode.length-1);
    	   $.ajax({
    		   url:"${WEB_PATH }/carts/insertOrder/"+comCode,
    		   type:"POST",
    		   success:function(){
    			   alert("下单成功！");
    			   window.location.href = "${WEB_PATH }/carts/orderInfo2";
    		   }
    	   });
       });
       
	</script>
</body>
</html>