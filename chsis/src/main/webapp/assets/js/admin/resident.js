$(function() {
	//绑定点击居民详情按钮事件
	$('.btn-residentDetail').on('click',function(){
		onShowResident($(this).attr('uuid'));
	})
	
	//绑定修改居民按钮事件
	$('.btn-edit-resident').on('click',function(){
		onEditResident($(this).attr('uuid'));
	})
});

//打开家庭成员详情模态框
function onShowResident(uuid) {
	//异步获取家庭成员信息
	$.ajax({
			url : "resident/get/" + uuid ,
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
					$('#family-number').html(data.resident.family.number);
					$('#family-phone').html(data.resident.family.phone);
					$('#family-address').html(data.resident.family.address);
					$('#community-name').html(data.resident.family.community.name);
					$('#community-address').html(data.resident.family.community.address);
					
					$('#residentDetail').modal();
				} else {
					$.confirm({
						keyboardEnabled : true,
						title : '查询失败',
						content : '您查询的居民不存在！',
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
//删除居民的操作
function deleteResident(uuid,url) {
	$.confirm({
		keyboardEnabled : true,
			title : '删除用户',
			content : '此操作会删除该居民，而且操作不可撤销，确定删除？',
			confirmButtonClass : 'btn-info',
			cancelButtonClass : 'btn-danger',
			confirm : function() {
				$.ajax({
					url : "resident/delete/" + uuid,
					type : "GET",
					cache : false,
					dataType : "json",
					success : function(data) {
						if (data.result == "success") {
							$.confirm({
										keyboardEnabled : true,
										title : '删除成功',
										content : '成功删除该居民！',
										confirmButtonClass : 'btn-info',
										cancelButtonClass : 'btn-danger',
										autoClose : 'confirm|3000'
							});
							window.location.href = url;
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
	});
}

//打开修改居民模态框
function onEditResident(uuid) {
	//异步获取居民信息
	$.ajax({
			url : "resident/get/" + uuid ,
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == 'success') {
					//赋值
					$('#editr-uuid').attr('value', data.resident.uuid);
					$('#editr-name').attr('value', data.resident.name);
					data.resident.sex == 0 ? $('#male').attr('checked','checked'):$('#female').attr('checked',"checked");
					$('#editr-idNo').attr('value', data.resident.idNo);
					var nation = data.resident.nation;
					var nations = $('#nation').children();
					for(var i=0; i<nations.length; i++) {
						if($(nations[i]).attr('value') == nation) {
							$(nations[i]).attr('selected','selected');
						} else {
							$(nations[i]).removeAttr('selected');
						}
					}
					$('#editr-birth').attr('value', data.resident.birth);
					$('#editr-age').attr('value', data.resident.age);
					var period = data.resident.period;
					var periods = $('#period').children();
					for(var i=0; i<periods.length; i++) {
						if($(periods[i]).attr('value') == period) {
							$(periods[i]).attr('selected','selected');
						} else {
							$(periods[i]).removeAttr('selected');
						}
					}
					$('#editr-phone').attr('value', data.resident.phone);
					var marriage = data.resident.marriage;
					var marriages = $('#marriage').children();
					for(var i=0; i<marriages.length; i++) {
						if($(marriages[i]).attr('value') == marriage) {
							$(marriages[i]).attr('selected','selected');
						} else {
							$(marriages[i]).removeAttr('selected');
						}
					}
					$('#editr-familyNumber').attr('value', data.resident.family.number);
					$('#editr-familyPhone').attr('value', data.resident.family.phone);
					$('#editr-familyAddress').attr('value', data.resident.family.address);
					$('#editr-communityName').attr('value',data.resident.family.community.name);
					$('#editr-communityAddress').attr('value', data.resident.family.community.address);
					
					//绑定input元素失去焦点事件
					$('#editr-name').on('blur', checkName_edit);
					$('#editr-phone').on('blur', checkPhone_edit);
					//绑定保存按钮点击事件
					$('#editr-submit').on('click', function(){
						//表单校验
						var pass = validate_editr();
						return pass;
					});
					$('#edit-resident').modal();
				} else {
					$.confirm({
						keyboardEnabled : true,
						title : '查询失败',
						content : '您查询的居民不存在！',
						confirmButtonClass : 'btn-info',
						cancelButtonClass : 'btn-danger',
						autoClose : 'confirm|3000'
					});
				}
			} 
	});
	
}

//表单校验
function validate_editr() {
	if(checkName_edit() && checkPhone_edit()) {
		return true;
	} else {
		return false;
	}
}
function checkName_edit() {
	var name = $('#editr-name').val();
	if(name == null || $.trim(name) == '') {
		$('#editr-nameGroup').removeClass('has-success');
		$('#editr-nameGroup').addClass('has-error');
		$('#editr-nameGroup .help-block').html('请输入姓名');
		return false;
	} else {
		$('#editr-nameGroup').removeClass('has-error');
		$('#editr-nameGroup').addClass('has-success');
		$('#editr-nameGroup .help-block').html('');
		return true;
	}
}

function checkPhone_edit() {
	var phone = $('#editr-phone').val();
	if(phone == null || $.trim(phone) == '') {
		$('#editr-phoneGroup').removeClass('has-success');
		$('#editr-phoneGroup').addClass('has-error');
		$('#editr-phoneGroup .help-block').html('请输入电话');
		return false;
	} else {
		$('#editr-phoneGroup').removeClass('has-error');
		$('#editr-phoneGroup').addClass('has-success');
		$('#editr-phoneGroup .help-block').html('');
		return true;
	}
}
