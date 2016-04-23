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
<link href="assets/css/doctor/index.css" rel="stylesheet">
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
							基本信息
							<span class="tools pull-right"> 
								<button class="btn btn-warning pull-left btn-edit-baseInfo">修改基本信息</button>
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-sm-2 col-sm-offset-3">
								<session class="panel">
									<header class="panel-heading text-center">
										<b>编号：</b>
									</header>
								</session>
							</div>
							<div class="col-sm-3">
								<session class="panel">
									<header class="panel-heading">
										${doctor.number }
									</header>
								</session>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-2 col-sm-offset-3">
								<session class="panel">
									<header class="panel-heading text-center">
										<b>姓名：</b>
									</header>
								</session>
							</div>
							<div class="col-sm-3">
								<session class="panel">
									<header class="panel-heading">
										${doctor.name }
									</header>
								</session>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-2 col-sm-offset-3">
								<session class="panel">
									<header class="panel-heading text-center">
										<b>性别：
									</header>
								</session>
							</div>
							<div class="col-sm-3">
								<session class="panel">
									<header class="panel-heading">
										<c:if test="${doctor.sex==0 }">男</c:if>
										<c:if test="${doctor.sex==1 }">女</c:if>
									</header>
								</session>
							</div>
						</div>	
						<div class="row">
							<div class="col-sm-2 col-sm-offset-3">
								<session class="panel">
									<header class="panel-heading text-center">
										<b>电话：</b>
									</header>
								</session>
							</div>
							<div class="col-sm-3">
								<session class="panel">
									<header class="panel-heading">
										${doctor.phone }
									</header>
								</session>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-2 col-sm-offset-3">
								<session class="panel">
									<header class="panel-heading text-center">
										<b>学历：
									</header>
								</session>
							</div>
							<div class="col-sm-3">
								<session class="panel">
									<header class="panel-heading">
										<c:if test="${doctor.diploma==0 }">专科</c:if>
										<c:if test="${doctor.diploma==1 }">本科</c:if>
										<c:if test="${doctor.diploma==2 }">硕士</c:if>
										<c:if test="${doctor.diploma==3 }">博士</c:if>
										<c:if test="${doctor.diploma==4 }">博士后</c:if>
									</header>
								</session>
							</div>
						</div>	
						<div class="row">
							<div class="col-sm-2 col-sm-offset-3">
								<session class="panel">
									<header class="panel-heading text-center">
										<b>职称：
									</header>
								</session>
							</div>
							<div class="col-sm-3">
								<session class="panel">
									<header class="panel-heading">
										<c:if test="${doctor.title==0 }">护士</c:if>
										<c:if test="${doctor.title==1 }">医师</c:if>
										<c:if test="${doctor.title==2 }">主治医师</c:if>
										<c:if test="${doctor.title==3 }">副主任医师</c:if>
										<c:if test="${doctor.title==4 }">主任医师</c:if>
									</header>
								</session>
							</div>
						</div>	
						<div class="row">
							<div class="col-sm-2 col-sm-offset-3">
								<session class="panel">
									<header class="panel-heading text-center">
										<b>所在医院：
									</header>
								</session>
							</div>
							<div class="col-sm-3">
								<session class="panel">
									<header class="panel-heading">
										${doctor.department.hospital.name }
									</header>
								</session>
							</div>
						</div>	
						<div class="row">
							<div class="col-sm-2 col-sm-offset-3">
								<session class="panel">
									<header class="panel-heading text-center">
										<b>所在科室：
									</header>
								</session>
							</div>
							<div class="col-sm-3">
								<session class="panel">
									<header class="panel-heading">
										${doctor.department.name }
									</header>
								</session>
							</div>
						</div>	
						<div class="row">
							<div class="col-sm-2 col-sm-offset-3">
								<session class="panel">
									<header class="panel-heading text-center">
										<b>医院地址：
									</header>
								</session>
							</div>
							<div class="col-sm-3">
								<session class="panel">
									<header class="panel-heading">
										${doctor.department.hospital.address }
									</header>
								</session>
							</div>
						</div>	
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

	<!-- Modal Start -->
	<div class="modal fade" id="baseInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/doctor.png" alt="医生图标" style="height: 20px; width: 20px;margin-top:-5px;" /> 修改基本信息
					</h4>
				</div>
				<div class="modal-body row">
					<form class="form-horizontal">
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">编号</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="编号" value="d_001">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">姓名</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="姓名" value="王豫宁">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">性别</label>
								<div class="col-sm-3">
									<label class="radio-inline"> <input type="radio" name="inlineRadioOptions" id="male" value="male" checked> 男
									</label> <label class="radio-inline"> <input type="radio" name="inlineRadioOptions" id="female" value="female"> 女
									</label>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">电话</label>

								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="电话" value="183932211998">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">学历</label>
								<div class="col-sm-3">
									<select id="diploma" class="form-control"></select>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">职称</label>
								<div class="col-sm-3">
									<select id="title" class="form-control"></select>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">所在医院</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="所在医院" value="李惠利医院">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">所在科室</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="所在科室" value="外科">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">医院地址</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="医院地址" value="浙江省宁波市江南路1879号">
								</div>
							</div>
						</div>
						<div class="col-sm-offset-4">
							<button class="btn btn-info">保存</button>
							<button class="btn btn-default">取消</button>
						</div>
					</form>
				</div>
				<div class="modal-footer"></div>
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
	<script src="assets/js/doctor/dropDownList.js"></script>

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
</body>
</html>
