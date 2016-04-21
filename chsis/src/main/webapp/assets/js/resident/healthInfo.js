$(function(){
	var eyesightCode = $('#eyesightCode').attr('eyesightCode');
	$('#eyesightCode').html(getEyesight(eyesightCode));
	
	onloadModal();
	
	//绑定点击疾病史详情按钮事件
	$('.btn-diseaseHistoryDetail').on('click',function(){
		onShowDiseaseHistory($(this).attr('uuid'));
	});
	
	//绑定点击添加疾病史按钮事件
	$('.btn-add-diseaseHistory').on('click', function(){
		onAddDiseaseHistory();
	});
})

function onloadModal(){
	var eyesightCode = $('#eyesightCode').attr('eyesightCode');
	var eye = eyesightCode.split(',');
	$('#leftEyesight').val(eye[0]);
	$('#rightEyesight').val(eye[1]);
	
	//绑定点击修改基本信息按钮事件
	$('.btn-edit-commonHealthInfo').on('click', function(){
		onEditCommonHealthInfo();
	});
}
//打开修改常规健康信息的模态框
function onEditCommonHealthInfo() {
	$('#editCommonHealthInfo').modal();
}

function getEyesight(eyesight) {
	var eye = eyesight.split(',');
	return '左眼' + eye[0] + '，右眼' + eye[1];
}

//打开疾病史详情模态框
function onShowDiseaseHistory(uuid) {
	//异步获取疾病史信息
	$.ajax({
			url : "resident/getDiseaseHistory/" + uuid ,
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == 'success') {
					//赋值
					$('#diseaseHistory-name').html(data.diseaseHistory.name);
					$('#diseaseHistory-type').html(getType(data.diseaseHistory.type));
					$('#diseaseHistory-startTime').html(data.diseaseHistory.startTime);
					$('#diseaseHistory-endTime').html(data.diseaseHistory.endTime);
					$('#diseaseHistory-description').html(data.diseaseHistory.description);
					$('#diseaseHistoryDetail').modal();
				} else {
					$.confirm({
						keyboardEnabled : true,
						title : '查询失败',
						content : '您查询的疾病史信息不存在！',
						autoClose : 'confirm|3000'
					});
				}
			} 
	});
}

//打开添加疾病史模态框
function onAddDepartment() {
	//获取所有input元素并清空内容
	var inputs = $('#addDiseaseHistory input');
	for(var i=0; i<inputs.length-1; i++) {
		$(inputs[i]).attr('value','');
	}
	$("textarea[name='description']").html('');
	
	//绑定input元素失去焦点事件
	$('#adddep-number').on('blur', checkNumber_add);
	$('#adddep-name').on('blur', checkName_add);
	$('#adddep-description').on('blur', checkDescription_add);
	
	//绑定保存按钮点击事件
	$('#adddis-submit').on('click', function(){
		//表单校验
		var pass = validate_addh();
		if(pass) {
			return true;
		}
		return false;
	});
	
	$('#addDiseaseHistory').modal();
}

function getType(num) {
	switch(num) {
		case 0 : return '遗传病史'; 
		case 1 : return '重大疾病史'; 
		case 2 : return '手术史'; 
		case 3 : return '过敏史'; 
		default : return '未知';
	}
}