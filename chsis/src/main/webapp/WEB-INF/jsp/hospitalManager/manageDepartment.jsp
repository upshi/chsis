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
<link href="assets/css/hospitalManager/index.css" rel="stylesheet">

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
			
			<div class="page-heading"> 
				<button class="btn btn-warning btn-add-department" data-toggle="modal" data-target="#addDepartment">添加科室</button>
			</div>

			<!--body wrapper start-->
			<div class="wrapper">
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							科室管理
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" action="">
							<input class="form-control" type="text" placeholder="按科室编号搜索"> 
							<input class="form-control" type="text" placeholder="按科室名称搜索">
							<button class="btn btn-info">搜索</button>
						</form>
						<div class="blank"></div>
						<table class="table table-bordered table-responsive table-hover">
							<tr>
								<th colspan="4">科室信息</th>
							</tr>
							<tr class="info">
								<th>科室编号</th>
								<th>科室名称</th>
								<th>所属医院</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${departments }" var="department">
								<tr>
									<td>${department.number }</td>
									<td>${department.name }</td>
									<td>${department.hospital.name }</td>
									<td>
										<buttun class="btn btn-danger btn-sm">删除</buttun> 
										<a href="hospitalManager/departmentDetail.jsp" class="btn btn-primary btn-sm">详情</a>
									</td>
								</tr>
							</c:forEach>
						</table>

						<!-- pagination start -->
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
	
	<!-- Modal Start -->
	<div class="modal fade" id="addDepartment" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">添加科室</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-2 control-label">科室编号</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="科室编号">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-2 control-label">科室名称</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="科室名称">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-2 control-label">所属医院</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="所属医院">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-2 control-label">科室描述</label>
								<div class="col-sm-3">
									<textarea class="form-control" rows="5">这个科室医疗器械充足，医生来源可靠，医生水平高，医德高，护士服务到位。医院环境干净卫生，虽然是新成立的医院，但是发展前景非常好。
                                </textarea>
								</div>
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
	
	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="assets/adminex/js/jquery-1.10.2.min.js"></script>
	<script src="assets/adminex/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="assets/adminex/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/adminex/js/bootstrap.min.js"></script>
	<script src="assets/adminex/js/modernizr.min.js"></script>
	<script src="assets/adminex/js/jquery.nicescroll.js"></script>

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>

</body>
</html>
