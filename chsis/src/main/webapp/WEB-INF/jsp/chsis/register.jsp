<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
<link rel="shortcut icon" href="assets/images/favicon.ico">

    <title>居民健康服务信息系统</title>

    <link href="assets/adminex/css/style.css" rel="stylesheet">
    <link href="assets/adminex/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="login-body">

<div class="container">
    <form class="form-signin" method="POST" action="resident/register">
        <div class="form-signin-heading text-center">
            <h1 class="sign-title">居民健康服务信息系统注册</h1>
            <img src="assets/images/logo_login.png" alt=""/>
        </div>
        <div class="login-wrap">
        	<div class="row container">
				<div class="form-group" id="userNameGroup">
					<div class="col-sm-3">
						<div class="iconic-input right">
							<input id="userName" class="form-control" name="userName" type="text" placeholder="请输入用户名">
							<p class="help-block"></p>
						</div>
					</div>
				</div>
			</div>
			<div class="row container">
				<div class="form-group" id="passwordGroup">
					<div class="col-sm-3">
						<div class="iconic-input right">
							<input id="password" class="form-control" name="password" type="password" placeholder="请输入密码">
							<p class="help-block"></p>
						</div>
					</div>
				</div>
			</div>
			<div class="row container">
				<div class="form-group" id="repasswordGroup">
					<div class="col-sm-3">
						<div class="iconic-input right">
							<input id="repassword" class="form-control" name="repassword" type="password" placeholder="请输入确认密码">
							<p class="help-block"></p>
						</div>
					</div>
				</div>
			</div>
            <button id="submit" class="btn btn-lg btn-login btn-block" type="submit">
                <i class="fa fa-check"></i>
            </button>
           <!--  <label class="checkbox">
                <input type="checkbox" value="remember-me"> Remember me
                <span class="pull-right">
                    <a data-toggle="modal" href="#myModal"> Forgot Password?</a>
                </span>
            </label> -->
        </div>
    </form>
</div>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="assets/adminex/js/jquery-1.10.2.min.js"></script>
<script src="assets/adminex/js/bootstrap.min.js"></script>
<script src="assets/adminex/js/modernizr.min.js"></script>
<script src="assets/js/jquery.base64.js"></script>
<script src="assets/js/register.js"></script>

</body>
</html>
