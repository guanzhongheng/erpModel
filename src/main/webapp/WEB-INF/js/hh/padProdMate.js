
var datab ={'total':5,'rows':[{'ID':'1','num':10,'wnum':20,'ynum':20},{'ID':'2','num':10,'wnum':20,'ynum':20},{'ID':'3','num':10,'wnum':20,'ynum':20}]}


function initTable() {
    $('#editorProdTable').bootstrapTable({
        method : 'post',
        uniqueId: "ID",
        contentType : "application/x-www-form-urlencoded",
        paginationPreText : "上一页",
        paginationNextText : "下一页",
        singleSelect : false,
        sidePagination: 'server',
        striped : true, // 是否显示行间隔色
        cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination : true, // 是否显示分页（*）
        sortable : true, // 是否启用排序
        sortOrder : "asc", // 排序方式
        // queryParams: oTableInit.queryParams,//传递参数（*）
        queryParams : function(params) {
            return {
                pageNumber : params.offset + 1,
                pageSize : params.limit,
                caseCode : $("#caseCodeIncomeQuery").val(),
                toCusName : $("#toCusNameIncomeQuery").val(),
                toAccNo : $("#toAccNoIncomeQuery").val(),
                tradeAmount : $("#tradeAmountIncomeQuery").val(),
                loopNum : $("#loopNumIncomeQuery").val()
            };
        },
        pageNumber : 1, // 初始化加载第一页，默认第一页
        pageSize : 10, // 每页的记录行数（*）
        //pageList : [ 5, 10, 25, 50, 100 ], // 可供选择的每页的行数（*）
        search : false, // 是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
        strictSearch : true,
        showColumns : false, // 是否显示所有的列
        showRefresh : false, // 是否显示刷新按钮
        minimumCountColumns : 2, // 最少允许的列数
        clickToSelect : true, // 是否启用点击选中行
        uniqueId : "uid", // 每一行的唯一标识，一般为主键列
        showToggle : false, // 是否显示详细视图和列表视图的切换按钮
        cardView : false, // 是否显示详细视图
        detailView : false, // 是否显示父子表
        columns :[
            {
                field: 'ID',
                title: '序号'
            }, {
                field: 'Name',
                title: '原材料名称',
                formatter: selectProd
            }, {
                field: 'num',
                title: '剩余数量'
            },{
                field: 'wnum',
                title: '原料用量',
                formatter: unumFormatter
            },
            {
                field: 'operate',
                title: '操作',
                formatter: operateFormatter //自定义方法，添加操作按钮
            }
        ]
    });
};

function selectProd(value, row, index) {
    return ['<div class="form-group">'+
    '<select class="form-control select2" style="width: 100%;">'+
    '<option selected="selected">Alabama</option>'+
    '<option>Alaska</option>'+
    '<option disabled="disabled">California (disabled)</option>'+
    '<option>Delaware</option>'+
    '<option>Tennessee</option>'+
    '<option>Texas</option>'+
    '<option>Washington</option>'+
    '</select>'+
    '</div>'].join("");
}

function unumFormatter(value, row, index) {
    debugger;
    return ['<input type="text" id="1plan'+row.id+'" data='+value+' value='+value+' onblur="addTarget('+row.id+',1)" >'].join("")
}

function addTarget(id,type){
    debugger;
    var writevalue=$("#"+type+"plan"+id).val(); //获取改变后的输入框的值
    var oldvalue = $("#"+type+"plan"+id).attr("data"); //获取输入框原本的值

    if(!(writevalue==oldvalue)){//通过判断输入框的值是否改变，是否写入jsontarget改变的json数据
        oldvalue=writevalue;
        $("#"+type+"plan"+id).attr("data",oldvalue);
        writeJson(id,type,writevalue);
    }

}

//修改指定单元格值
function writeJson(id,type,writevalue) {
    var counts = $('#table').bootstrapTable('getData');

    for (var i = 0; i < counts.length; i++) {
        if (counts[i].id == id) {
            $('#table').bootstrapTable('updateCell', {
                index: i,
                field: 'price',
                value: writevalue
            })
        }
    }
}

function operateFormatter(value, row, index) {//赋予的参数
    return [
        '<button id="tableDelete" type="button" class="btn btn-default" onclick="destryRow('+row.ID+')">删除</button>',
    ].join('');
}

function destryRow(index){
    debugger;
    $('#editorProdTable').bootstrapTable("remove",{
        field: "ID",
        values: "" + index
    });
}

// init初始化
$(document).ready(function() {
    initTable();
    $('#editorProdTable').bootstrapTable("load",datab);
    $('#editorProdTable').bootstrapTable('hideLoading');
    $('.select2').select2();

});

function getFromJson($from){
    var params = $from.serializeArray();
    var values = {};
    for(x in params){
        values[params[x].name] = params[x].value;
    }
    var idata = JSON.stringify(values);
    return idata;
}













