$(function() {
	//绑定点击家庭成员详情按钮事件
	$('.btn-residentDetail').on('click',function(){
		onShowResident($(this).attr('uuid'));
	})
});

//打开家庭成员详情模态框
function onShowResident(uuid) {
	//异步获取家庭成员信息
	$.ajax({
			url : "family/get/" + uuid ,
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == 'success') {
					//赋值
					$('#resident-name').html(data.resident.name);
					$('#resident-sex').html(data.resident.sex == 0?'男':'女');
					$('#resident-idNo').html(data.resident.idNo);
					$('#resident-nation').html(data.resident.nation);
					$('#resident-birth').html(data.resident.birth);
					$('#resident-age').html(data.resident.age);
					$('#resident-period').html(getPeriod(data.resident.period));
					$('#resident-phone').html(data.resident.phone);
					$('#resident-marriage').html(getMarriage(data.resident.marriage));
					
					$('#residentDetail').modal();
				} else {
					$.confirm({
						keyboardEnabled : true,
						title : '查询失败',
						content : '您查询的家庭成员不存在！',
						autoClose : 'confirm|3000'
					});
				}
			} 
	});
	
	
}

function getPeriod(num) {
	switch(num) {
		case 0 : return '婴幼儿';
		case 1 : return '儿童';
		case 2 : return '青少年';
		case 3 : return '青年';
		case 4 : return '中年';
		case 5 : return '中老年';
		case 6 : return '老年';
		default : return '未知';
	}
}

function getMarriage(num) {
	switch(num) {
		case 0 : return '未婚';
		case 1 : return '已婚';
		case 2 : return '离异';
		default : return '未知';
	}
}