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
    <form class="form-signin" method="POST" action="login">
        <div class="form-signin-heading text-center">
            <h1 class="sign-title">居民健康服务信息系统登录</h1>
            <img src="assets/images/logo_login.png" alt=""/>
        </div>
        <div class="login-wrap">
            <input type="text" class="form-control" placeholder="请输入用户名" autofocus name="username" id="username"/>
            <input type="password" class="form-control" placeholder="请输入密码" name="password" id="password" />

            <button id="submit" class="btn btn-lg btn-login btn-block" type="submit">
                <i class="fa fa-check"></i>
            </button>
            <div>
				<p id="msg" style="text-align:center;color:red"></p>
			</div>
            <!-- <label class="checkbox">
                <input type="checkbox" value="remember-me"> Remember me
                <span class="pull-right">
                    <a data-toggle="modal" href="#myModal"> Forgot Password?</a>
                </span>
            </label> -->

        </div>

        <!-- Modal -->
        <!-- <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Forgot Password ?</h4>
                    </div>
                    <div class="modal-body">
                        <p>Enter your e-mail address below to reset your password.</p>
                        <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                        <button class="btn btn-primary" type="button">Submit</button>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- modal -->

    </form>

</div>



<!-- Placed js at the end of the document so the pages load faster -->

<!-- Placed js at the end of the document so the pages load faster -->
<script src="assets/adminex/js/jquery-1.10.2.min.js"></script>
<script src="assets/adminex/js/bootstrap.min.js"></script>
<script src="assets/adminex/js/modernizr.min.js"></script>
<script src="assets/js/jquery.base64.js"></script>
<script src="assets/js/login.js"></script>

</body>
</html>
