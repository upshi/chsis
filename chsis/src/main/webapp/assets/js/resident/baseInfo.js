$(function(){
	onloadModal();
	
	var nationCode = Number($('#nationCode').attr('nationCode'));
	$('#nationCode').html(getNation(nationCode));
})

function onloadModal() {
	$.getJSON('assets/json/nation.json',function(data) {
		var nationCode = $('#nation').attr('nationCode');
        for(var i in data) {
        	if(nationCode == data[i].value){
        		$('#nation').append('<option value="' + data[i].value + '" selected>' + data[i].name + '</option>');
        	}else{
           		$('#nation').append('<option value="' + data[i].value + '">' + data[i].name + '</option>');
        	}	
        }
    });
    $.getJSON('assets/json/period.json',function(data) {
    	var periodCode = $('#period').attr('periodCode');
        for(var i in data) {
        	if(periodCode == data[i].value){
        		$('#period').append('<option value="' + data[i].value + '" selected>' + data[i].name + '</option>');
        	}else{
        		$('#period').append('<option value="' + data[i].value + '">' + data[i].name + '</option>');
        	}
        }
    });
    $.getJSON('assets/json/marriage.json',function(data) {
    	var marriageCode = $('#marriage').attr('marriageCode');
        for(var i in data) {
        	if(marriageCode == data[i].value){
        		$('#marriage').append('<option value="' + data[i].value + '" selected>' + data[i].name + '</option>');
        	}else{
        		$('#marriage').append('<option value="' + data[i].value + '">' + data[i].name + '</option>');
        	}
        }
    });
    
	//绑定点击修改基本信息按钮事件
	$('.btn-edit-baseInfo').on('click', function(){
		onEditBaseInfo();
	});
}

//打开修改居民基本信息的模态框
function onEditBaseInfo(){
	$('#editBaseInfo').modal();
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