<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet">

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
    <form id="deliveryDetailSearchForm" name="deliveryDetailSearchForm" class="rawMaterial" method="post">
        <input type="hidden" name="id"/>
        <table cellpadding="5">
            <tr>
                <td>出库单号:</td>
                <td>
                    <input class="easyui-textbox" type="text" name="deliveryCode"/>
                </td>
            </tr>
            <tr>
                <td>合同编号:</td>
                <td>
                    <input class="easyui-textbox" type="text" name="contracts"/>
                </td>
            </tr>
            <tr>
                <td>发货日期:</td>
                <td>
                    <input class="easyui-textbox" type="text" name="deleveyDate"/>
                </td>
            </tr>
            <tr>
                <td>发货地址:</td>
                <td>
                    <input class="easyui-textbox" type="text" name="deleveyAddress" />
                </td>
            </tr>
        </table>
    </form>
    <br><br>
    <table class="easyui-datagrid" id="deliveryDetailSearchList" name="deliveryDetailSearchList" title="出库产品" border="true" fitColumns="true"
           pagination="true" rownumbers="true" singleSelect="true" collapsible="true"
           data-options="">
        <thead>
        <tr>
            <th data-options="field:'contCode',align:'center',width:60">合同编号
            </th>
            <th data-options="field:'prodName',align:'center',width:60">
                产品名称
            </th>
            <th data-options="field:'prodCode',align:'center',width:60">
                产品编号
            </th>
            <th data-options="field:'prodSpec',align:'center',width:60">
                产品规格
            </th>
            <th data-options="field:'quantity',align:'center',width:60">
                出库数量
            </th>
            <th data-options="field:'prodUnit',align:'center',width:60">
                产品单位
            </th>
            <th data-options="field:'deleveyDate',align:'center',width:60">
                合同交付日期
            </th>
        </tr>
        </thead>
    </table>
</div>
<script type="text/javascript">

</script>
