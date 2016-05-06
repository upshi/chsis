<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

<title>居民健康服务信息系统</title>

<link href="assets/adminex/css/style.css" rel="stylesheet">
<link href="assets/adminex/css/style-responsive.css" rel="stylesheet">

<!-- Custom Style -->
<link href="assets/css/common.css" rel="stylesheet" type="text/css">
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
						<header class="panel-heading"> 添加管理员 </header>
						<div class="panel-body">
							<form id="form" class="form-horizontal" method="post" action="user/addUser" role="form">
								<br>
								<div class="form-group" id="userNameGroup">
									<label for="userName" class="col-sm-3 control-label">用户名&nbsp;*</label>
	                                <div class="col-lg-3">
	                                    <div class="iconic-input right">
	                                        <input type="text" class="form-control" id="userName" name="userName" placeholder="请输入用户名">
	                                        <p class="help-block"></p>
	                                    </div>
	                                </div>
								</div>
					
								<div class="form-group" id="passwordGroup">
									<label for="password" class="col-sm-3 control-label">初始密码&nbsp;*</label>
	                                <div class="col-lg-3">
	                                    <div class="iconic-input right">
	                                        <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
	                                        <p class="help-block"></p>
	                                    </div>
	                                </div>
								</div>
								
								<div class="form-group" id="nameGroup">
									<label for="name" class="col-sm-3 control-label">姓名&nbsp;*</label>
									<div class="col-lg-3">
	                                    <div class="iconic-input right">
											<input type="text" class="form-control" id="name" name="name" placeholder="请输入姓名">
	                                        <p class="help-block"></p>
	                                    </div>
	                                </div>
								</div>
								
								<div class="form-group">
									<label for="phone" class="col-sm-3 control-label">联系电话&nbsp;&nbsp;</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" id="phone" value=" " name="phone" placeholder="请输入联系电话">
									</div>
								</div>
					
								<div class="form-group">
									<label class="col-sm-3 control-label">所属医院&nbsp;*</label>
									<div class="col-sm-3">
										<select class="form-control" id="companyName" name="companyUuid">
											<optgroup label="请选择所属医院（只能选一个）">
							             		<c:forEach items="${requestScope.companyList}" var="company" varStatus="id">
							             			<option value="${company.uuid}">${company.name}</option>
							             		</c:forEach>
							        		</optgroup>
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-3 control-label">系统角色&nbsp;*</label>
									<div class="col-sm-3">
										<select class="form-control" id="roleUuid" name="roleUuid">
											<optgroup label="请选择系统角色（只能选一个）">
							             		<c:forEach items="${requestScope.roleList}" var="role" varStatus="id">
							             			<option value="${role.uuid}">${role.cName}</option>
							             		</c:forEach>
							        		</optgroup>
										</select>
									</div>
								</div>

								<br>
								<div class="panel-body">
									<label class="col-sm-3 control-label"></label>
									<sec:authorize access="hasRole('ROLE_683c179ac2eb4791902e092fcefadb7d')">	
										<button class="btn btn-primary" type="submit" id="submit">保存</button>
									</sec:authorize>
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
	<script src="assets/js/jquery.base64.js"></script>

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>

	<!-- Custom JS -->
	<script src="assets/js/user/addUser.js"></script>
</body>
</html>
