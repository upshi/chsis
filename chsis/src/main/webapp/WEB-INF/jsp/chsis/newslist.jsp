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
	
	<!--contact start here-->
	<div class="contact">
		<div class="container">
			<div class="contact-main">
				<div class="news-text wow bounceInLeft">
					<h3>重要通知</h3>
					<ul class="ul-style">
						<li><a href="chsis/news.jsp">全会的上的的卡萨低年级的后视镜和</a></li>
						<li><a href="chsis/news.jsp">的叫撒肯德基奥斯卡的解散好的撒空间大</a></li>
						<li><a href="chsis/news.jsp">全会的上的的卡萨低年级的后视镜和</a></li>
						<li><a href="chsis/news.jsp">的叫撒肯德基奥斯卡的解散好的撒空间大</a></li>
						<li><a href="chsis/news.jsp">全会的上的的卡萨低年级的后视镜和</a></li>
						<li><a href="chsis/news.jsp">的叫撒肯德基奥斯卡的解散好的撒空间大</a></li>
						<li><a href="chsis/news.jsp">全会的上的的卡萨低年级的后视镜和</a></li>
						<li><a href="chsis/news.jsp">的叫撒肯德基奥斯卡的解散好的撒空间大</a></li>
					</ul>
				</div>
			</div>	
		</div>
	</div>
	<!--contact end here-->
		
	<!--footer start here-->
	<%@ include file="/include/chsis/footer.jsp"%>
	<!--footer end here-->
</body>
</html>
