$(function() {
	$("#navi_user").addClass('active');
	
	//绑定添加管理员按钮事件
	$("#btn-add").on('click', function(){
		window.location.href = "manager/toAddManager";
	});
	
	//绑定点击管理员详情按钮事件
	$('.btn-managerDetail').on('click',function(){
		onShowManager($(this).attr('uuid'));
	})
})

//打开家庭成员详情模态框
function onShowManager(uuid) {
	//异步获取家庭成员信息
	$.ajax({
			url : "manager/get/" + uuid ,
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == 'success') {
					//赋值
					$('#manager-name').html(data.manager.name);
					$('#manager-phone').html(data.manager.phone);
					var type = data.manager.type;
					$('#manager-type').html(getType(type));
					
					if(type == 0) {
						$('#hospital-name').html(hospitalName);
						$('#div-hide').show();
					}
					
					$('#managerDetail').modal();
				} else {
					$.confirm({
						keyboardEnabled : true,
						title : '查询失败',
						content : '您查询的管理员不存在！',
						autoClose : 'confirm|3000'
					});
				}
			} 
	});
}

function deleteManager(managerUuid) {
	$.confirm({
		keyboardEnabled : true,
		title : '删除管理员',
		content : '此操作会删除该管理员的所有信息，而且操作不可撤销，确定删除该管理员？',
		confirmButtonClass : 'btn-info',
		cancelButtonClass : 'btn-danger',
		confirm : function() {
			ajaxDelete(managerUuid);
		}
	});
}

function ajaxDelete(managerUuid) {
	$.ajax({
		url : "manager/delete/" + managerUuid,
		type : "GET",
		cache : false,
		dataType : "json",
		success : function(data) {
			if (data.result == "success") {
				$.confirm({
					keyboardEnabled : true,
					title : '删除成功',
					content : '删除管理员成功！',
					confirmButtonClass : 'btn-info',
					cancelButtonClass : 'btn-danger',
					autoClose : 'confirm|3000'
				});
				window.location.href = 'manager/manage'
			} else {
				$.confirm({
					keyboardEnabled : true,
					title : '操作失败',
					content : data.result,
					confirmButtonClass : 'btn-info',
					cancelButtonClass : 'btn-danger',
					autoClose : 'confirm|3000'
				});
			}
		}
	});
}

function getType(num) {
	switch(num){
		case 0 : return '医院管理员';
		case 1 : return '审核员';
		case 2 : return '系统管理员';
		default : return '未知';
	}
}