$(function(){
	//添加疾病按钮
	$('.btn-add-disease').on('click', function(){
		$('#addDiseaseModal').modal();
	});
	
	//删除疾病类型按钮
	$('.btn-delete-diseaseType').on('click', function(){
		var uuid = $(this).attr('uuid');
		deleteDiseaseType(uuid);
	});
	
	//添加疾病提交按钮
	$('#addDisease-submit').on('click', function(){
		return checkDiseaseName_add();
	});
	
	$('#addDisease-name').on('blur',checkDiseaseName_add);
})


function checkDiseaseName_add() {
	var name = $('#addDisease-name').val();
	if(name == null || $.trim(name) == '') {
		$('#addDiseaseNameGroup').removeClass('has-success');
		$('#addDiseaseNameGroup').addClass('has-error');
		$('#addDiseaseNameGroup .help-block').html('请输入疾病类型名称');
		return false;
	} else {
		$('#addDiseaseNameGroup').removeClass('has-error');
		$('#addDiseaseNameGroup').addClass('has-success');
		$('#addDiseaseNameGroup .help-block').html('');
		return true;
	}
}

function deleteDiseaseType(uuid) {
	$.confirm({
		keyboardEnabled : true,
		title : '删除疾病类型',
		content : '此操作会当前疾病类型、子类型以及所有类型下的所有疾病，确认删除吗？',
		confirmButtonClass : 'btn-info',
		cancelButtonClass : 'btn-danger',
		confirm : function() {
			ajaxDelete(uuid);
		}
	});
}

//异步删除疾病类型
function ajaxDelete(uuid) {
	$.ajax({
		url : "diseaseType/delete/" + uuid ,
		type : "GET" ,
		cache : false , 
		async : false , 
		dataType : "json" ,
		success : function(data) {
			if(data.result == "success") {
				$.confirm({
					keyboardEnabled : true,
					title : '删除成功',
					content : '删除疾病类型成功！',
					confirmButtonClass : 'btn-info',
					cancelButtonClass : 'btn-danger',
					autoClose : 'confirm|3000'
				});
				window.location.href='diseaseType/manage'
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