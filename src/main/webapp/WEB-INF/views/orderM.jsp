<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% pageContext.setAttribute("PATH", request.getContextPath());%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>菜单</title>
  <link rel="stylesheet" href="${PATH}/static/layui/css/layui.css">
</head>
<body>
<!-- 上部 -->
	<div class="layui-collapse">
		<div class="layui-colla-item">
			<h2 class="layui-colla-title">订单信息-查詢条件</h2>
			<div class="layui-colla-content layui-show">
				<fieldset class="layui-elem-field layui-field-title"
					style="margin-top: 50px">
					<legend>订单信息-查询条件</legend>
					<form class="layui-form">
						<div class="layui-form-item">
							<label class="layui-form-label">订单编号</label>
							<div class="layui-input-inline">
								<input type="text" id="menuCode" placeholder="请输入订单编号"
									autocomplete="off" class="layui-input">
							</div>
							<label class="layui-form-label">商品编号</label>
							<div class="layui-input-inline">
								<input type="text" id="menuName" placeholder="请输入商品编号"
									autocomplete="off" class="layui-input">
							</div>
							<label class="layui-form-label"></label> <span> <input
								type="button" class="layui-btn layui-icon" lay-filter="formDemo"
								id="addMenu" value="&#xe608;添加" /> <input type="button"
								class="layui-btn layui-icon" id="selectAll" value="&#xe615;查找" />
							</span>
						</div>
					</form>
					<div class="layui-form-item">
						<label class="layui-form-label"></label> <input type="button"
							class="layui-btn" value="导出Excel" onclick="exportExcel()" />
					</div>
				</fieldset>
			</div>
		</div>
	</div>
 
 <!-- 表格部分 -->
<table id="demo" lay-filter="test"></table>

<!-- 编辑模态框 -->
<div id="Update" style="display: none;">
<form class="layui-form layui-form-pane" action="${PATH}/menu/update" method="POST" id="updateMenu">

  <div class="layui-form-item">
    <label class="layui-form-label">订单编号</label>
    <div class="layui-input-inline">
      <input type="text" readonly="readonly" id="orderNum" name="orderNum" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">商品编号</label>
    <div class="layui-input-inline">
      <input type="text" id="comCode" name="comCode" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">商品数量</label>
    <div class="layui-input-inline">
      <input type="text" id="comNum" name="comNum" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">总价</label>
    <div class="layui-input-inline">
      <input type="text" id="total_prices" name="total_prices" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>

  <div class="layui-form-item">
    <button class="layui-btn">提交</button>
  </div>
</form>
</div>

<!-- 添加模态框 -->
<div id="Add" style="display: none;">
<form class="layui-form layui-form-pane" action="${PATH}/menu/insert" method="POST" id="registSubmit">

  <div class="layui-form-item">
    <label class="layui-form-label">订单编号</label>
    <div class="layui-input-inline">
      <input type="text" name="orderNum" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">商品编号</label>
    <div class="layui-input-inline">
      <input type="text" name="comCode" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">商品数量</label>
    <div class="layui-input-inline">
      <input type="text" name="comNum" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label">总价</label>
    <div class="layui-input-inline">
      <input type="text" name="total_prices" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <button class="layui-btn">提交</button>
  </div>
</form>
</div>
<script type="text/javascript" src="${PATH}/static/js/jquery-3.4.1.min.js"></script>
<script src="${PATH}/static/layui/layui.js"></script>
<script type="text/javascript">


</script>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>

layui.use(['form','jquery','layer',"table"], function(){
  var table = layui.table;
  var form = layui.form;
  var $ = layui.jquery;
  var layer = layui.layer;

  $("#selectAll").click(function(){
	  var orderNum = $("#menuCode").val()
	  var comCode = $("#menuName").val()

	  table.render({
		    elem: '#demo'
		    ,height: 400
		    ,url: '${PATH}/order/select' //数据接口
		    ,page: true //开启分页
		    ,where: {orderNum: orderNum,comCode: comCode}
		    ,cols: [[ //表头
		      {type:'checkbox', fixed: 'left'}
		      ,{field: 'orderNum', title: '订单编号' }
		      ,{field: 'comCode', title: '商品编号' }
		      ,{field: 'comNum', title: '商品数量'} 
		      ,{field: 'total_prices', title: '总价'}
		      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
		    ]]
		  ,page: true//开启分页
		  ,limit:10
		  ,limits:[10,20,30,50]
		  ,id:'testReload'
		  }); 
		  
	  });

//监听工具行
  table.on('tool(test)', function(obj){
      var data = obj.data;
      console.log(obj)
      
      if(obj.event === 'del'){
          layer.confirm('真的删除行么', function(index){
          obj.del();
          layer.close(index);
          $.ajax({
              url:"${PATH}/order/delete?orderNum="+data.orderNum,
              type:"GET",
              success:function(){
                   alert("删除成功！");
                  }           
              });     
        });
          
      } else if(obj.event === 'edit'){
    	layer.open({
    	        title:'编辑',
    	       type:1,
    	       area: ['500px', '300px'],
    	       content:$("#Update")
  	      });
          
	      $.ajax({
               url:"${PATH}/order/selectByCode?orderNum="+data.orderNum,
               type:"GET",
               success:function(result){
                  $("#orderNum").val(result.orderNum);
                  $("#comCode").val(result.comCode);
                  $("#comNum").val(result.comNum);
                  $("#total_prices").val(result.total_prices);
                   }
		      });
      }
    });

  //阻止添加表单提交后跳转页面
  $("#registSubmit").on("submit",function(){
		registPost();
		event.preventDefault();
	});
	function registPost(){
		var data = $("#registSubmit").serialize();
		  $.ajax({
		        url:"${PATH}/order/insert",
		        type:"POST",
		        data:data,
		        success:function(){
		         alert("添加成功！")
		         layer.close(layer.index);
		         window.location.reload();
		            }
				});
		  }

	// 阻止更新表单提交后跳转页面
	$("#updateMenu").on("submit",function(){
		updatePost();
		event.preventDefault();
	});
	function updatePost(){
		var data = $("#updateMenu").serialize();
		  $.ajax({
		        url:"${PATH}/order/update",
		        type:"POST",
		        data:data,
		        success:function(){
		         alert("更改成功！")
		         layer.close(layer.index);
		         window.location.reload();
		            }
				});
		  }
});



layui.use(['form','jquery','layer'],function(){
	var form = layui.form;
	var $ = layui.jquery;
	var layer = layui.layer;

	//弹出层
	$("#addMenu").on("click",function(){

		layer.open({
               title:'添加菜单',
               type:1,
               area: ['500px', '300px'],
               content:$("#Add")
			});
		})
     });
</script>
</body>
</html>