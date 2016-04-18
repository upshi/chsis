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
							基本信息
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
			            <div class="infoList">
							<span><b>居民姓名：</b>d_001</span> <span><b>居民性别：</b>男</span> <span><b>身份证号：</b>329444199312091624</span>
						</div>
						<div class="infoList">
							<span><b>所属民族：</b>汉族</span> <span><b>出生日期：</b>1993/12/01</span> <span><b>居民年龄：</b>22岁</span>
						</div>
						<div class="infoList">
							<span><b>年龄分段：</b>青年</span> <span><b>联系电话：</b>18394338773</span> <span><b>婚姻状况：</b>未婚</span>
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

	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="assets/adminex/js/jquery-1.10.2.min.js"></script>
	<script src="assets/adminex/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="assets/adminex/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/adminex/js/bootstrap.min.js"></script>
	<script src="assets/adminex/js/modernizr.min.js"></script>
	<script src="assets/adminex/js/jquery.nicescroll.js"></script>
	<script src="assets/js/resident/dropDownList.js"></script>

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>

	<!-- Modal Start-->
	<div class="modal fade" id="baseInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/doctor.png" alt="医生图标" style="height: 20px; width: 20px;" /> 修改基本信息
					</h4>
				</div>
				<div class="modal-body row">
					<form class="form-horizontal">
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">居民姓名</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="居民姓名">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">居民性别</label>
								<div class="col-sm-3">
									<label class="radio-inline"> <input type="radio" name="inlineRadioOptions" id="male" value="male" checked> 男
									</label> <label class="radio-inline"> <input type="radio" name="inlineRadioOptions" id="female" value="female"> 女
									</label>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">身份证号</label>

								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="身份证号">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">所属民族</label>

								<div class="col-sm-3">
									<select id="nation" class="form-control"></select>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">出生日期</label>

								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="出生日期，如：19931201">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">居民年龄</label>

								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="居民年龄">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">年龄分段</label>
								<div class="col-sm-3">
									<select id="period" class="form-control"></select>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">联系电话</label>

								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="联系电话">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">婚姻状况</label>
								<div class="col-sm-3">
									<select id="marriage" class="form-control"></select>
								</div>
							</div>
						</div>
						<div class="col-sm-offset-5">
							<button class="btn btn-info">保存</button>
							<button class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- Modal End-->
</body>
</html>
