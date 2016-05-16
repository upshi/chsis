<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header section start-->
<div class="header-section">
	<!--toggle button start-->
	<a class="toggle-btn"><i class="fa fa-bars"></i></a>
	<!--toggle button end-->

	<!--search start-->
	<form class="searchform" action="index.html" method="post">
		<input type="text" class="form-control" name="keyword" placeholder="Search here..." />
	</form>
	<!--search end-->
	<!--notification menu start -->
	<div class="menu-right">
		<ul class="notification-menu">

			<li><a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown"> <img src="assets/adminex/images/photos/user-avatar.png" alt="" /> John Doe <span class="caret"></span>
			</a>
				<ul class="dropdown-menu dropdown-menu-usermenu pull-right">
					<li><a href="#"><i class="fa fa-user"></i> Profile</a></li>
					<li><a href="#"><i class="fa fa-cog"></i> 修改密码</a></li>
					<li><a href="logout"><i class="fa fa-sign-out"></i> 登 出</a></li>
				</ul></li>

		</ul>
	</div>
	<!--notification menu end -->
</div>
<!-- header section end-->

<!-- Modal Start-->
<div class="modal fade" id="changePassword" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改密码</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal">
					<div class="row container">
						<div class="form-group">
							<label class="col-sm-2 control-label">原密码：</label>

							<div class="col-sm-3">
								<input class="form-control" type="text" placeholder="原密码">
							</div>
						</div>
					</div>
					<div class="row container">
						<div class="form-group">
							<label class="col-sm-2 control-label">新密码：</label>

							<div class="col-sm-3">
								<input class="form-control" type="text" placeholder="新密码">
							</div>
						</div>
					</div>
					<div class="row container">
						<div class="form-group">
							<label class="col-sm-2 control-label">确认密码：</label>

							<div class="col-sm-3">
								<input class="form-control" type="text" placeholder="确认密码">
							</div>
						</div>
					</div>
					<div class="row container">
						<div class="form-group">
							<div class="col-sm-2 col-sm-offset-1">
								<button type="button" class="form-control btn btn-default" data-dismiss="modal">取消</button>
							</div>
							<div class="col-sm-2">
								<button type="button" class="form-control btn btn-primary ">保存</button>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>