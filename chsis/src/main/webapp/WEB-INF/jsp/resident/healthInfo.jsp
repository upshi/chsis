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
							常规健康信息 
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<div class="infoList">
							<span><b>身高：</b>180cm</span> <span><b>体重：</b>80kg</span> <span><b>视力：</b> <左眼2.1 ，右眼2.5></span> <span><b>血型：</b>A型</span>
							<button class="btn btn-success" data-target="#commonHealthInfo" data-toggle="modal">修改</button>
						</div>
					</div>
				</div>
				<!-- panel end -->
				
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							疾病史信息 
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<table class="table table-bordered table-responsive table-hover">
							<tr class="info">
								<th>疾病名称</th>
								<th>疾病类型</th>
								<th>开始时间</th>
								<th>痊愈时间</th>
								<th>操作</th>
							</tr>
							<tr>
								<td>色盲</td>
								<td>遗传病</td>
								<td>1993/12/01</td>
								<td>--</td>
								<td>
									<button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#medicalHistoryModal">详情</button> 
								</td>
							</tr>
							<tr>
								<td>色盲</td>
								<td>遗传病</td>
								<td>1993/12/01</td>
								<td>--</td>
								<td><button class="btn btn-primary btn-sm">详情</button></td>
							</tr>
							<tr>
								<td>色盲</td>
								<td>遗传病</td>
								<td>1993/12/01</td>
								<td>--</td>
								<td><button class="btn btn-primary btn-sm">详情</button></td>
							</tr>
							<tr>
								<td>色盲</td>
								<td>遗传病</td>
								<td>1993/12/01</td>
								<td>--</td>
								<td><button class="btn btn-primary btn-sm">详情</button></td>
							</tr>
						</table>
						<button class="btn btn-warning" data-target="#addMedicalHistory" data-toggle="modal">添加疾病史</button>
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
	
	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
	<script src="assets/js/resident/dropDownList.js"></script>

	<!-- Modal Start -->
	<div class="modal fade" id="commonHealthInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/doctor.png" alt="医生图标" style="height: 20px; width: 20px;" /> 修改常规健康信息
					</h4>
				</div>
				<div class="modal-body row">
					<form class="form-horizontal">
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-2 control-label">身高</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="身高" value="173cm">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-2 control-label">体重</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="体重" value="56kg">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-2 control-label">视力</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="视力" value="<左眼2.1， 右眼2.5>">
								</div>
							</div>
						</div>
						<div class="col-sm-offset-4">
							<div class="blank"></div>
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
	
	<!-- Modal Start -->
	<div class="modal fade" id="medicalHistoryModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/doctor.png" alt="医生图标" style="height: 20px; width: 20px;" /> 疾病史
					</h4>
				</div>
				<div class="modal-body row">
					<div class="col-sm-5">
						<div class="row container">
							<div class="col-sm-2">
								<h4>
									<b>疾病名称 ：</b>
								</h4>
							</div>
							<div class="col-sm-1">
								<h4>色盲</h4>
							</div>
						</div>
						<div class="row container">
							<div class="col-sm-2">
								<h4>
									<b>疾病类型 ：</b>
								</h4>
							</div>
							<div class="col-sm-1">
								<h4>遗传病</h4>
							</div>
						</div>
						<div class="row container">
							<div class="col-sm-2">
								<h4>
									<b>开始时间 ：</b>
								</h4>
							</div>
							<div class="col-sm-1">
								<h4>1993/12/01</h4>
							</div>
						</div>
						<div class="row container">
							<div class="col-sm-2">
								<h4>
									<b>痊愈时间 ：</b>
								</h4>
							</div>
							<div class="col-sm-1">
								<h4>--</h4>
							</div>
						</div>
						<div class="row container">
							<div class="col-sm-2">
								<h4>
									<b>病情描述 ：</b>
								</h4>
							</div>
							<div class="col-sm-3">
								<p>色盲是遗传病，无法痊愈。我是红绿色盲，所以不能开车。</p>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- Modal End -->
	
	<!--  Modal Start -->
	<div class="modal fade" id="addMedicalHistory" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/doctor.png" alt="医生图标" style="height: 20px; width: 20px;" /> 添加疾病史
					</h4>
				</div>
				<div class="modal-body row">
					<form class="form-horizontal">
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">疾病名称</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="疾病名称">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">疾病类型</label>
								<div class="col-sm-3">
									<select id="medicalHistory" class="form-control"></select>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">开始时间</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" value="2016-05-15" id="datetimepicker" data-date-format="yyyy-mm-dd">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">痊愈时间</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="痊愈时间">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">病情描述</label>
								<div class="col-sm-3">
									<textarea rows="5" class="form-control">病情描述</textarea>
								</div>
							</div>
						</div>
						<div class="col-sm-offset-5">
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
			
</body>
</html>
