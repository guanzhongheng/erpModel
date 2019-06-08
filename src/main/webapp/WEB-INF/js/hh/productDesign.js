/**
 * add by show
 */
var $table = $('#treeTable');
var IDKEY = 'prodId';
var IDNAME = 'prodName';
var PID = 'parentId';
var LEVEL = 'STATELEVEL';
var topLayer = top.layer || window.layer;
// 当页的弹出层
var winLayer = window.layer;

var productDesign = {
    init :function(){
        productDesign.initTable();
    },

    initTable : function () {
        /**
         * 初始化表格
         */
        $table.treegrid({
            fit: false,
            checkbox: false,
            idField: IDKEY,
            treeField: IDNAME,
            cascadeCheck: false,
            lines: false,
            striped:true,
            onBeforeSelect: function(row) {
                $('.chk').prop('checked', false);
                var id = row[IDKEY];
                var selected = $table.treegrid("getSelected");
                if(selected && selected[IDKEY] === id) {
                    $table.treegrid("unselect", id);
                    return false;
                }
                $('#datagrid-row-r1-1-' + id).find(':checkbox').prop('checked', true);

                return true;
            },
            columns: [
                    [   {
                        title: "产品名称",
                        field: 'prodName',
                        width: "15%",
                        align: 'center'
                    },
                    {
                        title: "产品规格",
                        field: 'specification',
                        width: "15%",
                        align: 'center'
                    },
                    {
                        title: "产品编号",
                        field: 'prodCode',
                        width: "15%",
                        align: 'center'
                    },
                    {
                        title: "产品数量",
                        field: 'quantity',
                        width: "10%",
                        align: 'center'
                    },
                    {
                        title: "产品单位",
                        field: 'prodUnit',
                        width: "15%",
                        align: 'center'
                    },
                    {
                        title: "备注",
                        field: 'remark',
                        width: 150,
                        align: 'center'
                    }
                ]
            ]
        });
    },
}

var aOriginData;
var aRootData = [];
function tProcessData(data) {
    debugger;
    aOriginData = data || [];
    for(var i = 0, j = aOriginData.length; i < j; i++) {
        var tmpData = aOriginData[i];
        if(tmpData[PID] == 0) {
            tmpData[LEVEL] = 1;
            aRootData.push(tmpData);
        } else {
            break;
        }
    }
    for(var i = 0, j = aRootData.length; i < j; i++) {
        loopChild(aRootData[i]);
    }
    return aRootData;
}

function loopChild(data) {
    debugger;
    var id = data[IDKEY];
    for (var i = 0, j = aOriginData.length; i < j; i++) {
        var tmpData = aOriginData[i];
        if (tmpData[PID] == id) {
            tmpData[LEVEL] = data[LEVEL] + 1;
            data.state = "closed";
            data.children = data.children || [];
            data.children.push(tmpData);
            loopChild(tmpData);
        }
    }
}
/**
 * 页面初始化之后的回调函数
 */
function page_init_complete_callback() {

    /**
     * 新增按钮事件
     */
    $('#btn_add').on('click', function() {

        $("#proDesignAddWindow").window("open");

    });

    /**
     * 修改按钮事件
     */
    $('#btn_edit').on('click', function() {
        var selected = $table.treegrid("getSelected");
        //console.info(selected);

        if(!selected) {
            $.messager.alert('提示','选择需要操作的行');
            return;
        }

        var width = '95%';
        if(screen.width > 1600) {
            width = parseInt(1600 / screen.width * 100) + '%';
        }


        $("#proDesignEditWindow").window({
            onLoad :function(){
                debugger;
                $("#proDesinEditorForm").form("load",selected);
            }
        }).window("open");


    });

    /**
     * 删除
     */
    // function _delete(contId,contDetailId,id, pid) {
    //     // 显示加载层
    //     var layer_index = winLayer.load(0, {
    //         shade: [0.2, '#000']
    //     });
    //
    //     debugger;
    //     $.ajax({
    //         url: 'contract/deleteProDesin',
    //         type: "POST",
    //         dataType: "json",
    //         data: {
    //             contId: contId,
    //             contDetailId: contDetailId,
    //             prodId: id,
    //             parentId: pid
    //         },
    //         success: function(res) {
    //             //console.info(res);
    //             if(res && res.code==200) {
    //                 refresh();
    //                 // 关闭加载层
    //                 winLayer.close(layer_index);
    //             } else {
    //                 // 关闭加载层
    //                 winLayer.close(layer_index);
    //                 winLayer.msg(layerTxt.delFail, {
    //                     icon: 2, // 0感叹号1确认，2X号，3问号，4锁定，5哭
    //                     time: 2000
    //                     // 2秒后关闭
    //                 });
    //             }
    //         },
    //         error: function() {
    //             winLayer.close(layer_index);
    //         }
    //     });
    // }

    /**
     * 删除事件
     */
    // $('#btn_delete').on('click', function() {
    //     var selected = $table.treegrid("getSelected");
    //     //console.info(selected);
    //    debugger;
    //     if(!selected) {
    //         winLayer.msg(layerTxt.option + kpistateTxt.index,{icon:0});
    //         return;
    //     }
    //
    //     var id = selected[IDKEY];
    //     var pid = selected[PID];
    //     var contDetailId = selected['contDetailId'];
    //     var contId = selected['contId'];
    //
    //
    //
    // })


}

$(document).ready(function () {
    productDesign.init();
})
