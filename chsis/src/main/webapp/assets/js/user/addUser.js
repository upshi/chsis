$(function(){
	/*导航颜色*/
	$("#navi_user").addClass('active');
	
	/*绑定失焦事件*/
	$('#username').on('blur',checkUsername);
	$('#password').on('blur',checkPassword);
	$('#name').on('blur',checkName);
	
	
	/*绑定提交按钮事件*/
	$('#submit').on('click', function(){
		//表单校验
		var pass = validate();
		if(pass) {
			handleBeforeSubmit();
			return true;
		}
		return false;
	});
})

//表单校验
function validate() {
	if(checkUsername() && checkPassword() && checkName() ) {
		return true;
	} else {
		return false;
	}
}

//提交前处理
function handleBeforeSubmit() {
	$.base64.utf8encode = true;
	var $password = $('#password');
	$password.val( $.base64('encode', $password.val()) );
}

function checkUsername() {
	var username = $('#username').val();
	if(username == null || $.trim(username) == '') {
		$('#usernameGroup').removeClass('has-success');
		$('#usernameGroup').addClass('has-error');
		$('#usernameGroup .help-block').html('请输入用户名');
		return false;
	} else {
		return $.ajax({
			url : "user/checkUsernameUnique/" + username ,
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == "exist") {
					$('#usernameGroup').removeClass('has-success');
					$('#usernameGroup').addClass('has-error');
					$('#usernameGroup .help-block').html('用户名已存在');
					return false;
				} else {
					$('#usernameGroup').removeClass('has-error');
					$('#usernameGroup').addClass('has-success');
					$('#usernameGroup .help-block').html('');
					return true;
				}
			} 
		});
	}
}

function checkPassword() {
	var password = $('#password').val();
	if(password == null || $.trim(password).length < 6) {
		$('#passwordGroup').removeClass('has-success');
		$('#passwordGroup').addClass('has-error');
		$('#passwordGroup .help-block').html('请输入至少6位密码');
		return false;
	} else {
		$('#passwordGroup').removeClass('has-error');
		$('#passwordGroup').addClass('has-success');
		$('#passwordGroup .help-block').html('');
		return true;
	}
}

function checkName() {
	var name = $('#name').val();
	if(name == null || $.trim(name) == '') {
		$('#nameGroup').removeClass('has-success');
		$('#nameGroup').addClass('has-error');
		$('#nameGroup .help-block').html('请输入姓名');
		return false;
	} else {
		$('#nameGroup').removeClass('has-error');
		$('#nameGroup').addClass('has-success');
		$('#nameGroup .help-block').html('');
		return true;
	}
}