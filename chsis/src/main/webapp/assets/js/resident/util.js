/**
 * Created by ranran on 2016/3/23.
 */
$(document).ready(function(){
    //删除一个家庭成员
    $(".deleteMember").confirm(
        {
            keyboardEnabled : true,
            title : '删除家庭成员',
            content : '此操作会删除该家庭成员，而且操作不可撤销，确定删除？',
            confirmButtonClass : 'btn-info',
            cancelButtonClass : 'btn-danger',
            confirm : function() {}
        }
    );

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })
});
