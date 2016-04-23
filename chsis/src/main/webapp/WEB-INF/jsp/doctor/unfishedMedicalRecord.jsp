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
						<form class="form-inline" action="">
		                    <input class="form-control" type="text" placeholder="按就诊病人搜索">
		                    <input class="form-control" type="text" placeholder="按就诊时间搜索">
		                    <button class="btn btn-info">搜索</button>
		                </form>
		                <div class="blank"></div>
		                <table class="table table-bordered table-responsive table-hover">
		                    <tr class="info">
		                        <th>就诊病人</th>
		                        <th>就诊时间</th>
		                        <th>疾病名称</th>
		                        <th>就诊医院</th>
		                        <th>就诊科室</th>
		                        <th>就诊状态</th>
		                        <th>操作</th>
		                    </tr>
		                    <tr>
		                        <td>
		                            <a data-toggle="modal" data-target="#patient">李四</a>
		                        </td>
		                        <td>2016.03.22</td>
		                        <td>感冒</td>
		                        <td>
		                            <a data-toggle="modal" data-target="#hospital">李惠利医院</a>
		                        </td>
		                        <td>外科</td>
		                        <td>已检查</td>
		                        <td><a class="btn btn-warning btn-sm" href="medicalRecord/unfinishedMedicalRecordDetail">完善</a></td>
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
    
    <!-- Modal Start -->
	<div class="modal fade" id="patient" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="img/patient.png" alt="病人图标" style="height: 20px; width: 20px;" /> 病人信息
					</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-3 text-left col-sm-offset-2">
							<h4>
								<b>病人姓名 ：</b>
							</h4>
						</div>
						<div class="col-sm-7 text-left">
							<h4>李四</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 text-left col-sm-offset-2">
							<h4>
								<b>病人年龄 ：</b>
							</h4>
						</div>
						<div class="col-sm-7 text-left">
							<h4>31岁</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 text-left col-sm-offset-2">
							<h4>
								<b>身份证号 ：</b>
							</h4>
						</div>
						<div class="col-sm-7 text-left">
							<h4>342443299837650032</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 text-left col-sm-offset-2">
							<h4>
								<b>家庭地址 ：</b>
							</h4>
						</div>
						<div class="col-sm-6 text-left">
							<p class="h4">阳光小区98号</p>
						</div>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- Modal End -->
	
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