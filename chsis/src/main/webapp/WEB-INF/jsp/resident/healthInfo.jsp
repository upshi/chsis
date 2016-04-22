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
							常规健康信息 
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<div class="infoList">
							<span><b>身高：</b>${resident.height }</span> 
							<span><b>体重：</b>${resident.weight }</span> 
							<span>
								<b>视力：</b> 
								<b id="eyesightCode" eyesightCode="${resident.eyesight }"></b>
							</span> 
							<span>
								<b>血型：</b>
								<c:if test="${resident.bloodType==0 }">A-型</c:if>
								<c:if test="${resident.bloodType==1 }">B-型</c:if>
								<c:if test="${resident.bloodType==2 }">AB-型</c:if>
								<c:if test="${resident.bloodType==3 }">O-型</c:if>
							</span>
							<button class="btn btn-success btn-edit-commonHealthInfo">修改</button>
						</div>
					</div>
				</div>
				<!-- panel end -->
				
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							疾病史信息 
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<table class="table table-bordered table-responsive table-hover">
							<tr class="info">
								<th>疾病名称</th>
								<th>疾病类型</th>
								<th>开始时间</th>
								<th>痊愈时间</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${diseaseHistories }" var="diseaseHistory">
								<tr>
									<td>${diseaseHistory.name }</td>
									<td>
										<c:if test="${diseaseHistory.type==0 }">遗传病史</c:if>
										<c:if test="${diseaseHistory.type==1 }">重大疾病史</c:if>
										<c:if test="${diseaseHistory.type==2 }">手术史</c:if>
										<c:if test="${diseaseHistory.type==3 }">过敏史</c:if>
									</td>
									<td>${diseaseHistory.startTime }</td>
									<td>${diseaseHistory.endTime }</td>
									<td>
										<button class="btn btn-primary btn-sm btn-diseaseHistoryDetail" uuid="${diseaseHistory.uuid }">详情</button> 
									</td>
								</tr>
							</c:forEach>	
						</table>
						<button class="btn btn-warning btn-add-diseaseHistory">添加疾病史</button>
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
	<script src="assets/js/resident/dropDownList.js"></script>
	<script src="assets/js/resident/healthInfo.js"></script>

	<!-- Modal Start -->
	<div class="modal fade" id="editCommonHealthInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/doctor.png" alt="医生图标" style="height: 20px; width: 20px;" /> 修改常规健康信息
					</h4>
				</div>
				<div class="modal-body row">
					<form class="form-horizontal" method="POST" action="resident/edit">
						<input id="residentUuid" type="hidden" name="uuid" value="${resident.uuid }">
						<div class="row container">
							<div class="form-group" id="editdis-heightGroup">
								<label class="col-sm-2 control-label">身高</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editdis-height" class="form-control" name="height" type="text" placeholder="身高(cm)" value="${resident.height }">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="editdis-weightGroup">
								<label class="col-sm-2 control-label">体重</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editdis-weight" class="form-control" name="weight" type="text" placeholder="体重(kg)" value="${resident.weight }">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="editdis-leftEyesightGroup">
								<label class="col-sm-2 control-label">左眼视力</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editdis-leftEyesight" class="form-control" name="leftEyesight" type="text" placeholder="左眼视力">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="editdis-rightEyesightGroup">
								<label class="col-sm-2 control-label">右眼视力</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editdis-rightEyesight" class="form-control" name="rightEyesight" type="text" placeholder="右眼视力">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-offset-4">
							<div class="blank"></div>
							<button class="btn btn-info" id="editdis-submit">保存</button>
							<button class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- Modal End -->
	
	<!-- Modal Start -->
	<div class="modal fade" id="diseaseHistoryDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/doctor.png" alt="医生图标" style="height: 20px; width: 20px;" /> 疾病史
					</h4>
				</div>
				<div class="modal-body container col-sm-12">
					<div class="row">
						<div class="col-sm-5 text-right">
							<h5>
								<b>疾病名称：</b>
							</h5>
						</div>
						<div class="col-sm-7 text-left">
							<h5 id="diseaseHistory-name"></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-5 text-right">
							<h5>
								<b>疾病类型：</b>
							</h5>
						</div>
						<div class="col-sm-7 text-left">
							<h5 id="diseaseHistory-type"></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-5 text-right">
							<h5>
								<b>开始时间：</b>
							</h5>
						</div>
						<div class="col-sm-7 text-left">
							<h5 id="diseaseHistory-startTime"></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-5 text-right">
							<h5>
								<b>痊愈时间：</b>
							</h5>
						</div>
						<div class="col-sm-7 text-left">
							<h5 id="diseaseHistory-endTime"></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-5 text-right">
							<h5>
								<b>病情描述：</b>
							</h5>
						</div>
						<div class="col-sm-7 text-left">
							<h5 id="diseaseHistory-description"></h5>
						</div>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- Modal End -->
	
	<!--  Modal Start -->
	<div class="modal fade" id="addDiseaseHistory" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/doctor.png" alt="医生图标" style="height: 20px; width: 20px;" /> 添加疾病史
					</h4>
				</div>
				<div class="modal-body row">
					<form class="form-horizontal" method="POST" action="resident/addDiseaseHistory">
						<input id="patientUuid" name="patientUuid" type="hidden" value="${resident.uuid }">
						<div class="row container">
							<div class="form-group" id="adddis-nameGroup">
								<label class="col-sm-2 control-label">疾病名称</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="adddis-name" class="form-control" name="name" type="text" placeholder="疾病名称">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddis-typeGroup">
								<label class="col-sm-2 control-label">疾病类型</label>
								<div class="col-sm-3">
									<select id="diseaseHistory" name="type" class="form-control"></select>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddis-startTimeGroup">
								<label class="col-sm-2 control-label">开始时间</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="adddis-startTime" class="form-control" name="startTime" type="text" placeholder="开始时间:如：2015-12-01">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddis-endTimeGroup">
								<label class="col-sm-2 control-label">痊愈时间</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="adddis-endTime" class="form-control" name="endTime" type="text" placeholder="痊愈时间，如：2016-12-01">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="addis-descriptionGroup">
								<label class="col-sm-2 control-label">病情描述</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<textarea id="adddis-description" class="form-control" name="description" rows="5" placeholder="请输入病情描述"></textarea>
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-offset-5">
							<button class="btn btn-info" id="adddis-submit">保存</button>
							<button class="btn btn-default">取消</button>
						</div>
					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- Modal End -->
			
</body>
</html>
