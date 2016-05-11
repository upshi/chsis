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
<link href="assets/css/jquery-confirm.css" rel="stylesheet">

<!--你自己的样式文件 -->
<link href="assets/css/resident/index.css" rel="stylesheet">
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
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							请填写基本信息
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" method="POST" action="resident/complete">
							<input id="residentUuid" type="hidden" name="uuid" value="${resident.uuid }">
								<div class="row container">
									<div class="form-group">
										<label class="col-sm-1 col-sm-offset-1 control-label">家庭编号:</label>
										<div class="col-sm-3">
											<label class="control-label">
												${resident.family.number }
											</label>
										</div>
									</div>
								</div>
								<div class="row container">
									<div class="form-group">
										<label class="col-sm-1 col-sm-offset-1 control-label">户主姓名:</label>
										<div class="col-sm-3">
											<label class="control-label">
												${householderName }
											</label>
										</div>
									</div>
								</div>
								<div class="row container">
									<div class="form-group">
										<label class="col-sm-1 col-sm-offset-1 control-label">居民姓名:</label>
										<div class="col-sm-3">
											<label class="control-label">
												${resident.name }
											</label>
										</div>
									</div>
								</div>
								<div class="row container">
									<div class="form-group">
										<label class="col-sm-1 col-sm-offset-1 control-label">身份证号:</label>
										<div class="col-sm-3">
											<label class="control-label">
												${resident.idNo }
											</label>
										</div>
									</div>
								</div>
								<div class="row container">
									<div class="form-group">
										<label class="col-sm-1 col-sm-offset-1 control-label">居民性别:</label>
										<div class="col-sm-3">
											<label class="radio-inline">
												<input type="radio" name="sex" value="0" checked> 男
											</label>
											<label class="radio-inline">
												<input type="radio" name="sex" value="1"> 女
											</label>
										</div>
									</div>
								</div>
								<div class="row container">
									<div class="form-group">
										<label class="col-sm-1 col-sm-offset-1 control-label">所属民族:</label>
										<div class="col-sm-3">
											<select id="nation" class="form-control" name="nation"></select>
										</div>
									</div>
								</div>
								<div class="row container">
									<div class="form-group" id="birthGroup">
										<label class="col-sm-1 col-sm-offset-1 control-label">出生日期:</label>
										<div class="col-sm-3">
											<div class="iconic-input right">
												<input id="birth" class="form-control" type="text" name="birth" placeholder="出生日期，如：19931201">
												<p class="help-block"></p>
											</div>
										</div>
									</div>
								</div>
								<div class="row container">
									<div class="form-group">
										<label class="col-sm-1 col-sm-offset-1 control-label">居民年龄:</label>
										<div class="col-sm-3">
											<select id="age-select" name="age" class="form-control"></select>
										</div>
									</div>
								</div>
								<div class="row container">
									<div class="form-group">
										<label class="col-sm-1 col-sm-offset-1 control-label">年龄分段:</label>
										<div class="col-sm-3">
											<select id="period" class="form-control" name="period"></select>
										</div>
									</div>
								</div>
								<div class="row container">
									<div class="form-group" id="phoneGroup">
										<label class="col-sm-1 col-sm-offset-1 control-label">联系电话:</label>
										<div class="col-sm-3">
											<div class="iconic-input right">
												<input id="phone" class="form-control" type="text" name="phone" placeholder="请输入您的联系电话">
												<p class="help-block"></p>
											</div>
										</div>
									</div>
								</div>
								<div class="row container">
									<div class="form-group">
										<label class="col-sm-1 col-sm-offset-1 control-label">婚姻状况:</label>
										<div class="col-sm-3">
											<select id="marriage" class="form-control" name="marriage"></select>
										</div>
									</div>
								</div>
								<div class="row container">
									<div class="form-group" id="heightGroup">
										<label class="col-sm-2 control-label">居民身高:</label>
										<div class="col-sm-3">
											<div class="iconic-input right">
												<input id="height" class="form-control" name="height" type="text" placeholder="身高(cm)">
												<p class="help-block"></p>
											</div>
										</div>
									</div>	
								</div>
								<div class="row container">
									<div class="form-group" id="weightGroup">
										<label class="col-sm-2 control-label">居民体重:</label>
										<div class="col-sm-3">
											<div class="iconic-input right">
												<input id="weight" class="form-control" name="weight" type="text" placeholder="体重(kg)">
												<p class="help-block"></p>
											</div>
										</div>
									</div>
								</div>
								<div class="row container">
									<div class="form-group">
										<label class="col-sm-1 col-sm-offset-1 control-label">居民血型:</label>
										<div class="col-sm-3">
											<select id="bloodType" class="form-control" name="bloodType"></select>
										</div>
									</div>
								</div>
								<div class="row container">
									<div class="form-group" id="leftEyesightGroup">
										<label class="col-sm-2 control-label">左眼视力:</label>
										<div class="col-sm-3">
											<div class="iconic-input right">
												<input id="leftEyesight" class="form-control" name="leftEyesight" type="text" placeholder="左眼视力">
												<p class="help-block"></p>
											</div>
										</div>
									</div>
								</div>
								<div class="row container">
									<div class="form-group" id="rightEyesightGroup">
										<label class="col-sm-2 control-label">右眼视力:</label>
										<div class="col-sm-3">
											<div class="iconic-input right">
												<input id="rightEyesight" class="form-control" name="rightEyesight" type="text" placeholder="右眼视力">
												<p class="help-block"></p>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-offset-2">
									<button class="btn btn-info" id="submit">保存</button>
									<button class="btn btn-default" data-dismiss="modal">取消</button>
								</div>	
						</form>
					</div>
				</div>
				<!-- panel end -->
			</div>
			<!--body wrapper end-->

			<!--footer section start-->
			<%@ include file="/include/footer.jsp"%>
			<!--footer section end-->
		</div>
		<!-- main content end-->
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
	<script src="assets/js/resident/addInfo.js"></script>
</body>
</html>
