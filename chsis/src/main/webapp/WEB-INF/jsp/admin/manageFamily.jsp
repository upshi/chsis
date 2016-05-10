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
<link href="assets/css/admin/index.css" rel="stylesheet">

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
							家庭管理
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" action="family/search">
		                    <input class="form-control" name="number" type="text" placeholder="请输入家庭编号">
		                    <input class="form-control" name="householderName" type="text" placeholder="请输入户主姓名">
		                    <input class="form-control" name="communityName" type="text" placeholder="请输入社区名称">
		                    <button class="btn btn-info">搜索</button>
	                    </form>
	                    <div class="blank"></div>
	                    <table class="table table-bordered table-responsive table-hover">
		                    <tr class="info">
		                        <th>家庭编号</th>
		                        <th>户主</th>
		                        <th>家庭电话</th>
		                        <th>所在社区</th>
		                        <th>操作</th>
		                    </tr>
		                    <c:forEach items="${families}" var="familyVO">
			                    <tr>
			                        <td>${familyVO.number }</td>
			                        <td>${familyVO.householderName }</td>
			                        <td>${familyVO.phone }</td>
			                        <td>${familyVO.communityName }</td>
			                        <td>
			                        	<a href="family/detail/${familyVO.uuid }" class="btn btn-primary btn-sm">详情</a>
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
	
	<!-- Modal Start -->
	<div class="modal fade" id="addFamily" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">添加家庭</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" method="POST" action="family/addFamily">
						<div class="row container">
							<div class="form-group" id="addf-numberGroup">
								<label class="col-sm-2 control-label">家庭编号</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="addf-number" class="form-control" name="number" type="text" placeholder="家庭编号">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="addf-phoneGroup">
								<label class="col-sm-2 control-label">家庭电话</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="addf-phone" class="form-control" name="phone" type="text" placeholder="家庭电话">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="addf-addressGroup">
								<label class="col-sm-2 control-label">家庭地址</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="addf-address" class="form-control" name="address" type="text" placeholder="家庭地址">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">所在社区</label>
								<div class="col-sm-3">
									<select id="community" name="communityUuid" class="form-control"></select>
								</div>
							</div>
						</div>
						<div class="col-sm-offset-5">
							<button class="btn btn-success" id="addf-submit">保存</button>
							<button class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End -->
    
    <!-- Placed js at the end of the document so the pages load faster -->
	<script src="assets/adminex/js/jquery-1.10.2.min.js"></script>
	<script src="assets/adminex/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="assets/adminex/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/adminex/js/bootstrap.min.js"></script>
	<script src="assets/adminex/js/modernizr.min.js"></script>
	<script src="assets/adminex/js/jquery.nicescroll.js"></script>

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
</body>
</html>