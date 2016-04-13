<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<link rel="shortcut icon" href="assets/image/favicon.ico" type="image/png">
<title></title>

<!-- Bootstrap -->
<link href="assets/adminex/css/style.css" rel="stylesheet">
<link href="assets/adminex/css/style-responsive.css" rel="stylesheet">

<!--你自己的样式文件 -->
<link href="assets/css/jquery-confirm.css" rel="stylesheet">
<link href="assets/css/admin/index.css" rel="stylesheet">
</head>
<body class="sticky-header">
	<section>
		<!-- left-side start -->
		<%@ include file="/include/left-side.jsp"%>
		<!-- left-side end -->

		<!-- main content start-->
		<div class="main-content">
			<!-- header start -->
			<%@ include file="/include/header.jsp"%>
			<!-- header end -->
			
			<!--body wrapper start-->
			<div class="wrapper">
				<ul class="breadcrumb">
					<li>当前位置：</li>
					<li><a href="admin/hospital">医院管理</a></li>
					<li class="active">${hospital.name }详情</li>
				</ul>
				<div class="row">
					<div class="col-sm-6">
						<section class="panel">
							<header class="panel-heading">
								<b>医院编号：</b>${hospital.number }
							</header>
							<header class="panel-heading">
								<b>医院名称：</b>${hospital.name }
							</header>
							<header class="panel-heading">
								<b>医院地址：</b>${hospital.address }
							</header>
						</section>
						<section class="panel">
							<header class="panel-heading">
								<b>医院描述：</b>
							</header>
							<div class="panel-body">
								<p>${hospital.description }</p>
							</div>
						</section>
					</div>

					<div class="col-sm-6">
						<!-- panel start -->
						<div class="panel">
							<div class="panel-heading">
								<h3 class="panel-title">
									医院管理员信息
									<span class="tools pull-right">
										<button class="btn btn-warning pull-left btn-add-manager" uuid="${hospital.uuid }">添加医院管理员</button>
										<a class="fa fa-chevron-down" href="javascript:;"></a>
									</span>
								</h3>
							</div>
							<div class="panel-body">
								<table class="table table-bordered table-responsive table-hover">
									<tr class="info">
										<th>用户名</th>
										<th>姓名</th>
										<th>电话</th>
										<th>操作</th>
									</tr>
									<c:forEach items="${hospitalManagers }" var="hospitalManager" varStatus="index">
										<tr>
											<td>${hospitalManager.manager.userName }</td>
											<td>${hospitalManager.manager.name }</td>
											<td>${hospitalManager.manager.phone }</td>
											<td>
												<button class="btn btn-danger btn-sm deleteHospitalManager" onclick="deleteHospitalManager('${hospitalManager.manager.uuid}','${hospital.uuid}')">删除</button>
												<button class="btn btn-info btn-sm btn-edit-hospitalManager" uuid="${hospitalManager.manager.uuid }">修改</button>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
						<!-- panel end -->
					</div>
				</div>
			</div>
			<!--body wrapper end-->

			<!--footer section start-->
			<%@ include file="/include/footer.jsp"%>
			<!--footer section end-->
		</div>
		<!-- main content end-->
	</section>

	<!-- Modal Start -->
	<div class="modal fade" id="addHospitalManager" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">添加医院管理员</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" method="POST" action="admin/addHospitalManager">
						<input type="hidden" name="hospitalUuid" value="" />
						<div class="row container">
							<div class="form-group" id="addm-userNameGroup">
								<label class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="addm-userName" class="form-control" name="userName" type="text" placeholder="用户名">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="addm-passwordGroup">
								<label class="col-sm-2 control-label">密码</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="addm-password" class="form-control" type="password" name="password" placeholder="密码">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="addm-nameGroup">
								<label class="col-sm-2 control-label">姓名</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="addm-name" class="form-control" name="name" type="text" placeholder="姓名">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="addm-phoneGroup">
								<label class="col-sm-2 control-label">电话</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="addm-phone" class="form-control" name="phone" type="text" placeholder="电话">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="col-sm-offset-2">
								<input id="addm-submit" type="submit" class="btn btn-success" value="保存" />
								<button class="btn btn-default" data-dismiss="modal">取消</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End -->

	<!-- Modal Start -->
	<div class="modal fade" id="editHospitalManager" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">修改医院管理员信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" method="POST" action="manager/editHospitalManager">
						<input id="editm-uuid" type="hidden" name="uuid" value="" />
						<input type="hidden" name="hospitalUuid" value="${hospital.uuid }" />
						<div class="row container">
							<div class="form-group" id="editm-userNameGroup">
								<label class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editm-userName" class="form-control" type="text" placeholder="用户名" readonly>
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="editm-nameGroup">
								<label class="col-sm-2 control-label">姓名</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editm-name" class="form-control" name="name" type="text" placeholder="姓名">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="editm-phoneGroup">
								<label class="col-sm-2 control-label">电话</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editm-phone" class="form-control" name="phone" type="text" placeholder="电话">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="col-sm-offset-2">
								<input id="editm-submit" type="submit" class="btn btn-success" value="保存" />
								<button class="btn btn-default" data-dismiss="modal">取消</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End -->

	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="assets/adminex/js/jquery-1.10.2.min.js"></script>
	<script src="assets/adminex/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="assets/adminex/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/adminex/js/bootstrap.min.js"></script>
	<script src="assets/adminex/js/modernizr.min.js"></script>
	<script src="assets/adminex/js/jquery.nicescroll.js"></script>

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
    <script src="assets/js/jquery-confirm.js"></script>
    <script src="assets/js/jquery.base64.js"></script>
    
    <!-- Custome Javascript -->
    <script src="assets/js/admin/hospitalDetail.js"></script>
    
</body>
</html>
