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
				<ul class="breadcrumb">
					<li>当前位置：</li>
					<li><a href="resident/medicalRecord.jsp">就诊记录</a></li>
					<li class="active">就诊记录详请</li>
				</ul>
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							检查记录详情
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<div class="infoList">
							<span><b>就诊病人：</b>张三</span> <span><b>主治医生：</b>李医生</span> <span><b>就诊医院：</b>李惠利东部医院</span>
						</div>
						<div class="infoList">
							<span><b>疾病名称：</b>感冒发烧流鼻涕，很严重</span> <span><b>就诊时间：</b>2015/10/20</span>
						</div>
						<div class="infoList">
							<p>
								<span> 
									<b>就诊结果：</b> 华东师大积分上飞机口水发电和福克斯发货快发顺丰收华东师大积分上飞机口水发电和福克 斯发货快发顺丰收到回复收到回复是多少地方
								</span>
							</p>
						</div>
					</div>
				</div>
				<!-- panel end -->
				
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							检查报告
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<div class="blank"></div>
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
								<td>
									<a data-toggle="modal" data-target="#hospital">李惠利医院</a> 
									</td>
								<td><span data-toggle="tooltip" data-placement="top" title="没有不良反应，注意饮食清淡，多吃水果，注意休息。">没有不良反应...</span></td>
								<td>
									<a data-toggle="modal" data-target="#url">检查报告</a>
									</td>
							</tr>
							<tr>
								<td>检查报告2</td>
								<td>2015.03.30</td>
								<td><a href="#">华佗医院</a></td>
								<td><span data-toggle="tooltip" data-placement="top" title="没有不良反应，注意饮食清淡，多吃水果，注意休息。">没有不良反应...</span></td>
								<td><a href="#">体检报告</a></td>
							</tr>
							<tr>
								<td>检查报告2</td>
								<td>2015.03.30</td>
								<td><a href="#">华佗医院</a></td>
								<td>常规检查，轻微感冒</td>
								<td><a href="#">体检报告</a></td>
							</tr>
							<tr>
								<td>检查报告2</td>
								<td>2015.03.30</td>
								<td><a href="#">华佗医院</a></td>
								<td>常规检查，轻微感冒</td>
								<td><a href="#">体检报告</a></td>
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

	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="assets/adminex/js/jquery-1.10.2.min.js"></script>
	<script src="assets/adminex/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="assets/adminex/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/adminex/js/bootstrap.min.js"></script>
	<script src="assets/adminex/js/modernizr.min.js"></script>
	<script src="assets/adminex/js/jquery.nicescroll.js"></script>
	
	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
	<script src="assets/js/resident/util.js"></script>
	
		
	<!-- Modal Start -->
	<div class="modal fade" id="hospital" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/hospital.png" alt="医院图标" style="height: 20px; width: 20px;" /> 医院信息
					</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-3 text-left col-sm-offset-2">
							<h4>
								<b>医院编号 ：</b>
							</h4>
						</div>
						<div class="col-sm-7 text-left">
							<h4>NO.001</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 text-left col-sm-offset-2">
							<h4>
								<b>医院名称 ：</b>
							</h4>
						</div>
						<div class="col-sm-7 text-left">
							<h4>李惠利医院</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 text-left col-sm-offset-2">
							<h4>
								<b>医院地址 ：</b>
							</h4>
						</div>
						<div class="col-sm-7 text-left">
							<h4>浙江省宁波市鄞州区江南路128号</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 text-left col-sm-offset-2">
							<h4>
								<b>医院描述 ：</b>
							</h4>
						</div>
						<div class="col-sm-6 text-left">
							<p class="h4">李惠利医院是一所综合医院，拥有34个科室，100多名主任医生， 占地面积2千平方米，集多种科技于一体，免费挂号.......</p>
						</div>
					</div>
				</div>
				<div class="modal-footer"></div>
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
					</h4>
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
</body>
</html>