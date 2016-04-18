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

			<div class="page-heading"> 
				<button class="btn btn-warning btn-add-doctor" data-toggle="modal" data-target="#addDoctor">添加医生</button> 
			</div>
			
			<!--body wrapper start-->
			<div class="wrapper">
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							医生管理
						 	<span class="tools pull-right"> 
						 		<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" action="">
		                    <input class="form-control" type="text" placeholder="按医生编号搜索">
		                    <input class="form-control" type="text" placeholder="按医生姓名搜索">
		                    <input class="form-control" type="text" placeholder="按所在科室搜索">
		                    <button class="btn btn-info">搜索</button>
		                </form>
		                <div class="blank"></div>
		                <table class="table table-bordered table-responsive table-hover">
		                    <tr><th colspan="9">医生信息</th></tr>
		                    <tr class="info">
		                        <th>用户名</th>
		                        <th>密码</th>
		                        <th>编号</th>
		                        <th>姓名</th>
		                        <th>所在科室</th>
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
		                        <td>外科</td>
		                        <td>18394338773</td>
		                        <td>本科</td>
		                        <td>主任医师</td>
		                        <td>
		                            <button class="btn btn-danger btn-sm">删除</button>
		                            <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#doctor1">详情</button>
		                        </td>
		                    </tr>
		                </table>
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
								<label class="col-sm-2 control-label">选择科室</label>
								<div class="col-sm-3">
									<select id="department" class="form-control">
										<option value="">外科</option>
										<option value="">内科</option>
										<option value="">儿科</option>
										<option value="">精神科</option>
										<option value="">妇产科</option>
									</select>
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
							<button class="btn btn-default">取消</button>
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
						<img src="assets/image/doctor.png" alt="医生图标" style="height: 20px; width: 20px;" /> 医生信息
					</h4>
				</div>
				<div class="modal-body row">
					<div class="col-sm-3">
						<img src="assets/image/doctorImg.jpg" alt="医生照片" style="height: auto; width: 150px;" />
					</div>
					<div class="col-sm-9">
						<div class="row container">
							<div class="col-sm-1">
								<h4>
									<b>编号 ：</b>
								</h4>
							</div>
							<div class="col-sm-1">
								<h4>NO.001_112</h4>
							</div>
						</div>
						<div class="row container">
							<div class="col-sm-1">
								<h4>
									<b>姓名 ：</b>
								</h4>
							</div>
							<div class="col-sm-1">
								<h4>李惠利</h4>
							</div>
						</div>
						<div class="row container">
							<div class="col-sm-1">
								<h4>
									<b>电话 ：</b>
								</h4>
							</div>
							<div class="col-sm-1">
								<h4>18394338773</h4>
							</div>
						</div>
						<div class="row container">
							<div class="col-sm-1">
								<h4>
									<b>学历 ：</b>
								</h4>
							</div>
							<div class="col-sm-1">
								<h4>硕士</h4>
							</div>
						</div>
						<div class="row container">
							<div class="col-sm-1">
								<h4>
									<b>科室 ：</b>
								</h4>
							</div>
							<div class="col-sm-1">
								<h4>外科</h4>
							</div>
						</div>
						<div class="row container">
							<div class="col-sm-1">
								<h4>
									<b>描述 ：</b>
								</h4>
							</div>
							<div class="col-sm-3">
								<p>李惠利医生认真负责，临床经验丰富，对外科有独到的见解和认识， 治疗各种疾病。药到病除，让患者摆脱疾病的困扰。</p>
							</div>
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

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
	<script src="assets/js/hospitalManager/util.js"></script>
	
</body>
</html>