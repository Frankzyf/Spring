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
<title>商品列表</title>


<script type="text/javascript"
	src="${WEB_PATH }/static/js/jquery-3.4.1.min.js"></script>
<link
	href="${WEB_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${WEB_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

	<!-- 图片管理模态框 -->
	<div class="modal fade" id="comsImgModel" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">图片管理</h4>
				</div>

				<div class="modal-body">
					<div>
						<form class="form-inline" enctype="multipart/form-data" action="${WEB_PATH }/img/upload" method="post">
						    <div class="form-group">
								<label >选择类型</label>
								 <select name="type">
								    <option value="页面展示">页面展示</option>
								    <option value="购物车">购物车</option>
								    <option value="其他">其他</option>
								 </select>
							</div>
						    
							<div class="form-group">
								 <input type="file" id="exampleInputFile" name="file">
							</div>
							<div class="form-group">
								 <input type="submit" class="btn btn-success">
							</div>
						</form>
					</div><hr>
					<div class="container" id="img_modal_body">
					
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 修改模态框 -->
	<div class="modal fade" id="comsUpdateModel" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">商品修改</h4>
				</div>
				<div class="modal-body">

					<form>
						<div class="form-group">
							<label for="comsInputCode">商品编号</label>
							<p class="form-control-static" id="comCode_update_static"></p>
						</div>
						<div class="form-group">
							<label for="comsInputName">商品名称</label> <input type="text"
								name=comName class="form-control" id="coms_update_name"
								placeholder="comsName">
						</div>
						<div class="form-group">
							<label for="comsInputName">单价</label>
							<div class="input-group">
								<span class="input-group-addon">元</span> <input type="text"
									name="unitPrice" class="form-control" id="unit_price_update"
									aria-describedby="inputGroupSuccess3Status">
							</div>
						</div>
						<div class="form-group">
							<label for="comsInputName">商品描述</label> <input type="text"
								name="comDescr" class="form-control" id="coms_update_desc">
						</div>
						<div class="form-group">
							<label for="comsInputName">商品库存</label> <input type="text"
								name="stock" class="form-control" id="coms_update_stock">
						</div>

						<div class="form-group">
							<label for="comsFile">状态</label> <select class="form-control"
								name="type" id="com_type_update">
								<option>上架</option>
								<option>下架</option>
								<option>缺货</option>
								<option>有货</option>
							</select>
						</div>
						<div class="form-group">
							<label for="comsFile">商品分类</label> <select class="form-control"
								name="goodsCode" id="goods_code_select_update">

							</select>
						</div>
						<!-- 
                        <div class="form-group">
							<label for="comsFile">商品图片</label> <input type="file"
								id="coms_file">
						</div>
                         -->

					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="coms_update_btn">保存</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 新增模态框 -->
	<div class="modal fade" id="comsAddModel" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">商品添加</h4>
				</div>
				<div class="modal-body">

					<form>
						<div class="form-group">
							<label for="comsInputCode">商品编号</label> <input type="text"
								name="comCode" class="form-control" id="coms_input_code"
								placeholder="comsCode">
						</div>
						<div class="form-group">
							<label for="comsInputName">商品名称</label> <input type="text"
								name=comName class="form-control" id="coms_input_name"
								placeholder="comsName">
						</div>
						<div class="form-group">
							<label for="comsInputName">单价</label>
							<div class="input-group">
								<span class="input-group-addon">元</span> <input type="text"
									name="unitPrice" class="form-control" id="unit_price"
									aria-describedby="inputGroupSuccess3Status">
							</div>
						</div>
						<div class="form-group">
							<label for="comsInputName">商品描述</label> <input type="text"
								name="comDescr" class="form-control" id="coms_input_name">
						</div>
						<div class="form-group">
							<label for="comsInputName">商品库存</label> <input type="text"
								name="stock" class="form-control" id="coms_input_name">
						</div>

						<div class="form-group">
							<label for="comsFile">状态</label> <select class="form-control"
								name="type">
								<option>上架</option>
								<option>下架</option>
								<option>缺货</option>
								<option>有货</option>
							</select>
						</div>
						<div class="form-group">
							<label for="comsFile">商品分类</label> <select class="form-control"
								name="goodsCode" id="goods_code_select">

							</select>
						</div>
						<!-- 
                        <div class="form-group">
							<label for="comsFile">商品图片</label> <input type="file"
								id="coms_file">
						</div>
                         -->

					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="coms_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 主体部分 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>商品管理系统</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="coms_add_model">新增</button>
				<button class="btn btn-danger" id="coms_del_all_btn">删除</button>
			</div>
		</div>
		<!-- 列表 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th>编号</th>
							<th>名称</th>
							<th>单价</th>
							<th>描述</th>
							<th>库存</th>
							<th>状态</th>
							<th>分类</th>
							<th>图片</th>
							<th>操作</th>
						</tr>
					</thead>

					<tbody id="coms_table">

					</tbody>
				</table>
			</div>

		</div>
		<!-- 分页 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-7" id="page_info_area"></div>
			<!-- 分页条信息 -->
			<div class="col-md-5" id="page_bar_area"></div>
		</div>
	</div>



	<script type="text/javascript">
		var currentPage;
		//-------------------------------分页-------------------------------------//
		//1.页面加载完成之后，直接去发送一个Ajax请求，要到分页数据
		$(function() {
			//去首页
			to_page(1);
		});

		function to_page(pn) {
			$.ajax({
				url : "${WEB_PATH}/coms/findAllComs",
				data : "pn=" + pn,
				type : "get",
				success : function(result) {
					//console.log(result);
					//1.解析并显示商品数据
					bulid_coms_table(result)
					//2.解析并显示分页信息
					build_page_info(result)
					//3.解析并显示分页条
					bulid_page_nav(result)
				}

			});
		}

		//1.解析并显示商品数据
		function bulid_coms_table(result) {
			//构建之前先清空table表格
			$("#coms_table").empty();
			var coms = result.extend.PageInfo.list;
			$
					.each(
							coms,
							function(index, item) {
								var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
								var comCodeTd = $("<td></td>").append(
										item.comCode);
								var comNameTd = $("<td></td>").append(
										item.comName);
								var unitPriceTd = $("<td></td>").append(
										item.unitPrice);
								var comDescrTd = $("<td></td>").append(
										item.comDescr);
								var stockTd = $("<td></td>").append(item.stock);
								var typeTd = $("<td></td>").append(item.type);
								var goodsCodeTd = $("<td></td>").append(
										item.goodsCode);

								var imgBtn = $("<button></button>").addClass(
										"btn btn-success edit_img_btn").append(
										$("<span></span>").addClass(
												"glyphicon glyphicon-picture"))
										.append("图片管理");
								//为按钮添加一个自定义属性，来表示商品ID
								imgBtn.attr("img_comCode", item.comCode);
								var editBtn = $("<button></button>")
										.addClass(
												"btn btn-primary btn-sm edit_btn")
										.append(
												$("<span></span>")
														.addClass(
																"glyphicon glyphicon-pencil "))
										.append("编辑");
								//为按钮添加一个自定义属性，来表示商品id
								editBtn.attr("edit_comCode", item.comCode);
								var delBtn = $("<button></button>")
										.addClass(
												"btn btn-danger btn-sm delete_btn")
										.append(
												$("<span></span>")
														.addClass(
																"glyphicon glyphicon-remove "))
										.append("删除");
								//为按钮添加一个自定义属性，来表示商品id
								delBtn.attr("del_comCode", item.comCode);
								var imgTd = $("<td></td>").append(imgBtn);
								var btnTd = $("<td></td>").append(editBtn)
										.append(" ").append(delBtn);
								//append方法执行之后会返回原来的元素
								$("<tr></tr>").append(checkBoxTd).append(
										comCodeTd).append(comNameTd).append(
										unitPriceTd).append(comDescrTd).append(
										stockTd).append(typeTd).append(
										goodsCodeTd).append(imgTd)
										.append(btnTd).appendTo("#coms_table");
							});
		}
		//2.解析并显示分页信息
		function build_page_info(result) {
			$("#page_info_area").empty();
			$("#page_info_area").append(
					"当前" + result.extend.PageInfo.pageNum + " 页,总 "
							+ result.extend.PageInfo.pages + "页,总共"
							+ result.extend.PageInfo.total + "条记录");
			currentPage = result.extend.PageInfo.pageNum;
		}

		//3.解析并显示分页条
		function bulid_page_nav(result) {
			$("#page_bar_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			//构建元素
			var firstPageLi = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;"));
			if (result.extend.PageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				//为元素绑定单机事件
				firstPageLi.click(function() {
					to_page(1);
				});
				prePageLi.click(function() {
					to_page(result.extend.PageInfo.pageNum - 1);
				});
			}

			//构建元素
			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append("&raquo;"));
			var listPageLi = $("<li></li>").append(
					$("<a></a>").append("末页").attr("href", "#"));
			if (result.extend.PageInfo.hasNextPage == false) {
				nextPageLi.addClass("disabled");
				listPageLi.addClass("disabled");
			} else {
				//为元素绑定单机事件
				nextPageLi.click(function() {
					to_page(result.extend.PageInfo.pageNum + 1);
				});
				listPageLi.click(function() {
					to_page(result.extend.PageInfo.pages);
				});
			}

			//添加首页和前一页
			ul.append(firstPageLi).append(prePageLi);
			//遍历向ul中添加页码提示
			$.each(result.extend.PageInfo.navigatepageNums, function(index,
					item) {
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.PageInfo.pageNum == item) {
					numLi.addClass("active");
				}

				//对页码绑定单机事件
				numLi.click(function() {
					to_page(item);
				});
				ul.append(numLi);
			});
			//添加末页和后一页
			ul.append(nextPageLi).append(listPageLi);

			var nav = $("<nav></nav>").append(ul);
			nav.appendTo("#page_bar_area");
		}

		//------------------新增模态框-----------------------------------------//
		//1.点击新增按钮弹出模态框
		$("#coms_add_model").click(function() {
			//(每次点击重置表单)
			$("#comsAddModel form")[0].reset();
			//发送Ajax请求，查出商品分类，将商品分类显示在下拉列表中	
			getGoodsCode("#goods_code_select");
			//弹出模态框
			$("#comsAddModel").modal({
				backdrop : "static"
			});
		});

		//1.1获得商品分类信息
		function getGoodsCode(ele) {
			//先清空之前下拉列表的值
			$(ele).empty();
			$.ajax({
				url : "${WEB_PATH}/coms/getGoodsCode",
				type : "GET",
				success : function(result) {
					//console.log(result);
					$.each(result.extend.goodsCode, function(index, item) {
						var option = $("<option></option>").append(
								item.code).attr("value", item.code);
						console.log(item.code);
						option.appendTo(ele);
					});
				}

			});
		}

		//保存员工信息

		//1.需要先校验商品编号是否重复，成功才可以保存，不成功不保存

		$("#coms_save_btn").click(function() {
			//1.判断之前ajax用户校验是否成功，如果成功
			if ($(this).attr("ajax-va") == "error") {
				return false;
			}
			//2.将模态框中填写的表单数据提交给服务器进行保存
			$.ajax({
				url : "${WEB_PATH}/coms/saveComsInfo",
				type : "POST",
				data : $("#comsAddModel form").serialize(),
				dataType : "json",
				success : function(result) {
					alert(result.msg);
					//1.关闭模态框
					$("#comsAddModel").modal("hide");
					//2.回到本页
					to_page(currentPage);
				}
			});
		});

		//给输入商品标号的输入框加入校验
		$("#coms_input_code").change(function() {
			var comCode = this.value;
			$.ajax({
				url : "${WEB_PATH}/coms/checkCode",
				data : "comCode=" + comCode,
				type : "POST",
				success : function(result) {
					if (result.code == 100) {
						$("#coms_save_btn").attr("ajax-va", "success");
						alert("可用");
					}
					if (result.code == 200) {
						$("#coms_save_btn").attr("ajax-va", "error");
						alert("不可用")
					}
				}
			});
		});

		//-------------------------------------修改模态框-----------------------------------------//

		//两种绑定方式，一种是在创建时绑定
		//第二种可以使用on进行绑定
		$(document).on("click", ".edit_btn", function() {
			//1.查出商品分类信息(复用新增框中的方法)
			getGoodsCode("#goods_code_select_update");
			//2.查出商品信息
			var comCode = $(this).attr("edit_comCode");
			getComImfo_update(comCode);
			//3.给更新按钮添加一个自定义属性
			$("#coms_update_btn").attr("edit_update", comCode);

			$("#comsUpdateModel").modal({
				backdrop : "static"
			});
		})
		//2.查出商品信息
		function getComImfo_update(comCode) {
			$.ajax({
				url : "${WEB_PATH}/coms/getComInfo/" + comCode,
				type : "GET",
				success : function(result) {
					var coms = result.extend.coms;
					$("#comCode_update_static").text(coms.comCode);
					$("#coms_update_name").val(coms.comName);
					$("#unit_price_update").val(coms.unitPrice);
					$("#coms_update_desc").val(coms.comDescr);
					$("#coms_update_stock").val(coms.stock);
					$("#com_type_update").val(coms.type);
					$("#goods_code_select_update").val(coms.goodsCode);
				}
			});
		}

		//点击按钮更新信息
		$("#coms_update_btn").click(
				function() {
					$.ajax({
						url : "${WEB_PATH}/coms/updateComInfo/"
								+ $(this).attr("edit_update"),
						type : "PUT",
						data : $("#comsUpdateModel form").serialize(),
						success : function(result) {
							//1.关闭对话框
							$("#comsUpdateModel").modal("hide");
							//2.回到本页面
							to_page(currentPage);
						}
					});
				});

		//-------------------------------删除-----------------------------------------//
		//单个删除
		$(document)
				.on(
						"click",
						".delete_btn",
						function() {
							//1.弹出是否确认删除对话框
							var comCode = $(this).parents("tr")
									.find("td:eq(1)").text();
							if (confirm("确认删除" + comCode + "吗？")) {
								//确人，发送ajax请求删除
								$.ajax({
									url : "${WEB_PATH}/coms/delete/"
											+ $(this).attr("del_comCode"),
									type : "DELETE",
									success : function(result) {
										alert(result.msg);
										//回到本页
										to_page(currentPage);
									}
								});
							}
						})
		//完成全选/全不选功能
		$("#check_all").click(function() {
			//attr获取checked时undifined;
			//我们这些原生的dom属性：attr获取自定义的属性值
			//prop修改和读取dom原生属性的值
			$(".check_item").prop("checked", $(this).prop("checked"));
		});

		$(document)
				.on(
						"click",
						".check_item",
						function() {
							var flag = $(".check_item:checked").length == $(".check_item").length;
							$("#check_all").prop("checked", flag);
						});

		//批量删除
		$("#coms_del_all_btn").click(
				function() {
					var comCodes = ""
					$.each($(".check_item:checked"), function() {
						comCodes += $(this).parents("tr").find("td:eq(1)")
								.text()
								+ ",";
					});
					comCodes = comCodes.substring(0, comCodes.length - 1);
					if (confirm("确认删除" + comCodes + "吗？")) {
						//发送ajax请求删除
						$.ajax({
							url : "${WEB_PATH}/coms/delete/" + comCodes,
							type : "DELETE",
							success : function(result) {
								alert(result.msg);
								//回到当前页
								to_page(currentPage);
							}
						});

					}
				});

		//----------------------------------管理图片信息----------------------------------//
	
		$(document).on("click", ".edit_img_btn", function() {
			var comCode = $(this).attr("img_comCode");
			//发送ajax请求查询图片，显示在模态框中
			$.ajax({
				url : "${WEB_PATH}/img/selectImg/" + comCode,
				type : "GET",
				success : function(result) {
					var list = "";
					$.each(result.extend.img, function(index, item) {
						list += '<div class="col-lg-2 thumbnail">';
						list += '<img src="'+item.imgUrl+'">';
						list += '<p>'+item.imgType+'</p>'
						list += '<button class="btn btn-danger img_del_btn" img_del="'+item.comCode+'" >删除</button>'
						list += '</div>';
					});
					$("#img_modal_body").html(list);
				}
			});
			//打开模态框
			$("#comsImgModel").modal({
				backdrop : "static"
			});

		});
		//删除图片
		$(document).on("click",".img_del_btn",function(){
			var comCode = $(this).attr("img_del");
			var imgType = $(this).prev().text();
			alert(comCode+imgType);	
			if(confirm("是否确认删除该图片？")){
				$.ajax({
					url:"${WEB_PATH}/img/deleteImg/"+comCode+"/"+imgType,
					type:"DELETE",
					dataType:"json",
					success:function(data){
						alert(data.msg);
					}
				});
			}
			
		})
	</script>
</body>
</html>