$(function(){
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
	 
	/*绑定失焦事件*/
	$('#userName').on('blur',checkUserName);
	$('#password').on('blur',checkPassword);
	$('#repassword').on('blur',checkRePassword);
	$('#name').on('blur',checkName);
	$('#idNo').on('blur',checkIdNo);
	$('#familyNumber').on('blur',checkFamilyNumber);
	
	/*绑定提交按钮事件*/
	$('#join-submit').on('click', function(){
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
	if(checkUserName() && checkPassword() && checkRePassword() && checkName() && checkIdNo() &&　checkFamilyNumber()) {
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

function checkUserName() {
	var flag = false;
	var userName = $('#userName').val();
	if(userName == null || $.trim(userName) == '') {
		$('#userNameGroup').removeClass('has-success');
		$('#userNameGroup').addClass('has-error');
		$('#userNameGroup .help-block').html('请输入您的用户名');
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
					$('#userNameGroup .help-block').html('您输入的用户名已存在');
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

function checkName() {
	var name = $('#name').val();
	if(name == null || $.trim(name) == '') {
		$('#nameGroup').removeClass('has-success');
		$('#nameGroup').addClass('has-error');
		$('#nameGroup .help-block').html('请输入您的姓名');
		return false;
	} else {
		$('#nameGroup').removeClass('has-error');
		$('#nameGroup').addClass('has-success');
		$('#nameGroup .help-block').html('');
		return true;
	}
}

function checkIdNo() {
	var flag = false;
	var idNo = $('#idNo').val();
	if(idNo == null || $.trim(idNo) == '') {
		$('#idNoGroup').removeClass('has-success');
		$('#idNoGroup').addClass('has-error');
		$('#idNoGroup .help-block').html('请输入您的身份证号');
		return false;
	} else if(idNo != null && $.trim(idNo) != '') {
		var re = /^[1-9]\d{16}[\d|x]$/i;
		if(!re.test(idNo)) {
			$('#idNoGroup').removeClass('has-success');
			$('#idNoGroup').addClass('has-error');
			$('#idNoGroup .help-block').html('您输入的身份证号格式不正确');
			return false;
		} else {
			$.ajax({
				url : "resident/checkIdNoUnique/" + idNo ,
				type : "GET" ,
				cache : false , 
				async : false , 
				dataType : "json" ,
				success : function(data) {
					if(data.result == "exist") {
						$('#idNoGroup').removeClass('has-success');
						$('#idNoGroup').addClass('has-error');
						$('#idNoGroup .help-block').html('您输入的身份证号已存在');
					} else {
						$('#idNoGroup').removeClass('has-error');
						$('#idNoGroup').addClass('has-success');
						$('#idNoGroup .help-block').html('');
						flag = true;
					}
				} 
			});
		}
	}
	return flag;
}

function checkFamilyNumber() {
	var flag = false;
	var familyNumber = $('#familyNumber').val();
	if(familyNumber == null || $.trim(familyNumber) == '') {
		$('#familyNumberGroup').removeClass('has-success');
		$('#familyNumberGroup').addClass('has-error');
		$('#familyNumberGroup .help-block').html('请输入家庭编号');
		return false;
	} else {
		$.ajax({
			url : "family/checkNumberUnique/" + familyNumber ,
			type : "GET" ,
			cache : false , 
			async : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result != "exist") {
					$('#familyNumberGroup').removeClass('has-success');
					$('#familyNumberGroup').addClass('has-error');
					$('#familyNumberGroup .help-block').html('您输入的家庭编号不存在');
				} else {
					$('#familyNumberGroup').removeClass('has-error');
					$('#familyNumberGroup').addClass('has-success');
					$('#familyNumberGroup .help-block').html('');
					flag = true;
				}
			} 
		});
	}
	return flag;
}