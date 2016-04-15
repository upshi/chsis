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

			<!--body wrapper start-->
			<div class="wrapper">
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">科室详情</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<section class="panel col-sm-3">
								<header class="panel-heading">
									<b>科室编号：</b>d_001
								</header>
								<header class="panel-heading">
									<b>科室名称：</b>外科
								</header>
								<header class="panel-heading">
									<b>所属医院：</b>李惠利医院
								</header>
						
								<header class="panel-heading">
									<b>科室描述：</b>
								</header>
								<div class="panel-body">
									<p>这个科室医疗器械充足，医生来源可靠，医生水平高，医德高，护士服务到位。医院环境干净卫生，虽然是新成立的医院，但是发展前景非常好。</p>
								</div>
							</section>
							<div class="panel col-sm-9">
								<div class="panel-heading">
									<h3 class="panel-title">
										医生信息 
										<span class="tools pull-right"> 
											<button class="btn btn-warning pull-left" data-toggle="modal" data-target="#addDoctor">添加医生</button>
										</span>
									</h3>
								</div>
								<div class="panel-body">
									<table class="table table-bordered table-responsive table-hover">
										<tr class="info">
											<th>用户名</th>
											<th>密码</th>
											<th>编号</th>
											<th>姓名</th>
											<th>电话</th>
											<th>学历</th>
											<th>职称</th>
											<th>操作</th>
										</tr>
										<tr>
											<td>ranran</td>
											<td>12121</td>
											<td>d001</td>
											<td>王文静</td>
											<td>18394338773</td>
											<td>本科</td>
											<td>主任医师</td>
											<td>
												<button class="btn btn-danger btn-sm">删除</button> 
												<button class="btn btn-default btn-sm" data-toggle="modal" data-target="#doctor1">详情</button>
											</td>
										</tr>
										<tr>
											<td>ranran</td>
											<td>12121</td>
											<td>d001</td>
											<td>王文静</td>
											<td>18394338773</td>
											<td>本科</td>
											<td>主任医师</td>
											<td>
												<button class="btn btn-danger btn-sm">删除</button> 
												<button class="btn btn-default btn-sm">详情</button>
											</td>
										</tr>
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
						</div>
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
	<div class="modal fade" id="changeDepartmentInfo" tabindex="-1" role="dialog">
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
							<button class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End -->
	
	<!-- Modal Start -->
	<div class="modal fade" id="addDoctor" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">添加医生</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" class="department">
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="用户名">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-2 control-label">密码</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="密码">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-2 control-label">医生编号</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="医生编号">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-2 control-label">姓名</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="姓名">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-2 control-label">照片</label>
								<div class="col-sm-3">
									<input type="file" name="photo" style="margin-top: 7px;">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-2 control-label">性别</label>
								<div class="col-sm-3">
									<label class="radio-inline"> <input type="radio" name="inlineRadioOptions" id="male" value="male" checked> 男
									</label> <label class="radio-inline"> <input type="radio" name="inlineRadioOptions" id="female" value="female"> 女
									</label>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-2 control-label">电话</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="电话">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-2 control-label">学历</label>
								<div class="col-sm-3">
									<select id="diploma" class="form-control"></select>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-2 control-label">职称</label>
								<div class="col-sm-3">
									<select id="title" class="form-control"></select>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-2 control-label">医生描述</label>
								<div class="col-sm-3">
									<textarea class="form-control" rows="5">这个科室医疗器械充足，医生来源可靠，医生水平高，医德高，护士服务到位。医院环境干净卫生，虽然是新成立的医院，但是发展前景非常好。
                                </textarea>
								</div>
							</div>
						</div>
						<div class="col-sm-offset-4">
							<button class="btn btn-info">保存</button>
							<button class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End -->
	
	<!-- Modal Start -->
	<div class="modal fade" id="doctor1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/doctor.png" alt="医生图标" style="height: 20px; width: 20px;" /> 查看医生信息
					</h4>
				</div>
				<div class="modal-body row">
					<div class="col-sm-3">
						<img src="assets/image/doctorImg.jpg" alt="医生照片" style="height: auto; width: 150px;" />
					</div>
					<div class="col-sm-8 col-sm-offset-1">
						<session class="panel">
							<header class="panel-heading">
								编号 ：NO.001_112
							</header>
							<header class="panel-heading">
								姓名 ：李惠利
							</header>
							<header class="panel-heading">
								电话 ：18394338773
							</header>
							<header class="panel-heading">
								学历：硕士
							</header>
							<header class="panel-heading">
								科室 ：外科
							</header>
						</session>
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

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
	<script src="assets/js/hospitalManager/util.js"></script>
	
    
</body>
</html>