<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="shortcut icon" href="assets/images/favicon.ico">

<title>融圳保本理财系统</title>

<link href="assets/adminex/css/style.css" rel="stylesheet">
<link href="assets/adminex/css/style-responsive.css" rel="stylesheet">

<!-- Custom Style -->
<link href="assets/css/common.css" rel="stylesheet" type="text/css">
<link href="assets/css/updateUser.css" rel="stylesheet" type="text/css">
</head>
<body class="sticky-header">
	<section> <!-- 左侧导航栏  开始 -->
		<div><%@ include file="/include/left-side.jsp"%></div>
		<!-- 左侧导航栏  结束--> <!-- 主要内容  开始-->
		<div class="main-content">
			<!-- 头部  开始-->
			<div><%@ include file="/include/header.jsp"%></div>
			<!-- 头部  结束 -->
	
			<!-- 页面标题	开始 -->
			<div class="page-heading"></div>
			<!-- 页面标题	结束-->
	
			<!--页面主体  开始-->
			<div class="wrapper">
				<div class="col-lg-12">
					<section class="panel">
						<header class="panel-heading"> 编辑员工信息 </header>
						<div class="panel-body">
							<form class="form-horizontal" role="form" action="user/updateFinish">
								<br>
								<input type="hidden" class="form-control" id="uuid" name="uuid" value="${user.uuid}">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<div class="form-group">
									<label for="userName" class="col-sm-3 control-label">用户名</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" id="userName" name="userName" value="${user.username}" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="name" class="col-sm-3 control-label">姓名</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" id="name" name="name" value="${user.name}" readonly>
									</div>
								</div>
								
								<div class="form-group">
									<label for="telephone" class="col-sm-3 control-label">固定电话</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" id="telephone" name="telephone" value="${user.telephone}" placeholder="请输入固定电话">
									</div>
								</div>
								
								<div class="form-group">
									<label for="mobilePhone" class="col-sm-3 control-label">手机号</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" id="mobilePhone" name="mobilePhone" value="${user.mobilePhone}" placeholder="请输入手机号">
									</div>
								</div>
								
								<div class="form-group">
									<label for="email" class="col-sm-3 control-label">邮箱</label>
									<div class="col-sm-3">
										<input type="email" class="form-control" id="email" name="email" value="${user.email}" placeholder="请输入邮箱">
									</div>
								</div>
					
								<div class="form-group">
									<label class="col-sm-3 text-right">所属公司:</label> 
									<div class="col-sm-3">
										<input type="text" class="form-control" id="companyName" name="companyName" value="${requestScope.companyName}" readonly>
									</div>
								</div>
					
								<div class="form-group">
									<div class="col-sm-offset-3 col-sm-10">
										<sec:authorize access="hasRole('ROLE_40a3ad71facd41a8bc0fd140b13a7a2a')">	
											<input class="btn btn-success" type="submit" value="&nbsp;&nbsp;保&nbsp;&nbsp;存&nbsp;&nbsp;">
										</sec:authorize>
									</div>
								</div>
							</form>
						</div>
					</section>
				</div>
			</div>
	
			<!--页脚区域  开始-->
			<div><%@ include file="/include/footer.jsp"%></div>
			<!--页脚区域  结束-->
		</div>
	</section>
	
	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="assets/adminex/js/jquery-1.10.2.min.js"></script>
	<script src="assets/adminex/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="assets/adminex/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/adminex/js/bootstrap.min.js"></script>
	<script src="assets/adminex/js/modernizr.min.js"></script>
	<script src="assets/adminex/js/jquery.nicescroll.js"></script>
	<script src="assets/js/jquery-confirm.js"></script>

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>

	<script type="text/javascript">
		$("#navi_user").addClass('active');
	</script>
</body>

</html>
