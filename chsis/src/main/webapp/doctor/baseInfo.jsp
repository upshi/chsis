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
		                <div class="infoList">
		                    <span><b>编号：</b>d_001</span>
		                    <span><b>姓名：</b>王世红</span>
		                    <span><b>性别：</b>男</span>
		                </div>
		                <div class="infoList">
		                    <span><b>电话：</b>1833030824</span>
		                    <span><b>学历：</b>硕士</span>
		                    <span><b>职称：</b>主治医生</span>
		                </div>
		                <div class="infoList">
		                    <span><b>所在医院：</b>李惠利医院</span>
		                    <span><b>所在科室：</b>外科</span>
		                </div>
		                <div class="infoList">
		                    <span><b>医院地址：</b>浙江省宁波市江南路1879号</span>
		                </div>
		                <button class="btn btn-info col-sm-offset-4" data-target="#baseInfo" data-toggle="modal">修改基本信息</button>
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
