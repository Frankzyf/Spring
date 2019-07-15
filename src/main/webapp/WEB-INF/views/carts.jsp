<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("WEB_PATH", request.getContextPath());
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>购物车</title>
<link rel="stylesheet" href="${WEB_PATH }/static/css/reset.css">
<link rel="stylesheet" href="${WEB_PATH }/static/css/carts.css">
<link
	href="${WEB_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
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
					<li><a href="${WEB_PATH }/">商城<span class="sr-only">(current)</span></a></li>
					<li class="active"><a href="${WEB_PATH}/carts/intoCarts">购物车</a></li>
					<li class="dropdown" id="dropdown-nav"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">四季好货 <span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#chun">春装</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#xia">夏装</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#qiu">秋装</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#dong">冬装</a></li>
						</ul></li>
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

	<section class="cartMain" style="margin-top: 50px;">
		<div class="cartMain_hd">
			<ul class="order_lists cartTop">
				<li class="list_chk">
					<!--所有商品全选--> <input type="checkbox" id="all" class="whole_check">
					<label for="all"></label> 全选
				</li>
				<li class="list_con">商品信息</li>
				<li class="list_info">商品参数</li>
				<li class="list_price">单价</li>
				<li class="list_amount">数量</li>
				<li class="list_sum">金额</li>
				<li class="list_op">操作</li>
			</ul>
		</div>

		<div class="cartBox">
			<div class="order_content" id="carts_coms">
				
			</div>
		</div>
		<!--底部-->
		<div class="bar-wrapper">
			<div class="bar-right">
				<div class="piece">
					已选商品<strong class="piece_num">0</strong>件
				</div>
				<div class="totalMoney">
					共计: <strong class="total_text">0.00</strong>
				</div>
				<div class="calBtn">
					<a href="javascript:;" id="com_order">结算</a>
				</div>
			</div>
		</div>
	</section>
	<section class="model_bg"></section>
	<section class="my_model">
		<p class="title">
			删除宝贝<span class="closeModel">X</span>
		</p>
		<p>您确认要删除该宝贝吗？</p>
		<div class="opBtn">
			<a href="javascript:;" class="dialog-sure">确定</a><a
				href="javascript:;" class="dialog-close">关闭</a>
		</div>
	</section>

	<script src="${WEB_PATH }/static/js/jquery-3.4.1.min.js"></script>
	<script src="${WEB_PATH }/static/js/carts.js"></script>
	<script type="text/javascript"
		src="${WEB_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$.ajax({
				url : "${WEB_PATH }/carts/into",
				type : "GET",
				success : function(result) {
					var list = "";
					$.each(
						result.extend.carts,
						function(i, carts) {
							var imgUrl = result.extend.img[i].imgUrl;
							var k = i + 1;

							list += '<ul class="order_lists">';
							list += '<li class="list_chk"><input type="checkbox" name="ck" value="'+carts.comCode+'" id="checkbox_'+k+'" class="son_check"> <label for="checkbox_'+k+'"></label></li>';
							list += '<li class="list_con">';
							list += '<div class="list_img"><a href="javascript:;"><img src="'+imgUrl+'"></a></div>';
							list += '<div class="list_text"><a href="javascript:;">'
							+ carts.comName
							+ '</a></div>';
							list += '</li><li class="list_info"><p>规格：默认</p><p>尺寸：16*16*3(cm)</p></li>';
							list += '<li class="list_price"><p class="price">￥'
									+ carts.totalPrice
									+ '</p></li>';
									list += '<li class="list_amount"><div class="amount_box"><a href="javascript:;" onclick="upperComReduce(this)" class="reduce reSty">-</a><input type="text" value="'+carts.comNum+'" id="'+carts.comCode+'" class="sum">';
									list += '<a href="javascript:;" onclick="upperComSum(this)" class="plus">+</a></div>';
									list += '<li class="list_sum"><p class="sum_price">￥'
									+ carts.totalPrice
									+ '</p></li>';
									list += '<li class="list_op"><p class="del"><a href="javascript:;" class="delBtn">移除商品</a></p></li>';
									list += '</ul>';
								})
					$("#carts_coms").html(list);
					aa();
				}
			});
		});
		
		//获得更改数量
		function upperComSum(x){
			var num1 = $(x).prev().val();
			var id1 = $(x).prev().attr("id"); 
			var bbb = Number(num1)+1;
			
			$.ajax({
				url:"${WEB_PATH }/carts/upcarts",
				data:{comNum:bbb,comCode:id1},
				dataType:"json",
				type:"POST",
				success:function(result){
					alert(result.msg)
				}
			});
		}
		
		
		function upperComReduce(x){
			var num2 = $(x).next().val();
			var id2 = $(x).next().attr("id"); 
			num2 = Number(num2)-1;
			if(num2==0){
				num2=1;
			}
			
			$.ajax({
				url:"${WEB_PATH }/carts/upcarts",
				data:{
					comNum:num2,
					comCode:id2
				},
				dataType:"json",
				type:"POST",
				success:function(result){
					alert(result.msg)
				}
			});
		}
		
		//选中列表商品code
		$("#com_order").click(function(){
			var comCode = "";
			
			if($(".piece_num").html()==0){
				alert("请选择要下单商品！");
			}else{
				$("input[name='ck']:checked").each(function(index,item){
				    comCode += $(item).val()+","
				});
				comCode = comCode.substring(0,comCode.length-1);
				alert(comCode);
		        window.location.href = "${WEB_PATH }/carts/order/"+comCode;
			
			}	 
		});
		
	</script>

</body>
</html>
