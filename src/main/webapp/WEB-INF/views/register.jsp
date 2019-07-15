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
<!-- 上面三条一定要在前面！ -->
<title>用户注册</title>
<script type="text/javascript"
	src="${WEB_PATH }/static/js/jquery-3.4.1.min.js"></script>
<link
	href="${WEB_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${WEB_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link href="${WEB_PATH }/static/css/signin.css" rel="stylesheet" />

</head>
<body>
	<div class="container" id="divMax">

		<form class="form-signin" method="POST" action="/">
			<h2 class="form-signin-heading">欢迎注册！</h2>
			<table>
				<tr>
					<td><input type="text" id="inputAccount" class="form-control"
						name="account" placeholder="账号"></td>
					<td><lable style="color: red;">用户名不能为空！</lable></td>
				</tr>
				<tr>
					<td><input type="text" id="inputUserName" class="form-control"
						name="username" placeholder="用户名"></td>
					<td><lable></lable></td>
				</tr>
				<tr>
					<td><input type="password" id="inputPassword"
						class="form-control" name="password" placeholder="密码"></td>
					<td><lable></lable></td>
				</tr>
				<tr>
					<td><input type="password" id="inputPasswordB"
						class="form-control" name="passwordB" placeholder="确认密码"></td>
					<td><lable></lable></td>
				</tr>
				<tr>
				   <td><input type="text" class="form-control" name="verifyCode" placeholder="验证码"></td>
				   <td><lable></lable></td>
				</tr>
				<tr>
				   <td><div><img src=""></div></td>
				   <td><a href="">换一张</a></td>
				</tr>
				<tr>
					<td>
						<button type="submit" class="btn btn-primary btn-lg form-control">立即注册</button>
					</td>
				</tr>
			</table>
		</form>
		
	</div>

</body>
</html>