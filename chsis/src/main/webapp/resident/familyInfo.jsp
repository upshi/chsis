<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<link href="assets/css/jquery-confirm.css" rel="stylesheet">
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
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							家庭成员信息
							<span class="tools pull-right">
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<table class="table table-bordered table-responsive table-hover">
							<tr class="info">
								<th>姓名</th>
								<th>年龄</th>
								<th>电话</th>
								<th>疾病信息</th>
								<th>体检记录</th>
								<th>就诊记录</th>
								<th>操作</th>
							</tr>
							<tr>
								<td>张三</td>
								<td>22</td>
								<td>18493228776</td>
								<td><a data-toggle="modal" id="aaa">疾病史</a></td>
								<td><a data-toggle="modal" data-target="#healthRecord">体检记录</a></td>
								<td><a href="resident/medicalRecordDetail.jsp">就诊记录</a></td>
								<td>
									<button class="btn btn-danger btn-sm deleteMember">删除</button> 
									<button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#memberInfoDetail">详情</button> 
								</td>
							</tr>
							<tr>
								<td>张三</td>
								<td>22</td>
								<td>18493228776</td>
								<td>疾病史</td>
								<td>体检记录</td>
								<td>就诊记录</td>
								<td>
									<button class="btn btn-danger btn-sm deleteMember">删除</button> 
									<button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#memberInfoDetail">详情</button> 
								</td>
							</tr>
						</table>

					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							家庭基本信息
							<span class="tools pull-right">
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<table class="table table-bordered table-responsive table-hover">
							<tr class="info">
								<th>户主</th>
								<th>家庭电话</th>
								<th>家庭地址</th>
								<th>所在社区</th>
								<th>操作</th>
							</tr>
							<tr>
								<td>张三</td>
								<td>1865348492</td>
								<td>南京市栖霞区进取村153号</td>
								<td>南京市栖霞区阳光小区</td>
								<td>
									<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#familyInfo">修改</button> 
								</td>
							</tr>
						</table>
					</div>
				</div>
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
	<script src="assets/js/jquery-confirm.js"></script>

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
	<script src="assets/js/resident/util.js"></script>
	<script>
		$('#aaa').on('click', function() {
			$('#medicalHistory').modal();
		})
	</script>

	<!-- Modal Start-->
	<div class="modal fade" id="medicalHistory" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
				<div class="modal-body row">
					<div class="col-sm-12">
						<table class="table table-responsive table-hover">
							<tr>
								<th>疾病名称</th>
								<th>疾病类型</th>
								<th>开始时间</th>
								<th>痊愈时间</th>
							</tr>
							<tr>
								<td>白血病</td>
								<td>遗传病</td>
								<td>1993/12/02</td>
								<td>--</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End-->

	<!-- Modal Start-->
	<div class="modal fade" id="healthRecord" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/doctor.png" alt="医生图标" style="height: 20px; width: 20px;" /> 体检记录
					</h4>
				</div>
				<div class="modal-body row">
					<div class="col-sm-12">
						<table class="table table-responsive table-hover">
							<tr>
								<th>报告名称</th>
								<th>诊察时间</th>
								<th>体检医院</th>
								<th>病情描述</th>
							</tr>
							<tr>
								<td>检查报告1</td>
								<td>2016.03.22</td>
								<td><a data-toggle="modal" data-target="#hospital">李惠利医院</a> <!-- Modal -->
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
									</div></td>
								<td><span data-toggle="tooltip" data-placement="top" title="没有不良反应，注意饮食清淡，多吃水果，注意休息。">没有不良反应...</span></td>
							</tr>
							<tr>
								<td>检查报告2</td>
								<td>2015.03.30</td>
								<td><a href="#">华佗医院</a></td>
								<td>常规检查，轻微感冒</td>
							</tr>
							<tr>
								<td>检查报告2</td>
								<td>2015.03.30</td>
								<td><a href="#">华佗医院</a></td>
								<td>常规检查，轻微感冒</td>
							</tr>
							<tr>
								<td>检查报告2</td>
								<td>2015.03.30</td>
								<td><a href="#">华佗医院</a></td>
								<td>常规检查，轻微感冒</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- Modal End-->
	
	<!-- Modal Start-->
	<div class="modal fade" id="memberInfoDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/doctor.png" alt="医生图标" style="height: 20px; width: 20px;" /> 家庭成员信息
					</h4>
				</div>
				<div class="modal-body container">
					<div class="infoList">
						<span><b>居民姓名：</b>d_001</span> <span><b>居民性别：</b>男</span>
					</div>
					<div class="infoList">
						<span><b>身份证号：</b>329444199312091624</span>
					</div>
					<div class="infoList">
						<span><b>所属民族：</b>汉族</span> <span><b>出生日期：</b>1993/12/01</span>
					</div>
					<div class="infoList">
						<span><b>居民年龄：</b>22岁</span> <span><b>年龄分段：</b>青年</span>
					</div>
					<div class="infoList">
						<span><b>联系电话：</b>18394338773</span> <span><b>婚姻状况：</b>未婚</span>
					</div>
					<div class="infoList">
						<span><b>身高：</b>183cm</span> <span><b>体重：</b>87kg</span>
					</div>
					<div class="infoList">
						<span><b>视力：</b>《左眼2.1，右眼2.5》</span> <span><b>血型：</b>A型</span>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- Modal End-->
	
	<!-- Modal Start-->
	<div class="modal fade" id="familyInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/doctor.png" alt="医生图标" style="height: 20px; width: 20px;" /> 修改家庭信息
					</h4>
				</div>
				<div class="modal-body row">
					<form class="form-horizontal">
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">家庭电话</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="家庭电话" value="0512-8652211">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">家庭地址</label>

								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="家庭地址" value="南京市栖霞区进取村153号">
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">所在社区</label>
								<div class="col-sm-3">
									<input class="form-control" type="text" placeholder="所在社区" value="南京市栖霞区阳光小区">
								</div>
							</div>
						</div>
						<div class="col-sm-offset-5">
							<button class="btn btn-success">保存</button>
							<button class="btn btn-default">取消</button>
						</div>
				
					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- Modal End-->

</body>
</html>