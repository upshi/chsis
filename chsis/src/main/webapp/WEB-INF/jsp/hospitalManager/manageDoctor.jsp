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
						<form class="form-inline" action="doctor/search">
		                    <input name="number" class="form-control" type="text" placeholder="请输入医生编号">
		                    <input name="name" class="form-control" type="text" placeholder="请输入医生姓名">
		                    <input name="departmentName" class="form-control" type="text" placeholder="请输入科室名称">
		                    <button class="btn btn-info">搜索</button>
		                </form>
		                <div class="blank"></div>
		                <table class="table table-bordered table-responsive table-hover">
		                    <tr class="info">
		                        <th>编号</th>
		                        <th>姓名</th>
		                        <th>所在科室</th>
		                        <th>电话</th>
		                        <th>学历</th>
		                        <th>职称</th>
		                        <th>操作</th>
		                    </tr>
		                    <c:forEach items="${doctors }" var="doctor">
			                    <tr>
			                        <td>${doctor.number }</td>
			                        <td>${doctor.name }</td>
			                        <td>${doctor.department.name }</td>
			                        <td>${doctor.phone }</td>
			                        <td>${doctor.diploma }</td>
			                        <td>${doctor.title }</td>
			                        <td>
			                            <button class="btn btn-danger btn-sm">删除</button>
			                            <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#doctor1">详情</button>
			                        </td>
			                    </tr>
		                    </c:forEach>
		                </table>
		                <div>查询到${totals }条记录/共${totalPages }页</div>
						<!-- pagination start -->
						<%@include file="/include/page.jsp" %>
						<!-- pagination end -->
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
					<form class="form-horizontal" method="POST" action="doctor/addDoctor" enctype="multipart/form-data">
						<div class="row container">
							<div class="form-group" id="adddoc-userNameGroup">
								<label class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="adddoc-userName" class="form-control" name="userName" type="text" placeholder="用户名">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddoc-passwordGroup">
								<label class="col-sm-2 control-label">密码</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="adddoc-password" class="form-control" name="password" type="password" placeholder="密码">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddoc-numberGroup">
								<label class="col-sm-2 control-label">医生编号</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="adddoc-number" class="form-control" name="number" type="text" placeholder="医生编号">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddoc-nameGroup">
								<label class="col-sm-2 control-label">医生姓名</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="adddoc-name" class="form-control" name="name" type="text" placeholder="医生姓名">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddoc-imgGroup">
								<label class="col-sm-2 control-label">医生照片</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input type="file" id="input-id" name="file_data" />
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddoc-sexGroup">
								<label class="col-sm-2 control-label">医生性别</label>
								<div class="col-sm-3 text-left">
									<div class="iconic-input right">
										<label class="radio-inline"> 
											<input type="radio" name="sex" checked id="male" value="0"> 男
										</label> 
										<label class="radio-inline"> 
											<input type="radio" name="sex" id="female" value="1"> 女
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddoc-phoneGroup">
								<label class="col-sm-2 control-label">电话</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="adddoc-phone" class="form-control" name="phone" type="text" placeholder="电话">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddoc-diplomaGroup">
								<label class="col-sm-2 control-label">学历</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<select id="diploma" name="diploma" class="form-control"></select>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddoc-titleGroup">
								<label class="col-sm-2 control-label">职称</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<select id="title" name="title" class="form-control"></select>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddoc-titleGroup">
								<label class="col-sm-2 control-label">选择科室</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<select id="departmentType" name="departmentType" class="form-control"></select>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddoc-descriptionGroup">
								<label class="col-sm-2 control-label">医生描述</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<textarea id="adddoc-description" class="form-control" name="description" rows="5" placeholder="请输入对医生的描述信息"></textarea>
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-offset-4">
							<button class="btn btn-info adddoc-submit">保存</button>
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
	<script src="assets/js/hospitalManager/dropDownList.js"></script>
	
</body>
</html>