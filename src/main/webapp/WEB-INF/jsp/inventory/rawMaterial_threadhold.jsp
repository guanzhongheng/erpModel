<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<script src="js/jquery.edatagrid.js"></script>

<form id="invThreadholdForm" name="invThreadholdForm" class="contractForm" method="post">
    <input type="hidden" name="mapType" id="mapType" value=""/>
    <table class="easyui-datagrid" id="rawMaterialThreadholdInvList" title="原材料列表"
           data-options="singleSelect:false,collapsible:true,pagination:true,rownumbers:true,url:'inventory/rawmater/list',
       	method:'get',pageSize:10,fitColumns:true,toolbar:toolbar_threadhold">
        <thead>
        <tr>
            <th data-options="field:'id',hidden:true,align:'center',width:60,height:34"/>
            <th data-options="field:'code',align:'center',width:60">原材料编号</th>
            <th data-options="field:'name',align:'center',width:60">
                原材料名称
            </th>
            <th data-options="field:'supplier',align:'center',width:60">
                原材料供应商
            </th>

            <th data-options="field:'unit',align:'center',width:60">
                原材料单位
            </th>

            <th data-options="field:'threshold',align:'center',width:60,editor:{type:'textbox',options:{required:true,min:1,precision:0,height:34,validType:'thresholdValidate[]'}}">
                阀值
            </th>
        </tr>
        </thead>
    </table>
</form>

<div style="padding:5px">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitRawMaterThreadholdForm()">提交</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearRawMaterThreadholdForm()">重置</a>
</div>

<div id="toolbar_threadhold" style=" height: 22px; padding: 3px 11px; background: #fafafa;">

    <div id="search_rawMaterial" style="float: right;">
        <input type="text" name="code" id="code" size=20 placeholder="原材料编号"/>
        <input type="text" name="name" id="name" size=20 placeholder="原材料名称"/>
        <input type="text" name="supplier" id="supplier" size=20 placeholder="原材料供应商"/>
        <span class="l-btn" style="width: 50px;height: 20px;" id="search_text_user"
              onclick="doSearch_rawMaterial()">搜索</span>
    </div>

</div>


<script>

    $.extend($.fn.validatebox.defaults.rules, {
        thresholdValidate: {
            validator: function(value){
                //正则表达式需要动态传递参数，必须采用正则对象即构造器方式，传入拼接了动态参数的字符串的方式
                // var re =new RegExp("^['>','<']|[0-9]$");
                var re =new RegExp("^['>','<'](.*|[0-9])$");
                return re.test(value);
            },
            message: 'Field do not match.'
        }
    });


    function submitRawMaterThreadholdForm() {
        debugger;
        if (!$('#invThreadholdForm').form('validate')) {
            $.messager.alert('提示', '表单还未填写完成!');
            return;
        }


        var eaRows = $("#rawMaterialThreadholdInvList").datagrid('getRows');
        $.each(eaRows, function (index, item) {
            $("#rawMaterialThreadholdInvList").datagrid('endEdit', index);
        });

        var data = {};
        var prod = $("#rawMaterialThreadholdInvList").datagrid("getData");
        if (prod != null && prod != undefined) {
            data["voList"] = prod.rows;
        }


        $.ajax({
            type: "POST",
            url: 'inventory/rawmater/updateThreadholdByBatch',
            data: JSON.stringify(prod.rows),
            dataType: 'json',
            contentType: "application/json",
            cache: false,
            success: function (data) {
                if (data.status == 200) {
                    $.messager.alert('提示', data.msg);
                    $("#rawMaterialSetWindow").window('close');
                    $("#rawMaterialList").datagrid("reload");
                } else {
                    $.messager.alert('提示', data.msg);
                }


            }
        });
    }

    function clearRawMaterThreadholdForm() {
        $('#invThreadholdForm').form('reset');
        $('#rawMaterialThreadholdInvList').edatagrid({});
        // contractAddEditor.html('');
    }

</script>