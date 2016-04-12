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
							体检记录 <span class="tools pull-right"> <a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" action="">
							<input class="form-control" type="text" placeholder="按接种时间搜索"> <input class="form-control" type="text" placeholder="按接种医院搜索">
							<button class="btn btn-info">搜索</button>
						</form>
						<div class="blank"></div>
						<table class="table table-bordered table-responsive table-hover">
							<tr class="info">
								<th>接种病人</th>
								<th>接种时间</th>
								<th>接种医院</th>
								<th>疫苗名称</th>
							</tr>
							<tr>
								<td>ranran</td>
								<td>2016.03.22</td>
								<td>
									<a data-toggle="modal" data-target="#hospital">李惠利医院</a> 
								</td>
								<td>甲肝疫苗</td>
							</tr>
							<tr>
								<td>ranran</td>
								<td>2016.03.22</td>
								<td><a href="#">李惠利医院</a></td>
								<td>甲肝疫苗</td>
							</tr>
							<tr>
								<td>ranran</td>
								<td>2016.03.22</td>
								<td><a href="#">李惠利医院</a></td>
								<td>甲肝疫苗</td>
							</tr>
							<tr>
								<td>ranran</td>
								<td>2016.03.22</td>
								<td><a href="#">李惠利医院</a></td>
								<td>甲肝疫苗</td>
							</tr>
							<tr>
								<td>ranran</td>
								<td>2016.03.22</td>
								<td><a href="#">李惠利医院</a></td>
								<td>甲肝疫苗</td>
							</tr>
							<tr>
								<td>ranran</td>
								<td>2016.03.22</td>
								<td><a href="#">李惠利医院</a></td>
								<td>甲肝疫苗</td>
							</tr>
							<tr>
								<td>ranran</td>
								<td>2016.03.22</td>
								<td><a href="#">李惠利医院</a></td>
								<td>甲肝疫苗</td>
							</tr>
							<tr>
								<td>ranran</td>
								<td>2016.03.22</td>
								<td><a href="#">李惠利医院</a></td>
								<td>甲肝疫苗</td>
							</tr>
						</table>
						<nav class="col-sm-4 col-sm-offset-4">
							<ul class="pagination ">
								<li>
									<a href="#" aria-label="Previous"> 
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
								<li class="active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li>
									<a href="#" aria-label="Next"> 
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</ul>
						</nav>
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
	
	
	<!-- Modal Start -->
	<div class="modal fade" id="hospital" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="img/hospital.png" alt="医院图标" style="height: 20px; width: 20px;" /> 医院信息
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
</body>
</html>
