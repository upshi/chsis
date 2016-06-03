<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<!--pickers css-->
<link rel="stylesheet" type="text/css" href="assets/adminex/js/bootstrap-datepicker/css/datepicker-custom.css" />

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
				<div class="row container">
					<div class="form-group">
						<div class="col-sm-2">
							<div id="selectDiv">
								<select id="initSelect" class="form-control diseaseTypeSelect" name="disease"></select>
							</div>
							<input id="adddis-startTime" class="form-control default-date-picker" type="text" name="startTime" value="" readonly="readonly" />
						</div>
					</div>
				</div>
				<div class="col-sm-offset-4">
					<button uuid="${medicalRecord.uuid }" class="btn btn-info" id="submit">确定</button>
				</div>
				<div id="main" style="height: 400px"></div><div id="main" style="height: 400px"></div>
			</div>
			<!--body wrapper end-->

			<!--footer section start-->
			<%@ include file="/include/footer.jsp"%>
			<!--footer section end-->
		</div>
		<!-- main content end-->
	</section>

	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="assets/adminex/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="assets/adminex/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/adminex/js/bootstrap.min.js"></script>
	<script src="assets/adminex/js/modernizr.min.js"></script>
	<script src="assets/adminex/js/jquery.nicescroll.js"></script>
	<script src="assets/js/doctor/dropDownList.js"></script>

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
	<script src="assets/echarts/echarts.js"></script>
	<!--pickers plugins-->
	<script type="text/javascript" src="assets/adminex/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="assets/adminex/js/bootstrap-datepicker/js/bootstrap-datepicker.zh-CN.js" charset="UTF-8"></script>
	
	<script src="assets/js/statistics/singleDisease.js"></script>
	
	<script>
		$(function(){
			/* 导航颜色 */
			$("#navi_singleDisease").addClass('active');
		});	
	</script>
</body>
</html>