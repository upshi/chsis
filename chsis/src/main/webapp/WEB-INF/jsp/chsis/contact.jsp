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
			<div class="contact-top">
				<h3>Contact Us</h3>
				<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.</p>
			</div>
			<div class="col-md-6 contact-left footer-grid wow bounceIn" data-wow-delay="0.4s">
				<h3>Information</h3>
				<h4>Cicero are also reproduced in their exact original</h4>
				<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English </p>
			</div>
			<div class="col-md-6 contact-right footer-grid wow bounceIn" data-wow-delay="0.4s">
				<h3>Feed Back</h3>
				<input type="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}"/>
				<input type="text" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}"/>
				<textarea onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message';}"/>Message</textarea>
				<input type="submit" value="send">
			</div>
		  <div class="clearfix"> </div>
		</div>
	</div>
</div>
<!--contact end here-->
<!--map start here-->
<div class="map">
	<div class="container">
	 <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d387144.007583421!2d-73.97800349999999!3d40.7056308!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew+York%2C+NY%2C+USA!5e0!3m2!1sen!2sin!4v1415253431785"  frameborder="0" style="border:0"> </iframe>
	</div>
</div>
<!--map end here-->

<!--footer start here-->
<%@ include file="/include/chsis/footer.jsp"%>
<!--footer end here-->

</body>
</html>
