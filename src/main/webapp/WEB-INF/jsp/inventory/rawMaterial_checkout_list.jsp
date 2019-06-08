<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="js/jquery.edatagrid.js"></script>

<table class="easyui-datagrid" id="rawMaterialCheckoutList" title="出库申请列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,rownumbers:true,url:'inventory/rawmater/checkoutlist',
       	method:'get',pageSize:10,fitColumns:true,toolbar:toolbar_rawcheckout">
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'id',hidden:true,align:'center',width:60"/>
        <th data-options="field:'rawmtOutCode',align:'center',width:60">申请单编号</th>
        <th data-options="field:'applicant',align:'center',width:60">申请人</th>
        <th data-options="field:'applyDate',width:60,align:'center'">申请时间</th>
        <th data-options="field:'nid',align:'center',width:120,formatter:formatRawMaterCheckoutOper">操作</th>
        <%--<th data-options="field:'attachment',width:60,align:'center', formatter:formatImg">附件信息</th>--%>
    </tr>
    </thead>
</table>
<div id="toolbar_rawcheckout" style=" height: 22px; padding: 3px 11px; background: #fafafa;">

    <div class="datagrid-btn-separator"></div>

    <div style="float: left;">
        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="rawMaterialCheckout_reload()">刷新</a>
    </div>

    <div id="search_rawMaterial" style="float: right;">
        <input type="text" name="applicant" id="code" size=20 placeholder="申请人"/>
        <span class="l-btn" style="width: 50px;height: 20px;" id="search_text_user"
              onclick="doSearch_rawMaterCheckout()">搜索</span>
    </div>

</div>
<div id="rawMaterialCheckoutSearchWindow" class="easyui-window" title="出库审核" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'inventory/rawmater/checkoutDetail'" style="width:45%;height:60%;padding:10px;">
</div>


<script>

    function formatRawMaterCheckoutOper(value, row, index) {
        var $row = JSON.stringify(row).replace(/\"/g, "'");
        return '<a href="#" onclick="rawMater_checkout_search(' + $row + ')" >申请明细</a>';
    };

    function doSearch_rawMaterCheckout() { //用户输入用户名,点击搜素,触发此函数

        $('#rawMaterialCheckoutList').datagrid('load', {
            applicant: $('#applicant').val()
        });
    }

    function rawMater_checkout_search(value) {

        $("#rawMaterialCheckoutSearchWindow").window({
            onLoad: function () {
                //回显数据
                debugger;
                // var data = $("#rawMaterialCheckoutList").datagrid("getSelections")[0];
                $("#rawmaterCheckoutDetailForm").form("load", value);

                $("#rawCheckoutDetailList").edatagrid({
                    url: 'inventory/rawmater/doCheckoutDetail?code=' + value.rawmtOutCode, autoSave: true
                });
            }
        }).window("open");

    }


    function rawMaterialCheckout_reload() {
        $("#rawMaterialCheckoutList").datagrid("reload");
    }
</script>