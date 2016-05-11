$(function(){
	onloadModal();
	beforeSubmit();
})

function onloadModal() {
	$.getJSON('assets/json/nation.json',function(data) {
        for(var i in data) {
       		$('#nation').append('<option value="' + data[i].value + '">' + data[i].name + '</option>');
        }
    });
    $.getJSON('assets/json/period.json',function(data) {
        for(var i in data) {
    		$('#period').append('<option value="' + data[i].value + '">' + data[i].name + '</option>');
        }
    });
    $.getJSON('assets/json/marriage.json',function(data) {
        for(var i in data) {
    		$('#marriage').append('<option value="' + data[i].value + '">' + data[i].name + '</option>');
        }
    });
    $.getJSON('assets/json/bloodType.json',function(data) {
        for(var i in data) {
    		$('#bloodType').append('<option value="' + data[i].value + '">' + data[i].name + '</option>');
        }
    });
    
    //年龄的select
	for(var i=0; i<100; i++) {
		if(i == 20) {
			$('#age-select').append('<option value="' + i + '" selected>' + i + '</option>');
		} else {
			$('#age-select').append('<option value="' + i + '">' + i + '</option>');
		}
	}
}

//打开修改居民基本信息的模态框
function beforeSubmit(){
	/*绑定失焦事件*/
		$('#birth').on('blur',checkBirth);
		$('#phone').on('blur',checkPhone);
		$('#height').on('blur', checkHeight);
		$('#weight').on('blur', checkWeight);
		$('#leftEyesight').on('blur', checkLeftEyesight);
		$('#rightEyesight').on('blur', checkRightEyesight);
		
		/*绑定提交按钮事件*/
		$('#submit').on('click', function(){
			//表单校验
			var pass = validate();
			if(pass) {
				return true;
			}
			return false;
		});
	$('#editBaseInfo').modal();
}
//表单校验
function validate() {
	if(checkBirth() && checkPhone() && checkHeight() && checkWeight() && checkLeftEyesight() &&　checkRightEyesight()) {
		return true;
	} else {
		return false;
	}
}
//校验出生日期
function checkBirth() {
	var birth = $('#birth').val();
	if(birth != null && $.trim(birth) != '') {
		var re = /^[1|2]\d{7}$/i;
		if(!re.test(birth)) {
			$('#birthGroup').removeClass('has-success');
			$('#birthGroup').addClass('has-error');
			$('#birthGroup .help-block').html('您输入的出生日期格式不正确');
			return false;
		} else {
			$('#birthGroup').removeClass('has-error');
			$('#birthGroup').addClass('has-success');
			$('#birthGroup .help-block').html('');
			return true;
		}
	} else {
		$('#birthGroup').removeClass('has-success');
		$('#birthGroup').addClass('has-error');
		$('#birthGroup .help-block').html('请输入您的出生日期');
		return false;
	}
}

//校验电话
function checkPhone() {
	var phone = $('#phone').val();
	if(phone != null && $.trim(phone) != '') {
		var re = /^1[3|4|5|7|8]\d{9}$/i;
		if(!re.test(phone)) {
			$('#phoneGroup').removeClass('has-success');
			$('#phoneGroup').addClass('has-error');
			$('#phoneGroup .help-block').html('您输入的手机号格式不正确');
			return false;
		} else {
			$('#phoneGroup').removeClass('has-error');
			$('#phoneGroup').addClass('has-success');
			$('#phoneGroup .help-block').html('');
			return true;
		}
	} else {
		$('#phoneGroup').removeClass('has-success');
		$('#phoneGroup').addClass('has-error');
		$('#phoneGroup .help-block').html('请输入手机号');
		return false;
	}
}
function checkHeight() {
	var height = $('#height').val();
	if(height == null || $.trim(height) == '') {
		$('#heightGroup').removeClass('has-success');
		$('#heightGroup').addClass('has-error');
		$('#heightGroup .help-block').html('请输入身高');
		return false;
	} else {
		$('#heightGroup').removeClass('has-error');
		$('#heightGroup').addClass('has-success');
		$('#heightGroup .help-block').html('');
		return true;
	}
}
function checkWeight() {
	var weight = $('#weight').val();
	if(weight == null || $.trim(weight) == '') {
		$('#weightGroup').removeClass('has-success');
		$('#weightGroup').addClass('has-error');
		$('#weightGroup .help-block').html('请输入体重');
		return false;
	} else {
		$('#weightGroup').removeClass('has-error');
		$('#weightGroup').addClass('has-success');
		$('#weightGroup .help-block').html('');
		return true;
	}
}

function checkLeftEyesight() {
	var leftEyesight = $('#leftEyesight').val();
	if(leftEyesight == null || $.trim(leftEyesight) == '') {
		$('#leftEyesightGroup').removeClass('has-success');
		$('#leftEyesightGroup').addClass('has-error');
		$('#leftEyesightGroup .help-block').html('请输入左眼视力');
		return false;
	} else {
		$('#leftEyesightGroup').removeClass('has-error');
		$('#leftEyesightGroup').addClass('has-success');
		$('#leftEyesightGroup .help-block').html('');
		return true;
	}
}
function checkRightEyesight() {
	var rightEyesight = $('#rightEyesight').val();
	if(rightEyesight == null || $.trim(rightEyesight) == '') {
		$('#rightEyesightGroup').removeClass('has-success');
		$('#rightEyesightGroup').addClass('has-error');
		$('#rightEyesightGroup .help-block').html('请输入右眼视力');
		return false;
	} else {
		$('#rightEyesightGroup').removeClass('has-error');
		$('#rightEyesightGroup').addClass('has-success');
		$('#rightEyesightGroup .help-block').html('');
		return true;
	}
}

//获取民族
function getNation(num) {
	switch(num) {
		case 0 : return '汉族';
		case 1 : return '壮族';
		case 2 : return '回族';
		case 3 : return '满族';
		case 4 : return '维吾尔族';
		case 5 : return '苗族';
		case 6 : return '彝族';
		case 7 : return '土家族';
		case 8 : return '藏族';
		case 9 : return '蒙古族';
		case 10 : return '侗族';
		case 11 : return '布依族';
		case 12 : return '瑶族';
		case 13 : return '朝鲜族';
		case 14 : return '哈尼族';
		case 15 : return '黎族';
		case 16 : return '哈萨克族';
		case 17 : return '傣族';
		case 18 : return '畲族';
		case 19 : return '傈僳族';
		case 20 : return '东乡族';
		case 21 : return '仡佬族';
		case 22 : return '拉祜族';
		case 23 : return '佤族';
		case 24 : return '水族';
		case 25 : return '纳西族';
		case 26 : return '羌族';
		case 27 : return '土族';
		case 28 : return '仫佬族';
		case 29 : return '锡伯族';
		case 30 : return '柯尔克孜族';
		case 31 : return '景颇族';
		case 32 : return '达斡尔族';
		case 33 : return '撒拉族';
		case 34 : return '布朗族';
		case 35 : return '毛南族';
		case 36 : return '塔吉克族';
		case 37 : return '普米族';
		case 38 : return '阿昌族';
		case 39 : return '怒族';
		case 40 : return '鄂温克族';
		case 41 : return '京族';
		case 42 : return '基诺族';
		case 43 : return '德昂族';
		case 44 : return '保安族';
		case 45 : return '俄罗斯族';
		case 46 : return '裕固族';
		case 47 : return '乌孜别克族';
		case 48 : return '门巴族';
		case 49 : return '鄂伦春族';
		case 50 : return '独龙族';
		case 51 : return '赫哲族';
		case 52 : return '高山族';
		case 53 : return '珞巴族';
		case 54 : return '塔塔尔族';
		case 55 : return '未识别民族';
		case 56 : return '入籍外国人';
		default : return '未知';
	}
}