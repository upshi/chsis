$(document).ready(function(){
    //删除一个科室
    $(".deleteDepartment").confirm(
        {
        keyboardEnabled : true,
        title : '删除科室',
        content : '此操作会删除该科室及该科室下的所有医生，而且操作不可撤销，确定删除？',
        confirmButtonClass : 'btn-info',
        cancelButtonClass : 'btn-danger',
        confirm : function() {}
        }
    );

    //删除医生
    $(".deleteDoctor").confirm(
        {
            keyboardEnabled : true,
            title : '删除医生',
            content : '此操作会删除该医生的所有信息，而且操作不可撤销，确定删除？',
            confirmButtonClass : 'btn-info',
            cancelButtonClass : 'btn-danger',
            confirm : function() {}
        }
    );
});
