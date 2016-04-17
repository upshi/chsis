$(function() {
	//绑定点击添加医生按钮事件
	$('.btn-add-doctor').on('click', function(){
		onAddDoctor();
	});
	//绑定点击家庭成员详情按钮事件
	$('.btn-doctorDetail').on('click',function(){
		onShowDoctor($(this).attr('uuid'));
	})
	
	$('.btn-adddoc-submit').on('click',function(){
		handleBeforeSubmit();
		return true;
	})
});

//提交前处理
function handleBeforeSubmit() {
	$.base64.utf8encode = true;
	var $password = $('#adddoc-password');
	$password.val( $.base64('encode', $password.val()) );
}


//打开添加医生模态框
function onAddDoctor() {
	//获取所有input元素并清空内容
	/*var inputs = $('#addDoctor input');
	for(var i=0; i<inputs.length-1; i++) {
		$(inputs[i]).attr('value','');
	}
	$("textarea[name='description']").html('');*/
	
	$('#addDoctor').modal();
}

//删除医生操作
function deleteDoctor(uuid,DepartmentUuid) {
	$.confirm({
		keyboardEnabled : true,
			title : '删除医生',
			content : '此操作会删除该医生，而且操作不可撤销，确定删除？',
			confirmButtonClass : 'btn-info',
			cancelButtonClass : 'btn-danger',
			confirm : function() {
				$.ajax({
					url : "doctor/delete/" + uuid,
					type : "GET",
					cache : false,
					dataType : "json",
					success : function(data) {
						if (data.result == "success") {
							$.confirm({
										keyboardEnabled : true,
										title : '删除成功',
										content : '成功删除该医生！',
										confirmButtonClass : 'btn-info',
										cancelButtonClass : 'btn-danger',
										autoClose : 'confirm|3000'
							});
							window.location.href = 'department/detail/' + DepartmentUuid;
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

//打开医生详情模态框
function onShowDoctor(uuid) {
	//异步获取医生信息
	$.ajax({
			url : "doctor/get/" + uuid ,
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == 'success') {
					//赋值
					$('#doctor-number').html(data.doctor.number);
					$('#doctor-name').html(data.doctor.name);
					$('#doctor-photo').attr('src',data.doctor.photo);
					$('#doctor-sex').html(data.doctor.sex == 0?'男':'女');
					$('#doctor-phone').html(data.doctor.phone);
					$('#doctor-diploma').html(getDiploma(data.doctor.diploma));
					$('#doctor-title').html(getTitle(data.doctor.title));
					$('#doctor-description').html(data.doctor.description);
					
					$('#doctorDetail').modal();
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

function getDiploma(num){
	switch(num) {
		case 0 : return '专科';
		case 1 : return '本科';
		case 2 : return '硕士';
		case 3 : return '博士';
		case 4 : return '博士后';
		default : return '未知';
	}
}
function getTitle(num){
	switch(num) {
		case 0 : return '护士';
		case 1 : return '医师';
		case 2 : return '主治医师';
		case 3 : return '副主任医师';
		case 4 : return '主任医师';
		default : return '未知';
	}
}

//表单校验
function validate_addh() {
	if(checkNumber_add() && checkName_add() && checkDescription_add()) {
		return true;
	} else {
		return false;
	}
}

//提交前处理
function checkNumber_add() {
	var flag = false;
	var number = $('#adddep-number').val();
	if(number == null || $.trim(number) == '') {
		$('#adddep-numberGroup').removeClass('has-success');
		$('#adddep-numberGroup').addClass('has-error');
		$('#adddep-numberGroup .help-block').html('请输入科室编号');
		return false;
	} else {
		$.ajax({
			url : "department/checkNumberUnique/" + number ,
			type : "GET" ,
			cache : false , 
			async : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == "exist") {
					$('#adddep-numberGroup').removeClass('has-success');
					$('#adddep-numberGroup').addClass('has-error');
					$('#adddep-numberGroup .help-block').html('科室编号已存在');
				} else {
					$('#adddep-numberGroup').removeClass('has-error');
					$('#adddep-numberGroup').addClass('has-success');
					$('#adddep-numberGroup .help-block').html('');
					flag = true;
				}
			} 
		});
	}
	return flag;
}

function checkName_add() {
	var name = $('#adddep-name').val();
	if(name == null || $.trim(name) == '') {
		$('#adddep-nameGroup').removeClass('has-success');
		$('#adddep-nameGroup').addClass('has-error');
		$('#adddep-nameGroup .help-block').html('请输入科室名称');
		return false;
	} else {
		$('#adddep-nameGroup').removeClass('has-error');
		$('#adddep-nameGroup').addClass('has-success');
		$('#adddep-nameGroup .help-block').html('');
		return true;
	}
}

function checkDescription_add() {
	var description = $('#adddep-description').val();
	if(description == null || $.trim(description) == '') {
		$('#adddep-descriptionGroup').removeClass('has-success');
		$('#adddep-descriptionGroup').addClass('has-error');
		$('#adddep-descriptionGroup .help-block').html('请输入科室描述');
		return false;
	} else {
		$('#adddep-descriptionGroup').removeClass('has-error');
		$('#adddep-descriptionGroup').addClass('has-success');
		$('#adddep-descriptionGroup .help-block').html('');
		return true;
	}
}

//删除科室操作
function deleteDepartment(uuid,url) {
	$.confirm({
		keyboardEnabled : true,
			title : '删除科室',
			content : '此操作会删除该科室，该科室下的所有医生也将被删除，而且操作不可撤销，确定删除？',
			confirmButtonClass : 'btn-info',
			cancelButtonClass : 'btn-danger',
			confirm : function() {
				$.ajax({
					url : "department/delete/" + uuid,
					type : "GET",
					cache : false,
					dataType : "json",
					success : function(data) {
						if (data.result == "success") {
							$.confirm({
										keyboardEnabled : true,
										title : '删除成功',
										content : '成功删除该科室！',
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
