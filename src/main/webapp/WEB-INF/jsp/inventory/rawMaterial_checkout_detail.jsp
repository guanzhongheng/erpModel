<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div style="padding:10px 10px 10px 10px">

    <form id="rawmaterCheckoutDetailForm" name="rawmaterCheckoutDetailForm" class="contractForm" method="post">
        <input type="hidden" name="id" id="id"/>
        <table cellpadding="5">
            <tr>
                <td>申请人:</td>
                <td>
                    <input id="appt" class="easyui-textbox" type="text" name="applicant" value="" disabled/>
                </td>
            </tr>
            <tr>
                <td>申请时间:</td>
                <td>
                    <input class="easyui-textbox" type="text" name="applyDate"  disabled/>
                </td>
            </tr>

        </table>
    </form>
    <br><br>


    <form id="rawCheckoutDetailForm" name="rawCheckoutDetailForm" class="contractForm" method="post">
        <input type="hidden" name="mapType" id="mapType" value=""/>
        <table class="easyui-datagrid" id="rawCheckoutDetailList" name="rawCheckoutDetailList" title="出库详情"
               border="true" fitColumns="true"
               pagination="false" rownumbers="true" singleSelect="true" collapsible="true"
               data-options="method:'get'">
            <thead>
            <tr>
                <th data-options="field:'rawCode',align:'center',width:60">
                    原材料编号
                </th>
                <th data-options="field:'rawName',align:'center',width:60">
                    原材料名称
                </th>
                <th data-options="field:'rawSupplier',align:'center',width:60">
                    原材料供应商
                </th>
                <th data-options="field:'rawInvTotal',align:'center',width:60">
                    原材料库存
                </th>
                <th data-options="field:'rawUnit',align:'center',width:60">
                    产品单位
                </th>
                <th data-options="field:'outNum',align:'center',width:60,editor:{type:'numberbox',options:{required:true,height:34,validType:'valValidate'}}">
                    出库数量
                </th>

                <th data-options="field:'id',hidden:true"></th>
                <th data-options="field:'operOutNum',hidden:true"></th>
                <th data-options="field:'invId',hidden:true"></th>
                <th data-options="field:'rawmtOutCode',hidden:true"></th>
                <th data-options="field:'applicant',hidden:true"></th>
            </tr>
            </thead>
        </table>
    </form>
    <br><br>

    <input type="hidden" id="checkResult" value="">

    <div style="padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitRawMaterCheckoutForm()">提交</a>
    </div>


</div>


<script type="text/javascript">

    function submitRawMaterCheckoutForm() {
        debugger;


        if (!$('#rawCheckoutDetailForm').form('validate')) {
            $.messager.alert('提示', '表单还未填写完成!');
            return;
        }

        var eaRows = $("#rawCheckoutDetailList").datagrid('getRows');
        var flag =false;
        $.each(eaRows,function(index,item){
            debugger;
            $("#rawCheckoutDetailList").datagrid('endEdit',index);
            if(item.outNum > item.rawInvTotal){
                flag = true;
                return false;
            };
            item.applicant=$('#appt').val();
        });
        if(flag){
            $.messager.alert("警告","出库值不能大于当前库存");
            return;
        }


        var checkResult = $("#checkResult").val();
        if(checkResult.length > 0){
            $.messager.alert('提示', '原材料出库不得大于对应存库数量！');
            return;
        }


        var data = {};
        var prod = $("#rawCheckoutDetailList").datagrid("getData");
        if (prod != null && prod != undefined) {
            data["ckLst"] = prod.rows;
        }


        $.ajax({
            type: "POST",
            url: 'inventory/rawmater/doConfirmCheckout',
            data: JSON.stringify(prod.rows),
            dataType: 'json',
            contentType: "application/json",
            cache: false,
            success: function (data) {
                if (data.status == 200) {
                    $.messager.alert('提示', data.msg);
                    $("#rawMaterialCheckoutSearchWindow").window('close');
                    $("#rawMaterialCheckoutList").datagrid("reload");
                } else {
                    $.messager.alert('提示', data.msg);
                }
            }
        });
    }
</script>