$(document).ready(function(){
    //下拉菜单
    $.getJSON('json/title.json',function(data){
        for(var i in data) {
            $('#title').append('<option>' + data[i].name + '</option>');
        }
    });
    $.getJSON('json/diploma.json',function(data){
        for(var i in data) {
            $('#diploma').append('<option>' + data[i].name + '</option>');
        }
    });
});
