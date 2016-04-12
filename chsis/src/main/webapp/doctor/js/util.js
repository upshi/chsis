/**
 * Created by ranran on 2016/3/23.
 */
$(document).ready(function(){
    $.getJSON('json/diploma.json',function(data){
        for(var i in data) {
            $('#diploma').append('<option>' + data[i].name + '</option>');
        }
    });
    $.getJSON('json/title.json',function(data){
        for(var i in data) {
            $('#title').append('<option>' + data[i].name + '</option>');
        }
    });
});
