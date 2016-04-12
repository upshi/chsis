$(document).ready(function(){
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
    $.getJSON('assets/json/bloodType.json',function(data){
        for(var i in data) {
            $('#bloodType').append('<option>' + data[i].name + '</option>');
        }
    });
    $.getJSON('assets/json/medicalHistory.json',function(data){
        for(var i in data) {
            $('#medicalHistory').append('<option>' + data[i].name + '</option>');
        }
    });
});
