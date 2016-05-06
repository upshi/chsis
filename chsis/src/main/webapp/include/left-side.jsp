<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- left side start-->
<div class="left-side sticky-left-side">
	<!--logo and iconic logo start-->
	<div class="logo">
		<a href="index.html"><img src="assets/adminex/images/logo.png" alt=""></a>
	</div>

	<div class="logo-icon text-center">
		<a href="index.html"><img src="assets/adminex/images/logo_icon.png" alt=""></a>
	</div>
	<!--logo and iconic logo end-->


	<div class="left-side-inner">
		<!-- visible to small devices only -->
		<div class="visible-xs hidden-sm hidden-md hidden-lg">
			<div class="media logged-user">
				<img alt="" src="assets/adminex/images/photos/user-avatar.png" class="media-object">
				<div class="media-body">
					<h4>
						<a href="#">John Doe</a>
					</h4>
					<span>"Hello There..."</span>
				</div>
			</div>

			<h5 class="left-nav-title">Account Information</h5>
			<ul class="nav nav-pills nav-stacked custom-nav">
				<li><a href="#"><i class="fa fa-user"></i> <span>Profile</span></a></li>
				<li><a href="#"><i class="fa fa-cog"></i> <span>Settings</span></a></li>
				<li><a href="#"><i class="fa fa-sign-out"></i> <span>Sign Out</span></a></li>
			</ul>
		</div>

		<!--sidebar nav start-->
		<ul class="nav nav-pills nav-stacked custom-nav">
			<!-- resident start -->
			<li><a href="index.jsp"><i class="fa fa-home"></i> <span>首页</span></a></li>
			<li><a href="resident/baseInfo"><i class="fa fa-home"></i> <span>基本信息</span></a></li>
			<li><a href="resident/healthInfo"><i class="fa fa-home"></i> <span>健康信息</span></a></li>
			<li><a href="resident/medicalRecord"><i class="fa fa-home"></i> <span>就诊记录</span></a></li>
			<li><a href="resident/immuneRecord"><i class="fa fa-home"></i> <span>免疫记录</span></a></li>
			<li><a href="resident/healthRecord"><i class="fa fa-home"></i> <span>体检记录</span></a></li>
			<li><a href="family/familyInfo"><i class="fa fa-home"></i> <span>家庭信息</span></a></li>
			<!-- resident end -->
			<hr>
			
			<!-- admin start -->
			<li><a href="admin/hospital"><i class="fa fa-home"></i> <span>医院管理</span></a></li>
			<li><a href="family/manage"><i class="fa fa-home"></i> <span>家庭管理</span></a></li>
			<li><a href="resident/manage"><i class="fa fa-home"></i> <span>居民管理</span></a></li>
			<li><a href="manager/publishNews.jsp"><i class="fa fa-home"></i> <span>发布新闻</span></a></li>
			<li><a href="user/manage"><i class="fa fa-home"></i> <span>用户管理</span></a></li>
			<li><a href="resource/manager"><i class="fa fa-home"></i> <span>资源管理</span></a></li>
			<li><a href="role/manager"><i class="fa fa-home"></i> <span>角色管理</span></a></li>
			<!-- admin end -->
			<hr>
			
			<!-- doctor start -->
			<li><a href="doctor/baseInfo"><i class="fa fa-home"></i> <span>基本信息</span></a></li>
			<li><a href="medicalRecord/toCreate"><i class="fa fa-home"></i> <span>新建记录</span></a></li>
			<li><a href="medicalRecord/finished"><i class="fa fa-home"></i> <span>已完成就诊记录</span></a></li>
			<li><a href="medicalRecord/unfinished"><i class="fa fa-home"></i> <span>待完成就诊记录</span></a></li>
			<li><a href="doctor/publishNews.jsp"><i class="fa fa-home"></i><span>发布新闻</span></a></li>
			<!-- doctor end -->
			<hr>
			
			<!-- hospitalManager start -->
			<li><a href="department/manage"><i class="fa fa-home"></i> <span>科室管理</span></a></li>
			<li><a href="doctor/manage"><i class="fa fa-home"></i> <span>医生管理</span></a></li>
			<li><a href="hospitalManager/publishNews.jsp"><i class="fa fa-home"></i> <span>发布新闻</span></a></li>
			<!-- hospitalManager end -->
			<hr>
		</ul>
		<!--sidebar nav end-->
	</div>
</div>
<!-- left side end-->
