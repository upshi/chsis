$(function() {
	
	//日期选框
	$(".default-date-picker").datepicker({
        format: "yyyy-mm",
        todayBtn: "linked",
        clearBtn: true,
        todayHighlight: true,
        language: 'zh-CN',
        startView : 1
    });
	
	//路径配置
	require.config({
		paths : {
			echarts : 'assets/echarts'
		}
	});

	// 使用
	require(
		[ 'echarts',
		  'echarts/chart/bar', 
		  'echarts/chart/line', 
		  'echarts/chart/pie' 
		], draw);
	
	//页面加载时先把一级疾病加载出来
	$.ajax({
			url : "diseaseType/getDiseaseType/one",
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == "success") {
					for(var i in data.diseaseTypes) {
	           			$('#initSelect').append('<option last="'+ data.diseaseTypes[i].last + '" value="' + data.diseaseTypes[i].uuid + '">' + data.diseaseTypes[i].name + '</option>');
			        }
				}
			} 		
		});
	$('.diseaseTypeSelect').on('change', onSelect);
	
	//选择疾病名称确定时的点击事件
	$('#submit').on('click', function() {
		selectDisease($(this).attr('uuid'));
		return false;
	});

});	
	
function draw(ec) {
	// 基于准备好的dom，初始化echarts图表
	var myChart = ec.init(document.getElementById('main'));

	option = {
			title : {
				text : '某地区蒸发量和降水量',
				subtext : '纯属虚构'
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : [ '蒸发量', '降水量' ]
			},
			toolbox : {
				show : true,
				feature : {
					mark : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : false
					},
					magicType : {
						show : true,
						type : [ 'line', 'bar' ]
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			calculable : true,
			xAxis : [ {
				type : 'category',
				data : [ '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月',
						'10月', '11月', '12月' ]
			} ],
			yAxis : [ {
				type : 'value'
			} ],
			series : [
					{
						name : '蒸发量',
						type : 'bar',
						data : [ 2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2,
								32.6, 20.0, 6.4, 3.3 ],
						markPoint : {
							data : [ {
								type : 'max',
								name : '最大值'
							}, {
								type : 'min',
								name : '最小值'
							} ]
						},
						markLine : {
							data : [ {
								type : 'average',
								name : '平均值'
							} ]
						}
					},
					{
						name : '降水量',
						type : 'bar',
						data : [ 2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2,
								48.7, 18.8, 6.0, 2.3 ],
						markPoint : {
							data : [ {
								name : '年最高',
								value : 182.2,
								xAxis : 7,
								yAxis : 183,
								symbolSize : 18
							}, {
								name : '年最低',
								value : 2.3,
								xAxis : 11,
								yAxis : 3
							} ]
						},
						markLine : {
							data : [ {
								type : 'average',
								name : '平均值'
							} ]
						}
					} ]
		};

	// 为echarts对象加载数据 
	myChart.setOption(option);
}

function selectDisease(uuid) {
	//取到最后一个select框的选中的 option
	var option = $('#selectDiv').find('select').last().find('option:selected');
	//判断有没有last属性，如果有且last属性是0或1,说明选择的是疾病类型而非疾病，提醒。
	var last = $(option).attr('last');
	if(last == '0' || last== '1') {
		$.confirm({
			keyboardEnabled : true,
			title : '选择错误',
			content : '请选择具体疾病',
			confirmButtonClass : 'btn-info',
			cancelButtonClass : 'btn-danger',
			autoClose : 'confirm|3000'
		});
	}
	
	//如果选择的是疾病，则获取疾病的uuid，更改就诊记录的疾病属性。
	var diseaseUuid = $(option).attr('value');
	var diseaseName = $(option).text();
	/*
	$.ajax({
		url : "medicalRecord/editDiseaseName" ,
		type : "POST" ,
		data : {'uuid' : uuid, 'disease.uuid' : diseaseUuid},
		cache : false , 
		async : false , 
		dataType : "json" ,
		success : function(data) {
			$('#diseaseName').text(diseaseName);
			$('#editDiseaseName').modal('hide');
		} 
	});
	*/
	
}

//级联查询疾病，放在select里
function onSelect() {
	$(this).nextAll('select').remove();
	var last = $(this).find('option:selected').attr('last');
	var value = $(this).attr('value');
	if(last == '0') {
		onSelectDiseaseType(value);
	} else {
		onSelectDisease(value);
	}
}

function onSelectDiseaseType(diseaseTypeUuid) {
	$.ajax({
		url : "diseaseType/getByParent/" + diseaseTypeUuid ,
		type : "GET" ,
		cache : false , 
		async : false , 
		dataType : "json" ,
		success : function(data) {
			if(data.result == "success") {
				if(data.diseaseTypes.length != 0) {
					var newSelect = '<select class="form-control diseaseTypeSelect">';
					for(var i in data.diseaseTypes) {
						newSelect += '<option last="'+ data.diseaseTypes[i].last + '" value="'+ data.diseaseTypes[i].uuid + '">'+ data.diseaseTypes[i].name +'</option>';
					}
					newSelect += '</select>';
					$('#selectDiv').append(newSelect);
					$('.diseaseTypeSelect').on('change', onSelect);
				}
			} 
		} 
	});
}

function onSelectDisease(diseaseTypeUuid) {
	$.ajax({
		url : "disease/getByDiseaseType/" + diseaseTypeUuid ,
		type : "GET" ,
		cache : false , 
		async : false , 
		dataType : "json" ,
		success : function(data) {
			if(data.result == "success") {
				if(data.diseases.length != 0) {
					var newSelect = '<select class="form-control">';
					for(var i in data.diseases) {
						newSelect += '<option value="'+ data.diseases[i].uuid + '">'+ data.diseases[i].name +'</option>';
					}
					newSelect += '</select>';
					$('#selectDiv').append(newSelect);
				}
			} 
		} 
	});
}