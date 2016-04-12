<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link href="assets/css/manager/index.css" rel="stylesheet">

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
							管理家庭
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" action="">
		                    <input class="form-control" type="text" placeholder="按居民姓名搜索">
		                    <input class="form-control" type="text" placeholder="按家庭编号搜索">
		                    <input class="form-control" type="text" placeholder="按身份证号搜索">
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
		                    <tr>
		                        <td>f_001</td>
		                        <td>王文静</td>
		                        <td>0512-722217726</td>
		                        <td>阳光小区</td>
		                        <td><a class="detail" href="manager/familyDatail.jsp">详情</a></td>
		                    </tr>
		                    <tr>
		                        <td>f_001</td>
		                        <td>王文静</td>
		                        <td>0512-722217726</td>
		                        <td>阳光小区</td>
		                        <td><span class="detail">详情</span></td>
		                    </tr>
		                    <tr>
		                        <td>f_001</td>
		                        <td>王文静</td>
		                        <td>0512-722217726</td>
		                        <td>阳光小区</td>
		                        <td><span class="detail">详情</span></td>
		                    </tr>
		                    <tr>
		                        <td>f_001</td>
		                        <td>王文静</td>
		                        <td>0512-722217726</td>
		                        <td>阳光小区</td>
		                        <td><span class="detail">详情</span></td>
		                    </tr>
		                </table>
		                
		                <!-- pagination start -->
		                <nav class="col-sm-4 col-sm-offset-4">
							<ul class="pagination ">
								<li>
									<a href="#" aria-label="Previous"> 
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
								<li class="active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li>
									<a href="#" aria-label="Next"> 
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</ul>
						</nav>
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
</body>
</html>