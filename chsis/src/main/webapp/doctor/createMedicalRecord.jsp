<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-horizontal">
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label">请输入病人姓名</label>
									<div class="col-sm-3">
										<input class="form-control" type="text" placeholder="病人姓名">
									</div>
									<div class="col-sm-3">
										<a class="btn btn-info" data-toggle="modal" data-target="#hospital">确定新建</a>
										<button class="btn btn-default">取消</button>
									</div>
								</div>
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

	<!-- Modal Start -->
	<div class="modal fade" id="hospital" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="img/hospital.png" alt="医院图标" style="height: 20px; width: 20px;" /> 新建就诊记录
					</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="row">
							<div class="col-sm-3 text-left col-sm-offset-2">
								<h4>
									<b>病人姓名 ：</b>
								</h4>
							</div>
							<div class="col-sm-7 text-left">
								<h4>王文静</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3 text-left col-sm-offset-2">
								<h4>
									<b>疾病史 ：</b>
								</h4>
							</div>
							<div class="col-sm-7 text-left">
								<h4>色盲</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3 text-left col-sm-offset-2">
								<h4>
									<b>电话 ：</b>
								</h4>
							</div>
							<div class="col-sm-7 text-left">
								<h4>18394338773</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3 text-left col-sm-offset-2">
								<h4>
									<b>病情描述 ：</b>
								</h4>
							</div>
							<div class="col-sm-6 text-left">
								<h4>发烧，有鼻涕.......</h4>
							</div>
						</div>
						<div class="blank"></div>
						<div class="col-sm-offset-4">
							<button class="btn btn-info">保存</button>
							<button class="btn btn-default" data-dismiss="modal">取消</button>
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