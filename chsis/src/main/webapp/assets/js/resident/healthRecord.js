$(function(){
	$('#checkReportPhoto').on('click', function() {
		var urlImg = $('#checkReportPhoto').attr('urlImg');
		$('#urlImg').attr('src',urlImg);
		$('#checkReportPhotoDetail').modal();
	})
})