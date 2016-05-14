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
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="shortcut icon" href="assets/image/favicon.ico" type="image/png">
	<link href="assets/css/chsis/bootstrap.css" rel="stylesheet" type="text/css" media="all">
	<link href="assets/css/chsis/animate.css" rel="stylesheet" type="text/css" media="all">
	<link href="assets/css/chsis/style.css" rel="stylesheet" type="text/css" media="all"/>
	<link href="assets/css/chsis/header-footer.css" rel="stylesheet" type="text/css" media="all"/>
	<title>社区健康信息服务系统</title>
</head>
<body>
	<!--header start here-->
	<%@ include file="/include/chsis/header.jsp"%>
	<!--header end here-->

	<!--contact start here-->
	<div class="contact">
		<div class="container">
			<div class="contact-main">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
							<h4 class="modal-title text-left">
							<img src="assets/image/chsis/doctor.png" alt="医生图标" style="height:20px;width: 20px;"/>
							医生信息
							</h4>
						</div>
						<div class="modal-body row">
							<div class="col-sm-3">
								<img src="assets/image/chsis/doctorImg.jpg" alt="医生照片" style="height:auto;width: 150px;"/>
							</div>
							<div class="col-sm-9">
								<div class="row container">
									<div class="col-sm-1">
										<h4><b>编号 ：</b></h4>
									</div>
									<div class="col-sm-1">
										<h4>NO.001_112</h4>
									</div>
								</div>
								<div class="row container">
									<div class="col-sm-1">
										<h4><b>姓名 ：</b></h4>
									</div>
									<div class="col-sm-1">
										<h4>李惠利</h4>
									</div>
								</div>
								<div class="row container">
									<div class="col-sm-1">
										<h4><b>电话 ：</b></h4>
									</div>
									<div class="col-sm-1">
										<h4>18394338773</h4>
									</div>
								</div>
								<div class="row container">
									<div class="col-sm-1">
										<h4><b>学历 ：</b></h4>
									</div>
									<div class="col-sm-1">
										<h4>硕士</h4>
									</div>
								</div>
								<div class="row container">
									<div class="col-sm-1">
										<h4><b>科室 ：</b></h4>
									</div>
									<div class="col-sm-1">
										<h4>外科</h4>
									</div>
								</div>
								<div class="row container">
									<div class="col-sm-1">
										<h4><b>描述 ：</b></h4>
									</div>
									<div class="col-sm-3">
										<h4>
										李惠利医生认真负责，临床经验丰富，对外科有独到的见解和认识，
										治疗各种疾病。药到病除，让患者摆脱疾病的困扰。
										</h4>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--contact end here-->
		
	<!--footer start here-->
	<%@ include file="/include/chsis/footer.jsp"%>
	<!--footer end here-->
	
	<script src="assets/js/chsis/jquery.min.js"></script>
	<script src="assets/js/chsis/wow.min.js"></script>
	<script type="application/x-javascript"> 
		addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }
	</script>
	<script type="text/javascript" src="assets/js/chsis/move-top.js"></script>
	<script type="text/javascript" src="assets/js/chsis/easing.js"></script>
	<script type="text/javascript">
			new WOW().init();
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
	</script>
</body>
</html>
