<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
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
<link href="assets/css/userDetail.css" rel="stylesheet" type="text/css">
<link href="assets/css/jquery-confirm.css" rel="stylesheet" type="text/css"/>
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
						<header class="panel-heading"> 员工信息详情 </header>
						<div class="panel-body">
							<br>
							<div class="row">
								<label class="col-sm-3 text-right">用户名:</label> <label class="col-sm-3 text-left">${user.username}</label>
							</div>
							
							<div class="row">
								<label class="col-sm-3 text-right">姓名:</label> <label class="col-sm-3 text-left">${user.name}</label>
							</div>
							
							<div class="row">
								<label class="col-sm-3 text-right">固定电话:</label> <label class="col-sm-3">${user.telephone}</label>
							</div>
					
							<div class="row">
								<label class="col-sm-3 text-right">手机号码:</label> <label class="col-sm-3">${user.mobilePhone}</label>
							</div>
							
							<div class="row">
								<label class="col-sm-3 text-right">常用邮箱:</label> <label class="col-sm-3">${user.email}</label>
							</div>
					
							<div class="row">
								<label class="col-sm-3 text-right">所属公司:</label> <label class="col-sm-3">${requestScope.companyName}</label>
							</div>
							
							<c:forEach items="${userRoles}" var="userRole" varStatus="id">
								<div class="row">
									<c:if test="${id.index == 0 }"><label class="col-sm-3 text-right">角色列表:</label></c:if>
									<c:if test="${id.index != 0 }"><label class="col-sm-3 text-right"></label></c:if>
									<label class="col-sm-3">${userRole.role.cName }&nbsp;&nbsp;|&nbsp;&nbsp;${userRole.role.eName }</label><br>
								</div>
							</c:forEach>
							
							<br><br><br>
							<div class="row">
								<br>
								<div class="col-sm-offset-3  col-sm-20">
									<a href="user/update/${user.uuid}"  class="btn btn-warning" type="button">编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="user/toAllocateRole/${user.uuid}"  class="btn btn-info" type="button">分配角色</a>&nbsp;&nbsp;&nbsp;&nbsp;
									<a class="btn btn-danger" onclick="deleteUser('${user.uuid}')">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="user/manager" class="btn btn-primary"  type="button">查看人员列表</a>
								</div>
							</div>
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

	<!-- Custom JS -->
	<script src="assets/js/admin/managerDetail.js"></script>
</body>

</html>
