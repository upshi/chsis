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

<link href="assets/css/chsis//bootstrap.css" rel="stylesheet" type="text/css" media="all">

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

<!--banner start here-->
<div class="banner">
	<div class="container">
		<div class="banner-main">
			<div class="col-md-6 banner-left">
				<a id="login" href="resident/login">登陆</a><a id="register" href="chsis/register.jsp">注册</a>
				<div class="lobo">
					<h3>欢迎来到阳光社区!</h3>
					<P>WELCOME TO SUNSHINE COMMUNITY.</P>
				</div>
			</div>
			<div class="col-md-6 banner-right">
				<img src="assets/image/chsis/welcome.png" alt="welcome" />
			</div>
		   <div class="clearefix"> </div>
		</div>
	</div>
</div>
<!--banner end here-->

<!--info-grid start here-->
<div class="info-grid wow bounce" data-wow-delay="0.1s">
	<div class="container">
		<div class="info-grid-main">
			<div class="col-md-4 info-grids-cr wow bounceIn" data-wow-delay="0.4s">
				<div class="info-top">
					<h3>重要通知 <span class="gd-clr">(Important Notice)</span> </h3>
				</div>
				<div class="info-bott">
					<img src="assets/image/chsis/c1.jpg" alt=""/>
					<ul>
						<li><a href="chsis/news.jsp">社区医院举行义诊</a></li>
						<li><a href="#">sas厚度啥的哈酒的大神带把手</a></li>
						<li><a href="#">s大奖是的哈时间段a大家都卡</a></li>
						<li><a href="#">sa的撒健的上课的话康的哈市大大</a></li>
						<li><a href="#">sa大会的骄傲的打瞌睡的骄傲</a></li>
						<li><a href="#">d进度可是看电视剧的大神带敬爱是</a></li>
					</ul>
				</div>
				<div class="infogrid-bwn">
					<a href="chsis/newslist.jsp">READ MORE</a>
				</div>
				<div class="gd-tl-tip"> </div>
			</div>
			<div class="col-md-4 info-grids-cr wow bounceIn" data-wow-delay="0.4s">
				<div class="info-top">
					<h3>医生寄语 <span class="gd-clr">(Doctor Caution)</h3></span>
				</div>
				<div class="info-bott">
					<img src="assets/image/chsis/c2.jpg" alt=""/>
				    <ul>
						<li><a href="#">sd你好多喝水接电话大家的挥洒</a></li>
						<li><a href="#">sas厚度啥的哈酒的大神带把手</a></li>
						<li><a href="#">s大奖是的哈时间段a大家都卡</a></li>
						<li><a href="#">sa的撒健的上课的话康的哈市大大</a></li>
						<li><a href="#">sa大会的骄傲的打瞌睡的骄傲</a></li>
						<li><a href="#">d进度可是看电视剧的大神带敬爱是</a></li>
					</ul>
				</div>
				<div class="infogrid-bwn">
					<a href="#">READ MORE</a>
				</div>
				<div class="gd-tl-tip"> </div>
			</div>
			<div class="col-md-4 info-grids-cr wow bounceIn" data-wow-delay="0.4s">
				<div class="info-top">
					<h3>每日健康 <span class="gd-clr">(Everyday Health)</h3></span>
				</div>
				<div class="info-bott">
					<img src="assets/image/chsis/c3.jpg" alt=""/>
					<ul>
						<li><a href="#">sd你好多喝水接电话大家的挥洒</a></li>
						<li><a href="#">sas厚度啥的哈酒的大神带把手</a></li>
						<li><a href="#">s大奖是的哈时间段a大家都卡</a></li>
						<li><a href="#">sa的撒健的上课的话康的哈市大大</a></li>
						<li><a href="#">sa大会的骄傲的打瞌睡的骄傲</a></li>
						<li><a href="#">d进度可是看电视剧的大神带敬爱是</a></li>
					</ul>
				</div>
				<div class="infogrid-bwn">
					<a href="#">READ MORE</a>
				</div>
				<div class="gd-tl-tip"> </div>
			</div>
		  <div class="clearfix"> </div>
		</div>
	</div>
</div>
<!--info-grid end here-->

<!--movergrid start here-->
<div class="flex-slider wow bounceInLeft" data-wow-delay="0.4s">
	<div class="container">
	<ul id="flexiselDemo4">
				<li>
				    <div class="grid">
						<h3>热点新闻1</h3>
								<div class="mov-bwn">
									<a href="#">03-31-2016</a>
								</div>
								<p>这个是点击率很高的新闻哦....</p>
						</div>
				</li>
				<li>
				    <div class="grid">
						<h3>热点新闻2</h3>
								<div class="mov-bwn">
									<a href="#">04-01-2016</a>
								</div>
								<p>这个是点击率很高的新闻哦....</p>
						</div>
				</li>
				<li>
				   <div class="grid">
						<h3>热点新闻3</h3>
								<div class="mov-bwn">
									<a href="#">04-02-2016</a>
								</div>
								<p>这个是点击率很高的新闻哦....</p>
						</div>
				</li>
	</ul>
	</div>
	<script type="text/javascript">
				 $(window).load(function() {
					$("#flexiselDemo4").flexisel({
						visibleItems: 3,
						animationSpeed: 1000,
						autoPlay: true,
						autoPlaySpeed: 3000,    		
						pauseOnHover: true,
						enableResponsiveBreakpoints: true,
				    	responsiveBreakpoints: { 
				    		portrait: { 
				    			changePoint:480,
				    			visibleItems: 1
				    		}, 
				    		landscape: { 
				    			changePoint:640,
				    			visibleItems: 2
				    		},
				    		tablet: { 
				    			changePoint:768,
				    			visibleItems: 3
				    		}
				    	}
				    });
				    
				});
			   </script>
			   <script type="text/javascript" src="assets/js/chsis/jquery.flexisel.js"></script>


</div>
<!--movegrid end here-->

<!--department-grid start here-->
<div class="department-grid wow bounce" data-wow-delay="0.1s">
	<div class="wow bounceInLeft star-department" data-wow-delay="0.6s">
		<span class="h3">明星科室<span class="wrapText">(Star Department)</span></span>
	</div>
	<div class="container">
		<div class="col-md-3 wow bounceIn" data-wow-delay="0.4s">
			<div class="department-top">
				<h4>外科 <span class="gd-clr">(Surgery)</span> </h4>
			</div>
			<div class="department-bott">
				<img src="assets/image/chsis/c1.jpg" alt="" style="width:230px;height:230px;"/>
				<div class="wrapper">
					<div class="text"> 
						<h4>外科是以手术切除、修补为主要治病手段的专业科室。分类：创伤，感染，肿瘤，畸形和功能障碍。</h4>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-3 wow bounceIn" data-wow-delay="0.4s">
			<div class="department-top">
				<h4>内科 <span class="gd-clr">(Internal Medicine)</span> </h4>
			</div>
			<div class="department-bott">
				<img src="assets/image/chsis/c1.jpg" alt="" style="width:230px;height:230px;"/>
				<div class="wrapper">
					<div class="text">
						<h4>包括呼吸内科，消化内科，心血管内科，神经内科，肿瘤科，内分泌科，血液内科，传染病科，小儿科等等。</h4>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-3 wow bounceIn" data-wow-delay="0.4s">
			<div class="department-top">
				<h4>内科 <span class="gd-clr">(Internal Medicine)</span> </h4>
			</div>
			<div class="department-bott">
				<img src="assets/image/chsis/c1.jpg" alt="" style="width:230px;height:230px;"/>
				<div class="wrapper">
					<div class="text">
						<h4>包括呼吸内科，消化内科，心血管内科，神经内科，肿瘤科，内分泌科，血液内科，传染病科，小儿科等等。</h4>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-3 wow bounceIn" data-wow-delay="0.4s">
			<div class="department-top">
				<h4>内科 <span class="gd-clr">(Internal Medicine)</span> </h4>
			</div>
			<div class="department-bott">
				<img src="assets/image/chsis/c1.jpg" alt="" style="width:230px;height:230px;"/>
				<div class="wrapper">
					<div class="text">
						<h4>包括呼吸内科，消化内科，心血管内科，神经内科，肿瘤科，内分泌科，血液内科，传染病科，小儿科等等。</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--department-bott end here-->

<!--footer start here-->
<%@ include file="/include/chsis/footer.jsp"%>
<!--footer end here-->

</body>
</html>