<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<table class="easyui-datagrid" id="inventoryList" title="库存列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,rownumbers:true,url:'inventory/list',
       	method:'get',pageSize:10,fitColumns:true,toolbar:toolbar_inventory">
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'id',hidden:true,align:'center',width:60"/>
        <th data-options="field:'contId',hidden:true,align:'center',width:60"/>
        <th data-options="field:'proName',align:'center',width:60">产品名称</th>
        <th data-options="field:'conCode',align:'center',width:60">合同编号</th>
        <th data-options="field:'conNeedTotal',align:'center',width:60">合同数量</th>
        <th data-options="field:'invTotal',align:'center',width:60">库存数量</th>
        <th data-options="field:'conUnShipTotal',width:60,align:'center'">已发货数量</th>
        <th data-options="field:'avaInvTotal',width:60,align:'center'">可用库存总量</th>
        <th data-options="field:'nid',align:'center',width:120,formatter:formatInventoryOper">操作</th>
        <%--<th data-options="field:'attachment',width:60,align:'center', formatter:formatImg">附件信息</th>--%>
    </tr>
    </thead>
</table>

<div id="toolbar_inventory" style=" height: 22px; padding: 3px 11px; background: #fafafa;">

    <c:forEach items="${sessionScope.sysPermissionList}" var="per" >
        <c:if test="${per=='contract:add' }" >
            <div style="float: left;">
                <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="inventory_in()">入库</a>
            </div>
        </c:if>
        <c:if test="${per=='contract:edit' }" >
            <div style="float: left;">
                <a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="inventory_out()">出库</a>
            </div>
        </c:if>
    </c:forEach>


    <div class="datagrid-btn-separator"></div>

    <div style="float: left;">
        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="inventory_reload()">刷新</a>
    </div>

    <div id="search_inventory" style="float: right;">
        <input type="text" name="conCode" id="code" size=20 placeholder="合同编号"/>
        <input type="text" name="proName" id="name" size=20 placeholder="产品名称"/>
        <span class="l-btn" style="width: 50px;height: 20px;" id="search_text_user"
              onclick="doSearch_inventory()">搜索</span>
    </div>

</div>

<div id="inventoryEditWindow" class="easyui-window" title="产品补库" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'inventory/edit'" style="width:45%;height:60%;padding:10px;">
</div>
<div id="inventoryAddWindow" class="easyui-window" title="添加库存信息" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'inventory/add'" style="width:45%;height:60%;padding:10px;">
</div>

<div id="inventoryOutWindow" class="easyui-window" title="出库信息" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'inventory/out'" style="width:45%;height:60%;padding:10px;">
</div>

<script>
    function doSearch_inventory() { //用户输入用户名,点击搜素,触发此函数

        $('#inventoryList').datagrid('load', {
            code: $('#code').val(),
            name: $('#name').val(),
            manager: $('#manager').val(),
            manager: $('#status').val(),
            manager: $('#createTime').val()
        });
    }


    function formatInventoryOper(value, row, index) {
        var $row = JSON.stringify(row).replace(/\"/g,"'");
        return '<a href="#" onclick="inventory_edit(' + $row + ')" >补库</a>';
    };


    function getInventorySelectionsIds() {
        var inventoryList = $("#inventoryList");
        var sels = inventoryList.datagrid("getSelections");
        var ids = [];
        for (var i in sels) {
            ids.push(sels[i].id);
        }
        ids = ids.join(",");

        return ids;
    }

    function inventory_in() {
        $.get("inventory/add_judge", '', function (data) {
            if (data.msg != null) {
                $.messager.alert('提示', data.msg);
            } else {
                $("#inventoryAddWindow").window("open");
            }
        });
    }

    function inventory_out() {
        var ids = getInventorySelectionsIds();
        debugger;
        $.get("rawMaterial/out_judge", '', function (data) {
            if (data.msg != null) {
                $.messager.alert('提示', data.msg);
            } else {

            }
        });



        if (!$('#tabs').tabs('exists', '产品出库审核')) {
            $('#tabs').tabs('add', {
                title: '产品出库审核',
                href: 'inventory/out',
                border: false,
                bodyCls: "indexTabBody",
                closable: true
            });
        } else {
            $("#tabs").tabs("select", '产品出库审核');
            var selTab = $('#tabs').tabs('getSelected');
            $('#tabs').tabs('update', {
                tab: selTab,
                options: {
                    href: 'inventory/out'
                }
            })
        }
    }

    function inventory_edit(value) {
         debugger;
        $("#inventoryEditWindow").window({
            onLoad: function () {
                //回显数据
                // var data = $("#inventoryList").datagrid("getSelections")[0];
                $("#invEditForm").form("load", value);
            }
        }).window("open");
    }

    function inventory_delete() {
        $.get("inventory/delete_judge", '', function (data) {
            if (data.msg != null) {
                $.messager.alert('提示', data.msg);
            } else {
                var ids = getInventorySelectionsIds();
                if (ids.length == 0) {
                    $.messager.alert('提示', '未选中合同!');
                    return;
                }
                $.messager.confirm('确认', '确定删除ID为 ' + ids + ' 的合同吗？', function (r) {
                    if (r) {
                        var params = {"ids": ids};
                        $.post("inventory/delete_batch", params, function (data) {
                            if (data.status == 200) {
                                $.messager.alert('提示', '删除合同成功!', undefined, function () {
                                    $("#inventoryList").datagrid("reload");
                                });
                            }
                        });
                    }
                });
            }
        });
    }

    function inventory_reload() {
        $("#inventoryList").datagrid("reload");
    }
</script>