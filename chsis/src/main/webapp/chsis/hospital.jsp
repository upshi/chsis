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
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }</script>
<meta name="keywords" content="Lobortis Responsive web template, Bootstrap Web Templates, Flat Web Templates, AndriodCompatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />

<!--Google Fonts-->
<link href='http://fonts.useso.com/css?family=Source+Sans+Pro:200,300,400,600,700,900,200italic,300italic,400italic,600italic,700italic,900italic' rel='stylesheet' type='text/css'>

<!-- start-smoth-scrolling -->
<script type="text/javascript" src="assets/js/chsis/move-top.js"></script>
<script type="text/javascript" src="assets/js/chsis/div-change.js"></script>
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

<script src="assets/js/chsis/jquery-1.11.0.min.js"></script>
</head>
<body>
<!--header start here-->
<%@ include file="/include/chsis/header.jsp"%>
<!--header end here-->
<!--about start here-->
<div class="service">
	<div class="container">
		<div class="service-main">
			<div class="service-top">
				<h3>社区医院总体概况</h3>
				<p>本社区共拥有医院1所，医院共8个科室，30名医生，100名护士，其中副主任医师10名，主任医师3名，医疗设备充足，可满足居民日常的健康需求。同时社区医院可以提供常规体检，极大方便了居民的生活。</p>
			</div>
			<div class="wow bounceInLeft department" data-wow-delay="0.6s">
				<span class="h3">科室详情<span class="wrapText">(Department Detail)</span></span>
			</div>
			<div class="service-left wow bounceIn" data-wow-delay="0.4s">
			   <div class="service-right">
				    <img src="assets/image/chsis/s1.jpg" alt=""/>
				    <div class="wrapper">
				    	<h3>医生信息</h3>
						<div class="text">
							<ul>
								<li><a href="chsis/doctor.jsp">李医生</a></li>
								<li><a href="#">李医生</a></li>
								<li><a href="#">李医生</a></li>
								<li><a href="#">李医生</a></li>
								<li><a href="#">李医生</a></li>
							</ul>
						</div>
					</div>
				    <div class="ser-bwn">
				    	<a href="#" class="hvr-grow-shadow">Read More</a>
				    </div>
			   </div>
			    <div class="service-right ser-midd wow bounceIn" data-wow-delay="0.4s">
				    <img src="assets/image/chsis/s2.jpg" alt=""/>
				    <div class="wrapper">
				    	<h3>医生信息</h3>
						<div class="text">
							<ul>
								<li><a href="#">李医生</a></li>
								<li><a href="#">李医生</a></li>
								<li><a href="#">李医生</a></li>
								<li><a href="#">李医生</a></li>
								<li><a href="#">李医生</a></li>
							</ul>
						</div>
					</div>
				    <div class="ser-bwn">
				    	<a href="#" class="hvr-grow-shadow">Read More</a>
				    </div>
			   </div>
			    <div class="service-right wow bounceIn" data-wow-delay="0.4s">
				    <img src="assets/image/chsis/s3.jpg" alt=""/>
				    <div class="wrapper">
				    	<h3>医生信息</h3>
						<div class="text">
							<ul>
								<li><a href="#">李医生</a></li>
								<li><a href="#">李医生</a></li>
								<li><a href="#">李医生</a></li>
								<li><a href="#">李医生</a></li>
								<li><a href="#">李医生</a></li>
							</ul>
						</div>
					</div>
				    <div class="ser-bwn">
				    <a href="#" class="hvr-grow-shadow">Read More</a>
				    </div>
			   </div>
				<div class="service-right wow bounceIn" data-wow-delay="0.4s">
				    <img src="assets/image/chsis/s4.jpg" alt=""/>
				    <div class="wrapper">
				    	<h3>医生信息</h3>
						<div class="text">
							<ul>
								<li><a href="#">李医生</a></li>
								<li><a href="#">李医生</a></li>
								<li><a href="#">李医生</a></li>
								<li><a href="#">李医生</a></li>
								<li><a href="#">李医生</a></li>
							</ul>
						</div>
					</div>
				    <div class="ser-bwn">
				   <a href="#" class="hvr-grow-shadow">Read More</a>
				    </div>
			   </div>
			   <div class="service-right ser-midd wow bounceIn" data-wow-delay="0.4s">
				    <img src="assets/image/chsis/s6.jpg" alt=""/>
				    <div class="wrapper">
				    	<h3>医生信息</h3>
						<div class="text">
							<ul>
								<li><a href="#">李医生</a></li>
								<li><a href="#">李医生</a></li>
								<li><a href="#">李医生</a></li>
								<li><a href="#">李医生</a></li>
								<li><a href="#">李医生</a></li>
							</ul>
						</div>
					</div>
				    <div class="ser-bwn">
				    	<a href="#" class="hvr-grow-shadow">Read More</a>
				    </div>
			   </div>
			   <div class="service-right wow bounceIn" data-wow-delay="0.4s">
				    <img src="assets/image/chsis/s7.jpg" alt=""/>
				   	<div class="wrapper">
				    	<h3>医生信息</h3>
						<div class="text">
							<ul>
								<li><a href="#">李医生</a></li>
								<li><a href="#">李医生</a></li>
								<li><a href="#">李医生</a></li>
								<li><a href="#">李医生</a></li>
								<li><a href="#">李医生</a></li>
							</ul>
						</div>
					</div>
				    <div class="ser-bwn">
				    <a href="#" class="hvr-grow-shadow">Read More</a>
				    </div>
			   </div>
			    <div class="clearfix"> </div>
			 </div>
		</div>
	</div>
</div>
<!--about end here-->

<!--footer start here-->
<%@ include file="/include/chsis/footer.jsp"%>
<!--footer end here-->

</body>
</html>
