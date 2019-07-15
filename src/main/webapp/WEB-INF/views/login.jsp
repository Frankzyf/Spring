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
<title>用户登录</title>
<script type="text/javascript" src="${WEB_PATH }/static/js/jquery-3.4.1.min.js"></script>
<link href="${WEB_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${WEB_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link href="${WEB_PATH }/static/css/signin.css" rel="stylesheet" />

</head>
<body>
	<div class="container">

		<form class="form-signin" action="${WEB_PATH}/user/userLogin" method="get">
			<h2 class="form-signin-heading">Please sign in</h2>
			<label for="inputEmail" class="sr-only">Account</label> 
			<input type="text" id="inputAccount" class="form-control" placeholder="Account" name="account">
			<label for="inputPassword" class="sr-only">Password</label> 
			<input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password">
			<div class="checkbox">
				<label> <input type="checkbox" value="remember-me">
					Remember me
				</label>
			</div>
			<button class="btn btn-primary btn-lg form-control" id="login_btn" type="submit">登录</button>
			<button type="button" class="btn btn-success btn-lg form-control">
				<a href="${WEB_PATH }/user/register">注册</a>
			</button>
		</form>

	</div>
<script type="text/javascript">
</script>
</body>
</html>