<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div style="padding:10px 10px 10px 10px">

    <form id="prodCheckoutForm" name="prodCheckoutForm" class="contractForm" method="post">
        <input type="hidden" name="id" id="id"/>
        <table cellpadding="5">
            <tr>
                <td>合同编号:</td>
                <td>
                    <input class="easyui-textbox" type="text" name="contracts" value="" disabled/>
                </td>
            </tr>
            <tr>
                <td>交货日期:</td>
                <td>
                    <input class="easyui-textbox" type="text" name="deleveyDate"  disabled/>
                </td>
            </tr>

        </table>
    </form>
    <br><br>


    <form id="prodCheckoutDetailForm" name="prodCheckoutDetailForm" class="contractForm" method="post">
        <input type="hidden" name="mapType" id="mapType" value=""/>
        <table class="easyui-datagrid" id="prodCheckoutDetailList" name="prodCheckoutDetailList" title="出库详情"
               border="true" fitColumns="true"
               pagination="false" rownumbers="true" singleSelect="true" collapsible="true"
               data-options="method:'get'">
            <thead>
            <tr>
                <th data-options="field:'prodName',align:'center',width:60">
                    产品名称
                </th>
                <th data-options="field:'prodSpec',align:'center',width:60">
                    产品规格
                </th>
                <th data-options="field:'prodCode',align:'center',width:60">
                    产品编号
                </th>
                <th data-options="field:'invTotal',align:'center',width:60">
                    产品库存
                </th>
                <th data-options="field:'prodUnit',align:'center',width:60">
                    产品单位
                </th>
                <th data-options="field:'quantity',align:'center',width:60,editor:{type:'numberbox',options:{required:true,height:34,validType:'valValidate'}}">
                    出库数量
                </th>
                <%--<th data-options="field:'remark',align:'center',width:60,editor:{type:'textbox',options:{required:true,height:34,validType:'valValidate'}}">--%>
                    <%--备注--%>
                <%--</th>--%>

                <th data-options="field:'id',hidden:true"></th>
                <%--<th data-options="field:'operOutNum',hidden:true"></th>--%>
                <th data-options="field:'invId',hidden:true"></th>
            </tr>
            </thead>
        </table>
    </form>
    <br><br>

    <input type="hidden" id="checkResult" value="">

    <div style="padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitProdCheckoutForm()">提交</a>
    </div>

</div>

<br><br>


<script type="text/javascript">

    function submitProdCheckoutForm() {
        debugger;


        if (!$('#prodCheckoutDetailForm').form('validate')) {
            $.messager.alert('提示', '表单还未填写完成!');
            return;
        }

        var eaRows = $("#prodCheckoutDetailList").datagrid('getRows');
        var flag =false;
        $.each(eaRows,function(index,item){
            debugger;
            $("#prodCheckoutDetailList").datagrid('endEdit',index);
            if(item.quantity > item.invTotal){
                flag = true;
                return false;
            };
        });
        if(flag){
            $.messager.alert("警告","出库值不能大于当前库存");
            return;
        }


        var checkResult = $("#checkResult").val();
        if(checkResult.length > 0){
            $.messager.alert('提示', '出库不得大于对应存库数量！');
            return;
        }


        var data = {};
        var prod = $("#prodCheckoutDetailList").datagrid("getData");
        if (prod != null && prod != undefined) {
            data["ckLst"] = prod.rows;
        }


        $.ajax({
            type: "POST",
            url: 'inventory/doConfirmCheckout',
            data: JSON.stringify(prod.rows),
            dataType: 'json',
            contentType: "application/json",
            cache: false,
            success: function (data) {
                if (data.status == 200) {
                    $.messager.alert('提示', data.msg);
                    debugger;
                    // var contId = $("#contId").val();
                    window.location.href = "/export/productOutInfo?id=" + prod.rows[0].id;
                    $("#prodCheckoutSearchWindow").window('close');
                    $("#prodCheckoutList").datagrid("reload");
                } else {
                    $.messager.alert('提示', data.msg);
                }
            }
        });
    }
</script>
