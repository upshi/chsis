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
	<title>社区健康信息服务系统</title>
	<link href="assets/css/chsis/bootstrap.css" rel="stylesheet" type="text/css" media="all">
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="assets/js/chsis/jquery.min.js"></script>
	<!-- Custom Theme files -->
	<link href="assets/css/chsis/style.css" rel="stylesheet" type="text/css" media="all"/>
	<link href="assets/css/chsis/hover.css" rel="stylesheet" media="all">
	<!-- Custom Theme files -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }
	</script>
	<meta name="keywords" content="Lobortis Responsive web template, Bootstrap Web Templates, Flat Web Templates, AndriodCompatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
	<!--Google Fonts-->
	<link href='http://fonts.useso.com/css?family=Source+Sans+Pro:200,300,400,600,700,900,200italic,300italic,400italic,600italic,700italic,900italic' rel='stylesheet' type='text/css'>
	<!-- start-smoth-scrolling -->
	<script type="text/javascript" src="assets/js/chsis/move-top.js"></script>
	<script type="text/javascript" src="assets/js/chsis/easing.js"></script>
	<script type="text/javascript">
	jQuery(document).ready(function($) {
	$(".scroll").click(function(event){
	event.preventDefault();
	$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
	});
	});
	</script>
	<!-- //end-smoth-scrolling -->
	<!-- animated-css -->
	<link href="assets/css/chsis/animate.css" rel="stylesheet" type="text/css" media="all">
	<script src="assets/js/chsis/wow.min.js"></script>
	<script>
	new WOW().init();
	</script>
	<!-- animated-css -->
</head>
<body>
	<!--header start here-->
	<%@ include file="/include/chsis/header.jsp"%>
	<!--header end here-->
	
	<!--single page start here-->
	<div class="projects">
		<div class="container">
			<div class="projects-main">
				<div class="p-single">
					<div class="col-md-2 p-single-left">
						<div class="number">
							<div class="date">
								<h3>25</h3>
							</div>
							<div class="month">
								<p>August</p>
							</div>
						</div>
						<div class="details">
							<p>分类 : <span class="detail-col">外科</span></p>
							<p>作者 : <span class="detail-col">李华</span></p>
							<p>点击率 : <span class="detail-col">10</span></p>
						</div>
					</div>
					<div class="col-md-10 single-inform wow bounceInRight" data-wow-delay="0.4s">
						<div class="project-img">
							<img src="assets/image/chsis/p1.jpg" alt=""/>
						</div>
						<div class="project-text">
							<h4>Nam libero tempore</h4>
							<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="p-single">
					<div class="col-md-2 p-single-left">
						<div class="number">
							<div class="date">
								<h3>28</h3>
							</div>
							<div class="month">
								<p>August</p>
							</div>
						</div>
						<div class="details">
							<p>分类 : <span class="detail-col">外科</span></p>
							<p>作者 : <span class="detail-col">李华</span></p>
							<p>点击率 : <span class="detail-col">10</span></p>
						</div>
					</div>
					<div class="col-md-10 single-inform wow bounceInRight" data-wow-delay="0.4s">
						<div class="project-img">
							<img src="assets/image/chsis/p4.jpg" alt=""/>
						</div>
						<div class="project-text">
							<h4> quis nostrum exercitationem </h4>
							<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="p-single">
					<div class="col-md-2 p-single-left">
						<div class="number">
							<div class="date">
								<h3>30</h3>
							</div>
							<div class="month">
								<p>August</p>
							</div>
						</div>
						<div class="details">
							<p>分类 : <span class="detail-col">外科</span></p>
							<p>作者 : <span class="detail-col">李华</span></p>
							<p>点击率 : <span class="detail-col">10</span></p>
						</div>
					</div>
					<div class="col-md-10 single-inform wow bounceInRight" data-wow-delay="0.4s">
						<div class="project-img">
							<img src="assets/image/chsis/p5.jpg" alt=""/>
						</div>
						<div class="project-text">
							<h4>Neque porro quisquam est</h4>
							<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--single page end here-->
	
	<!--footer start here-->
	<%@ include file="/include/chsis/footer.jsp"%>
	<!--footer end here-->
</body>
</html>