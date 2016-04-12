/**
 * Created by ranran on 2016/3/23.
 */
$(document).ready(function(){
    
    //删除一个医院管理员
    $(".deleteHospitalManager").confirm(
        {
            keyboardEnabled : true,
            title : '删除医院管理员',
            content : '此操作会删除该医院管理员，而且操作不可撤销，确定删除？',
            confirmButtonClass : 'btn-info',
            cancelButtonClass : 'btn-danger',
            confirm : function() {}
        }
    );

    //删除一个居民
    $(".deleteResident").confirm(
        {
            keyboardEnabled : true,
            title : '删除一个居民信息',
            content : '此操作会删除该居民，而且操作不可撤销，确定删除？',
            confirmButtonClass : 'btn-info',
            cancelButtonClass : 'btn-danger',
            confirm : function() {}
        }
    );
});
