$(function(){
	$('#idNo-input').typeahead( {
		ajax : {
			url: 'resident/getByDimIdNo',
		    timeout: 300,
		    method: 'post',
		    triggerLength: 3,
		    loadingClass: null,
		    displayField: null,
		    preDispatch: null,
		    preProcess: null
		},
		display: "name",     // 默认的对象属性名称为 name 属性
        val: "uuid",           // 默认的标识属性名称为 id 属性
        items: 8,            // 最多显示项目数量
        itemSelected: function (item, val, text) {      // 当选中一个项目的时候，回调函数
            $('#idNo').attr('uuid',val);
            getResident(val);
            $('#detail').show();
        }
	});
	
	$('#btn-clear').on('click', function(){
		$('#idNo-input').val('');
		clear();
		$('#detail').hide();
	});
});

function getResident(uuid) {
	$.ajax({
			url : "resident/getResidentAndDiseaseHistory/" + uuid ,
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == 'success') {
					clear();
					//赋值
					$('#name').html(data.resident.name);
					$('#idNo').html(data.resident.idNo);
					$('#sex').html(data.resident.sex == 0?'男':'女');
					$('#age').html(data.resident.age);
					if(data.diseaseHistories.length == 0) {
						$('#diseaseHistory').append('无');
					} else {
						for(var i in data.diseaseHistories) {
							$('#diseaseHistory').append('<h5>' + data.diseaseHistories[i].name + '</h5>');
						}
					}
				} else {
					$.confirm({
						keyboardEnabled : true,
						title : '查询失败',
						content : '请您稍后再试！',
						autoClose : 'confirm|3000'
					});
				}
			} 
	});
}

function clear() {
	$('#name').html('');
	$('#idNo').html('');
	$('#sex').html('');
	$('#age').html('');
	$('#diseaseHistory').html('');
}

