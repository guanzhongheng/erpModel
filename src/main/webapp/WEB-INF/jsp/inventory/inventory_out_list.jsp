<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="js/jquery.edatagrid.js"></script>
<table class="easyui-datagrid" id="prodCheckoutList" title="产品出库申请列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,rownumbers:true,url:'deliveryList/listUnDeal',
       	method:'get',pageSize:10,fitColumns:true,toolbar:toolbar_prodcheckout">
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'id',hidden:true,align:'center',width:60"/>
        <th data-options="field:'deliveryCode',align:'center',width:60">出库单号</th>
        <th data-options="field:'contracts',width:60,align:'center'">合同编号</th>
        <th data-options="field:'deleveyDate',align:'center',width:60">发货日期</th>
        <th data-options="field:'deleveyAddress',width:60,align:'center'">发货地址</th>
        <th data-options="field:'createUser',width:60,align:'center'">申请人</th>
        <th data-options="field:'nid',align:'center',width:120,formatter:formatProdCheckoutOper">操作</th>
        <%--<th data-options="field:'attachment',width:60,align:'center', formatter:formatImg">附件信息</th>--%>
    </tr>
    </thead>
</table>
<div id="toolbar_prodcheckout" style=" height: 22px; padding: 3px 11px; background: #fafafa;">

    <div class="datagrid-btn-separator"></div>

    <div style="float: left;">
        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="prodcheckout_reload()">刷新</a>
    </div>

    <div id="search_prodcheckout" style="float: right;">
        <input type="text" name="contracts" id="contracts" size=20 placeholder="合同编号"/>
        <span class="l-btn" style="width: 50px;height: 20px;" id="search_text_user"
              onclick="doSearch_prodcheckout()">搜索</span>
    </div>

</div>
<div id="prodCheckoutSearchWindow" class="easyui-window" title="出库审核" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'inventory/checkoutDetail'" style="width:45%;height:60%;padding:10px;">
</div>
<br><br>


<script type="text/javascript">

    function formatProdCheckoutOper(value, row, index) {
        var $row = JSON.stringify(row).replace(/\"/g, "'");
        return '<a href="#" onclick="prod_checkout_search(' + $row + ')" >申请明细</a>';
    };

    function doSearch_prodcheckout() { //用户输入合同编号,点击搜素,触发此函数

        $('#prodCheckoutList').datagrid('load', {
            contracts: $('#contracts').val()
        });
    }

    function prod_checkout_search(value) {

        $("#prodCheckoutSearchWindow").window({
            onLoad: function () {
                //回显数据
                debugger;
                // var data = $("#rawMaterialCheckoutList").datagrid("getSelections")[0];
                $("#prodCheckoutForm").form("load", value);

                $("#prodCheckoutDetailList").edatagrid({
                    url: 'deliveryList/doCheckoutDetail?id=' + value.id, autoSave: true
                });
            }
        }).window("open");

    }


    function prodcheckout_reload() {
        $("#prodCheckoutList").datagrid("reload");
    }
</script>
