$(function(){
	var flag = false;
	$('.btn-edit').on('click', function() {
		onEdit();
	})
	$('.btn-add-checkReport').on('click', function() {
		onAddCheckReport();
	})
	
	$('#checkReportPhoto').on('click', function() {
		var urlImg = $('#checkReportPhoto').attr('urlImg');
		$('#urlImg').attr('src',urlImg);
		$('#checkReportPhotoDetail').modal();
	})
})

//打开编辑就诊信息的模态框
function onEdit(){
	//绑定input元素失去焦点事件
	$('#editm-disease').on('blur', checkDisease_edit);
	$('#editm-result').on('blur', checkResult_edit);
	
	//绑定保存按钮点击事件
	$('#editm-submit').on('click', function(){
		//表单校验
		var pass = validate_editm();
		if(pass) {
			return true;
		}
		return false;
	});
	$('#editMedicalRecord').modal();
}

//表单校验
function validate_editm() {
	if(checkDisease_edit() && checkResult_edit()) {
		return true;
	} else {
		return false;
	}
}

function checkDisease_edit() {
	var disease = $('#editm-disease').val();
	if(disease == null || $.trim(disease) == '') {
		$('#editm-diseaseGroup').removeClass('has-success');
		$('#editm-diseaseGroup').addClass('has-error');
		$('#editm-diseaseGroup .help-block').html('请输入疾病名称');
		return false;
	} else {
		$('#editm-diseaseGroup').removeClass('has-error');
		$('#editm-diseaseGroup').addClass('has-success');
		$('#editm-diseaseGroup .help-block').html('');
		return true;
	}
}

function checkResult_edit() {
	var disease = $('#editm-result').val();
	if(disease == null || $.trim(disease) == '') {
		$('#editm-resultGroup').removeClass('has-success');
		$('#editm-resultGroup').addClass('has-error');
		$('#editm-resultGroup .help-block').html('请输入就诊结果描述');
		return false;
	} else {
		$('#editm-resultGroup').removeClass('has-error');
		$('#editm-resultGroup').addClass('has-success');
		$('#editm-resultGroup .help-block').html('');
		return true;
	}
}

function onAddCheckReport() {
	//绑定input元素失去焦点事件
	$('#addchr-name').on('blur', checkName_add);
	$('#addchr-description').on('blur', checkDescription_add);
	$('#input-id').on('fileloaded', function(event, file, previewId, index, reader) {
		$('#addchr-imgGroup').removeClass('has-error');
		$('#addchr-imgGroup').addClass('has-success');
		$('#addchr-imgGroup .help-block').html('');
	   flag = true;
	});
	//绑定保存按钮点击事件
	$('.addchr-submit').on('click', function(){
		//表单校验
		var pass = validate_addchr();
		if($('#input-id').fileinput('getFileStack').length==0){
			$('#addchr-imgGroup').removeClass('has-success');
			$('#addchr-imgGroup').addClass('has-error');
			$('#addchr-imgGroup .help-block').html('请上传报告单');
			flag = false;
		} else {
			$('#addchr-imgGroup').removeClass('has-error');
			$('#addchr-imgGroup').addClass('has-success');
			$('#addchr-imgGroup .help-block').html('');
			flag = true
		}
		if(pass && flag == true) {
			return true;
		}
		return false;
	});
	
	$('#addCheckReport').modal();
}

//表单校验
function validate_addchr() {
	if(checkName_add() && checkDescription_add()) {
		return true;
	} else {
		return false;
	}
}

function checkName_add() {
	var name = $('#addchr-name').val();
	if(name == null || $.trim(name) == '') {
		$('#addchr-nameGroup').removeClass('has-success');
		$('#addchr-nameGroup').addClass('has-error');
		$('#addchr-nameGroup .help-block').html('请输入报告名称');
		return false;
	} else {
		$('#addchr-nameGroup').removeClass('has-error');
		$('#addchr-nameGroup').addClass('has-success');
		$('#addchr-nameGroup .help-block').html('');
		return true;
	}
}

function checkDescription_add() {
	var description = $('#addchr-description').val();
	if(description == null || $.trim(description) == '') {
		$('#addchr-descriptionGroup').removeClass('has-success');
		$('#addchr-descriptionGroup').addClass('has-error');
		$('#addchr-descriptionGroup .help-block').html('请输入诊断结果描述');
		return false;
	} else {
		$('#addchr-descriptionGroup').removeClass('has-error');
		$('#addchr-descriptionGroup').addClass('has-success');
		$('#addchr-descriptionGroup .help-block').html('');
		return true;
	}
}
