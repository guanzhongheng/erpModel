<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<table class="easyui-datagrid" id="deliveryList" title="出库单"
       data-options="singleSelect:false,collapsible:true,pagination:true,rownumbers:true,url:'deliveryList/list',
       	method:'get',pageSize:10,fitColumns:true,toolbar:toolbar_deliveryList">
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'id',hidden:true">序号</th>
        <th data-options="field:'deliveryCode',align:'center',width:60">出库单号</th>
        <th data-options="field:'contracts',align:'center',width:60">合同编号</th>
        <th data-options="field:'deleveyDate',align:'center',width:60">发货日期</th>
        <th data-options="field:'deleveyAddress',align:'center',width:60">发货地址</th>
        <th data-options="field:'nid',align:'center',width:120,formatter:formatDeliveryListOper">操作</th>
    </tr>
    </thead>
</table>

<div id="toolbar_deliveryList" style=" height: 22px; padding: 3px 11px; background: #fafafa;">

    <c:forEach items="${sessionScope.sysPermissionList}" var="per" >
        <c:if test="${per=='deliveryList:add' }" >
            <div style="float: left;">
                <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="deliveryList_add()">新增</a>
            </div>
        </c:if>
    </c:forEach>

    <div class="datagrid-btn-separator"></div>

    <div style="float: left;">
        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="deliveryList_reload()">刷新</a>
    </div>

    <div id="search_inventory" style="float: right;">
        <input type="text" name="contracts" id="contracts" size=20 placeholder="合同编号"/>
        <span class="l-btn" style="width: 50px;height: 20px;" id="search_text_deliveryList"
              onclick="doSearch_inventory()">搜索</span>
    </div>
</div>
<div id="deliveryListAddWindow" class="easyui-window" title="添加出库单" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'deliveryList/add'" style="width:45%;height:75%;padding:10px;">
</div>
<div id="deliveryDetailSearchWindow" class="easyui-window" title="查看出库产品信息" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'deliveryList/search'" style="width:45%;height:70%;padding:10px;">
</div>
<script>

    function formatDeliveryListOper(value, row, index) {
        var $row = JSON.stringify(row).replace(/\"/g,"'");
        return '<a href="#" onclick="deliveryDetail_search('+$row+')" >查看明细</a>';
    }

    function deliveryDetail_search(value){
        $("#deliveryDetailSearchWindow").window({
            onLoad :function(){
                //回显数据
                $("#deliveryDetailSearchForm").form("load", value);
                $("#deliveryDetailSearchList").datagrid({
                    url:"/deliveryList/" + value.id + "/detail"
                })
                $('input,select,textarea',$('form[name="deliveryDetailSearchForm"]')).prop('readonly',true);
            }
        }).window("open");
    }

    function deliveryList_add(){
        debugger;
        $.get("deliveryList/add",'',function(data){
            if(data.msg != null){
                $.messager.alert('提示', data.msg);
            }else{
                $("#deliveryListAddWindow").window("open");
            }
        });
    }
    function doSearch_inventory() { //用户输入用户名,点击搜素,触发此函数

        $('#deliveryList').datagrid('load', {
            contracts: $('#contracts').val()
        });
    }
    function deliveryList_reload() {
        $("#deliveryList").datagrid("reload");
    }
</script>