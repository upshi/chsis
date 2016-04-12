$(document).ready(function(){
	//下拉菜单
    $.getJSON('assets/json/diploma.json',function(data){
        for(var i in data) {
            $('#diploma').append('<option>' + data[i].name + '</option>');
        }
    });
    $.getJSON('assets/json/title.json',function(data){
        for(var i in data) {
            $('#title').append('<option>' + data[i].name + '</option>');
        }
    });
    $.getJSON('assets/json/nation.json',function(data){
        for(var i in data) {
            $('#nation').append('<option>' + data[i].name + '</option>');
        }
    });
    $.getJSON('assets/json/period.json',function(data){
        for(var i in data) {
            $('#period').append('<option>' + data[i].name + '</option>');
        }
    });
    $.getJSON('assets/json/marriage.json',function(data){
        for(var i in data) {
            $('#marriage').append('<option>' + data[i].name + '</option>');
        }
    });
    
});
