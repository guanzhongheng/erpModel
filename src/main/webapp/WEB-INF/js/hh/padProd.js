

function initSelect() {
    $("#contact").empty();
    var option="<option>--请选择--</option>"
    $.ajax({
        url:"contract/validContract?status=1",
        type: "get",
        dataType:'json',
        cache: false,
        success: function(data){
            if(data != null){
                option += "<option value='"+data+"'>"+data+"</option>"
            }
        }
    })


    $("#contact").append();
}




function initTable() {

}

















// init初始化
$(document).ready(function() {
    initSelect();
    initTable();

});