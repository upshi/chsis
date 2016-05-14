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
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							新闻信息 
							<span class="tools pull-right"> 
								<button class="btn btn-warning pull-left btn-toPublishNews">发布新闻</button> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" action="news/search">
		                    <input class="form-control" name="title" type="text" placeholder="请输入新闻标题">
		                    <input class="form-control" name="submitTime" type="text" placeholder="请输入提交时间">
	                    	<select name="state" class="form-control">
	                    		<option value="">新闻状态</option>
	                    		<option value="0">已提交</option>
	                    		<option value="1">审核中</option>
	                    		<option value="2">审核通过</option>
	                    		<option value="3">审核未通过</option>
	                    	</select>
		                    <button class="btn btn-info">搜索</button>
	                    </form><br/>
	                    <div class="blank"></div>
	                    <table class="table table-bordered table-responsive table-hover text-center">
		                    <tr class="info">
		                        <th class="text-center">新闻标题</th>
		                        <th class="text-center">新闻类型</th>
		                        <th class="text-center">提交时间</th>
		                        <th class="text-center">新闻状态</th>
		                        <th class="text-center">操作</th>
		                    </tr>
		                    <c:forEach items="${newsList}" var="news">
			                    <tr>
			                        <td>${news.title }</td>
			                        <td>
			                        	<c:if test="${news.type == 0 }">医生寄语</c:if>
			                        	<c:if test="${news.type == 1 }">每日健康</c:if>
			                        	<c:if test="${news.type == 2 }">医院通知</c:if>
			                        	<c:if test="${news.type == 3 }">社区公告</c:if>
			                        </td>
			                        <td>${news.submitTime }</td>
			                        <td>
			                        	<c:if test="${news.state == 0 }">审核中</c:if>
			                        	<c:if test="${news.state == 1 }">审核未通过</c:if>
			                        	<c:if test="${news.state == 2 }">审核通过</c:if>
			                        </td>
			                        <td>
			                        	<a href="" class="btn btn-primary btn-sm">详情</a>
			                        </td>
			                    </tr>
		                    </c:forEach>
		                </table>
		                <div>查询到${totals }条记录/共${totalPages }页</div>
		                <!-- pagination start -->
		                <%@include file="/include/page.jsp" %>
						<!-- pagination end -->
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
    <script src="assets/js/jquery-confirm.js"></script>
    
    <!-- Custome Javascript -->
	<script src="assets/js/news/newsManage.js"></script>    
	
</body>
</html>
