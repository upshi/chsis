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
<link href="assets/css/jquery-confirm.css" rel="stylesheet">
<link href="assets/css/manager/index.css" rel="stylesheet">
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
							管理居民
							 <span class="tools pull-right"> 
							 	<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" action="">
	                    	<input class="form-control" type="text" placeholder="按姓名搜索">
	                    	<input class="form-control" type="text" placeholder="按家庭编号搜索">
	                   	 	<input class="form-control" type="text" placeholder="按身份证号搜索">
	                    	<button class="btn btn-info">搜索</button>
                		</form>
               			<div class="blank"></div>

						<table class="table table-bordered table-responsive table-hover">
							<tr class="info">
								<th>用户名</th>
								<th>姓名</th>
								<th>性别</th>
								<th>身份证号</th>
								<th>电话</th>
								<th>家庭编号</th>
								<th>操作</th>
							</tr>
							<tr>
								<td><a href="#">ranran</a></td>
								<td>王文静</td>
								<td>女</td>
								<td>328333118738221192</td>
								<td>18392228223</td>
								<td><a href="#">f001</a></td>
								<td>
									<button class="btn btn-danger btn-sm deleteResident">删除</button>
									<button class="btn btn-primary btn-sm" data-target="#residentInfo" data-toggle="modal">详情</button>
									<button class="btn btn-info btn-sm" data-toggle="modal" data-target="#residentChange">修改</button>
								</td>
							</tr>
							<tr>
								<td><a href="#">ranran</a></td>
								<td>王文静</td>
								<td>女</td>
								<td>328333118738221192</td>
								<td>18392228223</td>
								<td><a href="#">f001</a></td>
								<td>
									<button class="btn btn-danger btn-sm deleteResident">删除</button>
									<button class="btn btn-primary btn-sm">详情</button>
									<button class="btn btn-info btn-sm">修改</button>
								</td>
							</tr>
							<tr>
								<td><a href="#">ranran</a></td>
								<td>王文静</td>
								<td>女</td>
								<td>328333118738221192</td>
								<td>18392228223</td>
								<td><a href="#">f001</a></td>
								<td>
									<button class="btn btn-danger btn-sm deleteResident">删除</button>
									<button class="btn btn-primary btn-sm">详情</button>
									<button class="btn btn-info btn-sm">修改</button>
								</td>
							</tr>
							<tr>
								<td><a href="#">ranran</a></td>
								<td>王文静</td>
								<td>女</td>
								<td>328333118738221192</td>
								<td>18392228223</td>
								<td><a href="#">f001</a></td>
								<td>
									<button class="btn btn-danger btn-sm deleteResident">删除</button>
									<button class="btn btn-primary btn-sm">详情</button>
									<button class="btn btn-info btn-sm">修改</button>
								</td>
							</tr>
						</table>
						
						<!-- pagination start -->
						<nav class="col-sm-4 col-sm-offset-4">
							<ul class="pagination ">
								<li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<li class="active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
						<!-- pagination end -->
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
    <script src="assets/js/jquery-confirm.js"></script>
    <script src="assets/js/manager/dropDownList.js"></script>
    <script src="assets/js/manager/util.js"></script>

    
    <!-- Modal Start -->
	<div class="modal fade" id="residentInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/doctor.png" alt="医生图标" style="height: 20px; width: 20px;" /> 居民基本信息
					</h4>
				</div>
				<div class="modal-body container col-sm-12">
					<div class="row">
						<div class="col-sm-3">
							<h4>
								<b>居民姓名：</b>
							</h4>
						</div>
						<div class="col-sm-2 text-left">
							<h4>d_001</h4>
						</div>
						<div class="col-sm-3">
							<h4>
								<b>居民性别：</b>
							</h4>
						</div>
						<div class="col-sm-2 text-left">
							<h4>男</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<h4>
								<b>身份证号：</b>
							</h4>
						</div>
						<div class="col-sm-4 text-left">
							<h4>329444199312091624</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<h4>
								<b>所属民族：</b>
							</h4>
						</div>
						<div class="col-sm-2 text-left">
							<h4>汉族</h4>
						</div>
						<div class="col-sm-3">
							<h4>
								<b>出生日期：</b>
							</h4>
						</div>
						<div class="col-sm-2 text-left">
							<h4>1993/12/01</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<h4>
								<b>居民年龄：</b>
							</h4>
						</div>
						<div class="col-sm-2 text-left">
							<h4>22岁</h4>
						</div>
						<div class="col-sm-3">
							<h4>
								<b>年龄分段：</b>
							</h4>
						</div>
						<div class="col-sm-2 text-left">
							<h4>青年</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<h4>
								<b>联系电话：</b>
							</h4>
						</div>
						<div class="col-sm-3 text-left">
							<h4>18394338773</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<h4>
								<b>婚姻状况：</b>
							</h4>
						</div>
						<div class="col-sm-2 text-left">
							<h4>未婚</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<h4>
								<b>家庭编号：</b>
							</h4>
						</div>
						<div class="col-sm-5 text-left">
							<h4>f_001</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<h4>
								<b>家庭电话：</b>
							</h4>
						</div>
						<div class="col-sm-5 text-left">
							<h4>0512-12349866</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<h4>
								<b>家庭地址：</b>
							</h4>
						</div>
						<div class="col-sm-8 text-left">
							<h4>江苏省南京市栖霞区进取村仁爱小区113号</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<h4>
								<b>所在社区：</b>
							</h4>
						</div>
						<div class="col-sm-3 text-left">
							<h4>阳光社区</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<h4>
								<b>社区地址：</b>
							</h4>
						</div>
						<div class="col-sm-8 text-left">
							<h4>江苏省南京市栖霞区进取村</h4>
						</div>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- Modal End -->
	
	<!-- Modal Start -->
	<div class="modal fade" id="residentChange" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/doctor.png" alt="医生图标" style="height: 20px; width: 20px;" /> 修改居民信息
					</h4>
				</div>
				<div class="modal-body row">
					<form class="form-horizontal">
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">居民姓名</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="居民姓名" value="王豫宁">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">居民性别</label>
								<div class="col-sm-3 text-left">
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
									<input class="form-control" type="text" placeholder="身份证号" value="3294332199312031127">
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
									<input class="form-control" type="text" placeholder="出生日期，如：19931201" value="19931201">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">居民年龄</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="居民年龄" value="23">
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
									<input class="form-control" type="text" placeholder="联系电话" value="18222993338">
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
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">家庭编号</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="家庭编号">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">家庭电话</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="家庭电话">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">家庭地址</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="家庭地址">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">所在社区</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="所在社区">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">社区地址</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="社区地址">
								</div>
							</div>
						</div>
						<button class="btn btn-info">保存</button>
						<button class="btn btn-default">取消</button>
					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- Modal End -->
</body>
</html>