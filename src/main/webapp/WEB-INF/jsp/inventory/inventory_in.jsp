<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet">
<script src="js/jquery.uploadfile.js"></script>
<script src="js/jquery.edatagrid.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">

    <form id="" name="" class="contractForm" method="post">
        <table cellpadding="5">
            <tr>
                <td>合同名称:</td>
                <td>
                    <select id="changeContact" class="easyui-combobox" name="roleId"  panelHeight="auto" data-options="valueField:'contId',
	            		textField:'contName',url:'contract/validContract?status=1',required:true, editable:false,align:'center',width:90"/>
                </td>
            </tr>
        </table>
    </form>

    <form id="invInForm" name="invInForm" class="contractForm" method="post">
        <input type="hidden" name="id"/>
        <input type="hidden" name="mapType" id="mapType" value=""/>
        <table class="easyui-datagrid" id="invAddList" title="库存列表"
               data-options="singleSelect:false,collapsible:true,pagination:true,rownumbers:true,url:'inventory/listAll',
            	method:'get',pageSize:10,fitColumns:true">
            <thead>
            <tr>
                <%--<th data-options="field:'ck',checkbox:true"></th>--%>
                <th data-options="field:'id',hidden:true,align:'center',width:60"/>
                <th data-options="field:'proName',align:'center',width:60">产品名称</th>
                <th data-options="field:'conCode',align:'center',width:60">合同编号</th>
                <th data-options="field:'conNeedTotal',align:'center',width:60">合同数量</th>
                <th data-options="field:'invTotal',align:'center',width:60">库存数量</th>
                <th data-options="field:'addNum',width:60,align:'center',editor:{type:'textbox',options:{required:true,height:34}}" >入库数量</th>
                <th data-options="field:'unit',width:60,align:'center',editor:{type:'textbox',options:{required:true,height:34}}">单件重量</th>
            </tr>
            </thead>
        </table>
    </form>
    <br><br>

    <div style="padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitInvAddEditForm()">提交</a>
    </div>

</div>
<script type="text/javascript">

    $(function () {
        $("#changeContact").combobox({
            onChange: function (nvalue, ovalue) {
                debugger;
                    $("#invAddList").edatagrid({
                        url: "inventory/listAll",
                        pagination: true,
                        queryParams: {
                            contId: nvalue
                        }
                    })

            }
        })
    })


    function changeTable(data){
        alert("1");
        debugger;
    }


    function submitInvAddEditForm() {

        debugger;
        if (!$('#invInForm').form('validate')) {
            $.messager.alert('提示', '表单还未填写完成!');
            return;
        }

        var eaRows = $("#invAddList").datagrid('getRows');
        $.each(eaRows,function(index,item){
            $("#invAddList").datagrid('endEdit',index);
        });

        var data = {};
        var prod = $("#invAddList").datagrid("getData");
        if (prod != null && prod != undefined) {
            data["invList"] = prod.rows;
        }

        $.ajax({
            type: "POST",
            url: 'inventory/updateBatch',
            data: JSON.stringify(prod.rows),
            dataType: 'json',
            contentType: "application/json",
            cache: false,
            success: function (data) {
                if (data.status == 200) {
                    $.messager.alert('提示', data.msg);
                    $("#inventoryAddWindow").window('close');
                    $("#inventoryList").datagrid("reload");
                } else {
                    $.messager.alert('提示', data.msg);
                }
            }
        });
    }
</script>
