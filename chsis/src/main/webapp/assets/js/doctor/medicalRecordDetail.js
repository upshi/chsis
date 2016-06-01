$(function(){
	//页面加载时把疾病的级联下拉框加载出来
	$('select').on('change', onSelect);
	
	$.ajax({
			url : "diseaseType/getDiseaseType",
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == "success") {
					for(var i in data.diseaseTypes) {
	           			$('.diseaseType').append('<option value="' + data.diseaseTypes[i].uuid + '">' + data.diseaseTypes[i].name + '</option>');
			        }
				} else {
					alert('失败');
				}
			} 		
		});
	
	var flag = false;
	$('.btn-editDiseaseName').on('click', function() {
		$('#editDiseaseName').modal();
	});
	
	$('.btn-editResult').on('click', function() {
		onEditResult();
	});
	
	//确认完成本次就诊按钮
	$('.btn-editState').on('click', function(){
		var uuid = $(this).attr('uuid');
		onEditState(uuid);
	});
	
	$('.btn-add-checkReport').on('click', function() {
		onAddCheckReport();
	});
	
	$('#checkReportPhoto').on('click', function() {
		var urlImg = $('#checkReportPhoto').attr('urlImg');
		$('#urlImg').attr('src',urlImg);
		$('#checkReportPhotoDetail').modal();
	});
	
})

//级联查询疾病，放在select里
function onSelect() {
	$(this).nextAll('select').remove();
	var value = $(this).attr('value');
	var text = $(this).html();
	var newSelect = '<select class="form-control">';
	newSelect += '<option value="'+ value + '>'+ text +'</option>';
	newSelect += '</select>';
	$('#selectDiv').append(newSelect);
	$('select').on('change', onSelect);
}

//打开添加疾病描述的模态框
function onEditResult(){
	//绑定input元素失去焦点事件
	$('#editm-result').on('blur', checkResult_edit);
	
	//绑定保存按钮点击事件
	$('#editmr-submit').on('click', function(){
		//表单校验
		var pass = checkResult_edit();
		if(pass) {
			return true;
		}
		return false;
	});
	$('#editResult').modal();
}

function checkResult_edit() {
	var result = $('#editm-result').val();
	if(result == null || $.trim(result) == '') {
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

//更改就诊状态为已完成本次就诊
function onEditState(uuid) {
	$.confirm({
		keyboardEnabled : true,
		title : '确定完成本次就诊',
		content : '此操作会将本次就诊状态改为已完成状态，请确认是否更改？',
		confirmButtonClass : 'btn-info',
		cancelButtonClass : 'btn-danger',
		confirm : function() {
			$.ajax({
				url : "medicalRecord/editState/" + uuid ,
				type : "GET" ,
				cache : false , 
				async : false , 
				dataType : "json" ,
				success : function(data) {
					if(data.result == "success") {
						$.confirm({
							keyboardEnabled : true,
							title : '更改成功',
							content : '就诊状态已变为已完成本次就诊！',
							confirmButtonClass : 'btn-info',
							cancelButtonClass : 'btn-danger',
							autoClose : 'confirm|3000'
						});
						window.location.href = "medicalRecord/finishedMedicalRecordDetail/" + uuid;
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
