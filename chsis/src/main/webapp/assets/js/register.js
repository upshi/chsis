$(function(){
	 
	/*绑定失焦事件*/
	$('#userName').on('blur',checkUserName);
	$('#password').on('blur',checkPassword);
	$('#repassword').on('blur',checkRePassword);
	
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
	if(checkUserName() && checkPassword() && checkRePassword()) {
		return true;
	} else {
		return false;
	}
}

//提交前处理
function handleBeforeSubmit() {
	$.base64.utf8encode = true;
	var $password = $('#password');
	$password.val( $.base64('encode', $password.val() + '%admin') );
	/*$password.val( $.base64('encode', $password.val() + '%doctor') );*/
	/*$password.val( $.base64('encode', $password.val() + '% ') );*/
}

function checkUserName() {
	var flag = false;
	var userName = $('#userName').val();
	if(userName == null || $.trim(userName) == '') {
		$('#userNameGroup').removeClass('has-success');
		$('#userNameGroup').addClass('has-error');
		$('#userNameGroup .help-block').html('请输入用户名');
		return false;
	} else {
		$.ajax({
			url : "resident/checkUserNameUnique/" + userName ,
			type : "GET" ,
			cache : false , 
			async : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == "exist") {
					$('#userNameGroup').removeClass('has-success');
					$('#userNameGroup').addClass('has-error');
					$('#userNameGroup .help-block').html('用户名已存在');
				} else {
					$('#userNameGroup').removeClass('has-error');
					$('#userNameGroup').addClass('has-success');
					$('#userNameGroup .help-block').html('');
					flag = true;
				}
			} 
		});
	}	
	return flag;
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
function checkRePassword() {
	var repassword = $('#repassword').val();
	var password = $('#password').val();
	if(repassword == null || $.trim(repassword).length < 6) {
		$('#repasswordGroup').removeClass('has-success');
		$('#repasswordGroup').addClass('has-error');
		$('#repasswordGroup .help-block').html('请输入确认密码');
		return false;
	} if(repassword != password) {
		alert(password+"--"+password);
		$('#repasswordGroup').removeClass('has-success');
		$('#repasswordGroup').addClass('has-error');
		$('#repasswordGroup .help-block').html('您输入的两次密码不一致');
		return false;
	} else {
		$('#repasswordGroup').removeClass('has-error');
		$('#repasswordGroup').addClass('has-success');
		$('#repasswordGroup .help-block').html('');
		return true;
	}
}

