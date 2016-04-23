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
							就诊记录
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" method="POST" action="medicalRecord/add">
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label"><b>就诊病人：</b></label>
									<div class="col-sm-5">
										<label class="control-label">
											张三
										</label>
									</div>
								</div>
							</div>
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label"><b>主治医生：</b></label>
									<div class="col-sm-5">
										<label class="control-label">
											王医生
										</label>
									</div>
								</div>
							</div>
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label"><b>就诊医院：</b></label>
									<div class="col-sm-5">
										<label class="control-label">
											李惠利医院
										</label>
									</div>
								</div>
							</div>
							<div class="row container">
								<div class="form-group" id="addm-nameGroup">
									<label class="col-sm-2 control-label"><b>疾病名称：</b></label>
									<div class="col-sm-5">
										<div class="iconic-input right">
											<input id="addm-name" class="form-control" type="text" name="name" placeholder="请输入疾病名称">
											<p class="help-block"></p>
										</div>
									</div>
								</div>
							</div>
							<div class="row container">
								<div class="form-group" id="addm-resultGroup">
									<label class="col-sm-2 control-label"><b>就诊结果：</b></label>
									<div class="col-sm-5">
										<div class="iconic-input right">
											<textarea id="addm-result" class="form-control" name="result" rows="5" placeholder="请输入有关就诊结果的描述"></textarea>
											<p class="help-block"></p>
										</div>
									</div>
								</div>
							</div>
						</form>
			        </div>
				</div>
				<!-- panel end -->
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							检查报告
							<span class="tools pull-right"> 
								 <button class="btn btn-warning pull-left" data-target="#addMedicalReport" data-toggle="modal">添加检查报告</button>
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<table class="table table-bordered table-responsive table-hover">
							<tr class="info">
								<th>报告名称</th>
								<th>诊察时间</th>
								<th>就诊医院</th>
								<th>病情描述</th>
								<th>体检单</th>
							</tr>
							<tr>
								<td>检查报告1</td>
								<td>2016.03.22</td>
								<td>李惠利医院</td>
								<td><span data-toggle="tooltip" data-placement="top" title="没有不良反应，注意饮食清淡，多吃水果，注意休息。">没有不良反应...</span></td>
								<td><a data-toggle="modal" data-target="#url">检查报告</a></td>
							</tr>
						</table>
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
	<div class="modal fade" id="addMedicalReport" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/hospital.png" alt="医院图标" style="height: 20px; width: 20px;" /> 医院信息
					</h5>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="row form-group">
							<div class="col-sm-3 text-right">
								<h5>
									<b>报告名称 ：</b>
								</h5>
							</div>
							<div class="col-sm-7 text-left">
								<input class="form-control" type="text" placeholder="报告名称">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-sm-3 text-right">
								<h5>
									<b>诊察时间 ：</b>
								</h5>
							</div>
							<div class="col-sm-7 text-left">
								<input class="form-control" type="text" placeholder="诊察时间，如：2016/04/10">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-sm-3 text-right">
								<h5>
									<b>就诊医院 ：</b>
								</h5>
							</div>
							<div class="col-sm-7 text-right">
								<input class="form-control" type="text" placeholder="就诊医院">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-sm-3 text-right">
								<h5>
									<b>病情描述 ：</b>
								</h5>
							</div>
							<div class="col-sm-7 text-left">
								<textarea class="form-control" rows="5" placeholder="请输入病情描述"></textarea>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-sm-3 text-right">
								<h5>
									<b>上传报告单 ：</b>
								</h5>
							</div>
							<div class="col-sm-8 text-left">
								<input type="file" name="report" style="margin-top: 5px;">
							</div>
						</div>
						<div class="col-sm-offset-4">
							<button class="btn btn-info">保存</button>
							<button class="btn btn-default">取消</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End -->
	
	<!-- Modal Start -->
	<div class="modal fade" id="url" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/url.png" alt="体检报告" style="height: 20px; width: 20px;" /> 体检报告
					</h5>
				</div>
				<div class="modal-body row">
					<div class="col-sm-12 container-fluid">
						<img src="assets/image/report.jpg" alt="体检报告" style="height: 100%; width: 100%;" />
					</div>
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
	<script src="assets/js/doctor/dropDownList.js"></script>

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
</body>
</html>