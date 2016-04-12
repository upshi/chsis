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

			<div class="page-heading"> 
				<button class="btn btn-success" data-toggle="modal" data-target="#addHospital">添加医院</button> 
			</div>
			
			<!--body wrapper start-->
			<div class="wrapper">
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							医院信息 <span class="tools pull-right"> <a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-sm-4 col-sm-offset-1">
								<h4>
									<b>医院编号：</b>h_001
								</h4>
							</div>
							<div class="col-sm-5">
								<h4>
									<b>医院名称：</b>李惠利医院
								</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-2 col-sm-offset-1">
								<h4>
									<b>医院地址：</b>
								</h4>
							</div>
							<div class="col-sm-8">
								<h4>江苏省南京市栖霞区江南路平林路123号</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-2 col-sm-offset-1">
								<h4>
									<b>医院描述：</b>
								</h4>
							</div>
							<div class="col-sm-8">
								<h4>医院描述的机会的哈哈回到家后的受打击换房间换话费地级市附近的海景房的好时机风景好 风华绝代神烦大叔 涸鲋得水付款是否恢复独守空房佛山市房防守打法。</h4>
							</div>
						</div>
				
						
						<h2 class="t-due">
							医院管理员信息&nbsp;
							<button class="btn btn-warning" data-toggle="modal" data-target="#addHospitalManager">添加医院管理员</button>
						</h2>
						<table class="table table-bordered table-responsive table-hover">
							<tr class="info">
								<th>用户名</th>
								<th>密码</th>
								<th>姓名</th>
								<th>电话</th>
								<th>操作</th>
							</tr>
							<tr>
								<td>ranran</td>
								<td>123456</td>
								<td>王文静</td>
								<td>18394338773</td>
								<td>
									<button class="btn btn-danger btn-sm deleteHospitalManager">删除</button>
									<button class="btn btn-info btn-sm" data-target="#hospitalManagerDetail" data-toggle="modal">修改</button> 
								</td>
							</tr>
							<tr>
								<td>ranran</td>
								<td>123456</td>
								<td>王文静</td>
								<td>18394338773</td>
								<td>
									<button class="btn btn-danger btn-sm deleteHospitalManager">删除</button>
									<button class="btn btn-info btn-sm">修改</button> 
								</td>
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
    <script src="assets/js/jquery-confirm.js"></script>
    <script src="assets/js/manager/dropDownList.js"></script>
    <script src="assets/js/manager/util.js"></script>
    
    <!-- Modal Start -->
		<div class="modal fade" id="addHospital" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">添加医院</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal">
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label">医院编号</label>
									<div class="col-sm-3">
										<input class="form-control" type="text" placeholder="医院编号">
									</div>
								</div>
							</div>
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label">医院名称</label>
									<div class="col-sm-3">
										<input class="form-control" type="text" placeholder="医院名称">
									</div>
								</div>
							</div>
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label">医院地址</label>
									<div class="col-sm-3">
										<input class="form-control" type="text" placeholder="医院地址">
									</div>
								</div>
							</div>
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label">医院描述</label>
									<div class="col-sm-3">
										<textarea class="form-control" rows="5">这家医院医疗器械充足，医生来源可靠，医生水平高，医德高，护士服务到位。医院环境干净卫生，虽然是新成立的医院，但是发展前景非常好。
                                                </textarea>
									</div>
								</div>
							</div>
							<div class="col-sm-offset-5">
								<button class="btn btn-success deleteHospital">保存</button>
								<button class="btn btn-default">取消</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal End -->
		
		<!-- Modal Start -->
		<div class="modal fade" id="addHospitalManager" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">添加医院管理员</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal">
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
									<label class="col-sm-2 control-label">姓名</label>
									<div class="col-sm-3">
										<input class="form-control" type="text" placeholder="姓名">
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
								<div class="col-sm-offset-2">
									<button class="btn btn-success deleteHospital">保存</button>
									<button class="btn btn-default">取消</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal End -->
		
		<!-- Modal Start -->
		<div class="modal fade" id="hospitalManagerDetail" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">修改医院管理员信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
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
								<label class="col-sm-2 control-label">姓名</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="姓名">
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
						<div class="col-sm-offset-5">
							<button class="btn btn-success deleteHospital">保存</button>
							<button class="btn btn-default">取消</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End -->
	
</body>
</html>
