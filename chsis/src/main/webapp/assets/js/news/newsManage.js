$(function() {
	/*导航颜色*/
	$("#navi_newsManage").addClass('active');
	
	//绑定点击发布新闻按钮事件
	$('.btn-toPublishNews').on('click', function(){
		window.location.href = "news/toPublish";
	});
});