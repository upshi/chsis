$(function() {
	//绑定点击添加家庭按钮事件
	$('.btn-add-family').on('click', function(){
		$.ajax({
			url : "community/getCommunityType",
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == "success") {
					for(var i in data.communities) {
		           		$('#community').append('<option value="' + data.communities[i].uuid + '">' + data.communities[i].name + '</option>');
			        }
				} else {
					alert('失败');
				}
			} 		
		});
		onAddFamily();
	});
});

//打开添加家庭模态框
function onAddFamily() {
	//绑定input元素失去焦点事件
	$('#addf-number').on('blur', checkNumber_add);
	$('#addf-phone').on('blur', checkPhone_add);
	$('#addf-address').on('blur', checkAddress_add);
	
	//绑定保存按钮点击事件
	$('#addf-submit').on('click', function(){
		//表单校验
		var pass = validate_addf();
		if(pass) {
			return true;
		}
		return false;
	});
	
	$('#addFamily').modal();
}

//表单校验
function validate_addf() {
	if(checkNumber_add() && checkPhone_add() && checkAddress_add()) {
		return true;
	} else {
		return false;
	}
}

//提交前处理
function checkNumber_add() {
	var flag = false;
	var number = $('#addf-number').val();
	if(number == null || $.trim(number) == '') {
		$('#addf-numberGroup').removeClass('has-success');
		$('#addf-numberGroup').addClass('has-error');
		$('#addf-numberGroup .help-block').html('请输入家庭编号');
		return false;
	} else {
		$.ajax({
			url : "family/checkNumberUnique/" + number ,
			type : "GET" ,
			cache : false , 
			async : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == "exist") {
					$('#addf-numberGroup').removeClass('has-success');
					$('#addf-numberGroup').addClass('has-error');
					$('#addf-numberGroup .help-block').html('家庭编号已存在');
				} else {
					$('#addf-numberGroup').removeClass('has-error');
					$('#addf-numberGroup').addClass('has-success');
					$('#addf-numberGroup .help-block').html('');
					flag = true;
				}
			} 
		});
	}
	return flag;
}

function checkPhone_add() {
	var phone = $('#addf-phone').val();
	if(phone == null || $.trim(phone) == '') {
		$('#addf-phoneGroup').removeClass('has-success');
		$('#addf-phoneGroup').addClass('has-error');
		$('#addf-phoneGroup .help-block').html('请输入家庭电话');
		return false;
	} else {
		$('#addf-phoneGroup').removeClass('has-error');
		$('#addf-phoneGroup').addClass('has-success');
		$('#addf-phoneGroup .help-block').html('');
		return true;
	}
}

function checkAddress_add() {
	var address = $('#addf-address').val();
	if(address == null || $.trim(address) == '') {
		$('#addf-addressGroup').removeClass('has-success');
		$('#addf-addressGroup').addClass('has-error');
		$('#addf-addressGroup .help-block').html('请输入家庭地址');
		return false;
	} else {
		$('#addf-addressGroup').removeClass('has-error');
		$('#addf-addressGroup').addClass('has-success');
		$('#addf-addressGroup .help-block').html('');
		return true;
	}
}

//删除医院操作
function deleteHospital(uuid) {
	$.confirm({
		keyboardEnabled : true,
			title : '删除医院',
			content : '此操作会删除该家庭，而且操作不可撤销，确定删除？',
			confirmButtonClass : 'btn-info',
			cancelButtonClass : 'btn-danger',
			confirm : function() {
				$.ajax({
					url : "hospital/delete/" + uuid,
					type : "GET",
					cache : false,
					dataType : "json",
					success : function(data) {
						if (data.result == "success") {
							$.confirm({
										keyboardEnabled : true,
										title : '删除成功',
										content : '成功删除该家庭！',
										confirmButtonClass : 'btn-info',
										cancelButtonClass : 'btn-danger',
										autoClose : 'confirm|3000'
							});
							window.location.href = 'family/manage'
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
