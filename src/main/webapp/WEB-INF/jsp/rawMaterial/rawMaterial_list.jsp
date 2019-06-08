<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<table class="easyui-datagrid" id="rawMaterialList" title="原材料列表"
	   data-options="singleSelect:false,collapsible:true,pagination:true,rownumbers:true,url:'inventory/rawmater/list',
       	method:'get',pageSize:10,fitColumns:true,toolbar:toolbar_rawMaterial">
	<thead>
	<tr>
		<th data-options="field:'ck',checkbox:true"></th>
		<th data-options="field:'id',align:'center',width:60">序号</th>
		<th data-options="field:'code',align:'center',width:60">原材料编号</th>
		<th data-options="field:'name',align:'center',width:60">原材料名称</th>
		<th data-options="field:'specification',align:'center',width:60">原材料规格</th>
		<th data-options="field:'supplier',align:'center',width:60">原材料供应商</th>
		<th data-options="field:'invTotal',width:60,align:'center'">原材料库存</th>
		<th data-options="field:'avaInvTotal',width:60,align:'center'">原材料可用库存</th>
		<th data-options="field:'nid',align:'center',width:120,formatter:formatUserOper">操作</th>
		<%--<th data-options="field:'attachment',width:60,align:'center', formatter:formatImg">附件信息</th>--%>
	</tr>
	</thead>
</table>

<div  id="toolbar_rawMaterial" style=" height: 22px; padding: 3px 11px; background: #fafafa;">

	<div class="datagrid-btn-separator"></div>

	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="rawMaterial_reload()">刷新</a>
	</div>

	<div id="search_rawMaterial" style="float: right;">
		<input type="text" name="code" id="code" size=20 placeholder="原材料编号"/>
		<input type="text" name="name" id="name"  size=20 placeholder="原材料名称"/>
		<input type="text" name="supplier" id="supplier"  size=20 placeholder="原材料供应商"/>
		<span class="l-btn" style="width: 50px;height: 20px;" id="search_text_user" onclick="doSearch_rawMaterial()">搜索</span>
	</div>

</div>

<div id="rawMaterialEditWindow" class="easyui-window" title="编辑" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'rawMaterial/edit'" style="width:45%;height:60%;padding:10px;">
</div>
<div id="rawMaterialAddWindow" class="easyui-window" title="添加" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'rawMaterial/add'" style="width:45%;height:60%;padding:10px;">
</div>

<script>
    function doSearch_rawMaterial(){ //用户输入用户名,点击搜素,触发此函数

        $('#rawMaterialList').datagrid('load',{
            code: $('#code').val(),
            name:$('#name').val(),
            supplier:$('#supplier').val(),
        });
    }



    function formatUserOper(value, row, index) {
        return "<a href='#'>补库</a>";
    };



    function getContractSelectionsIds(){
        var rawMaterialList = $("#rawMaterialList");
        var sels = rawMaterialList.datagrid("getSelections");
        var ids = [];
        for(var i in sels){
            ids.push(sels[i].id);
        }
        ids = ids.join(",");

        return ids;
    }

    function rawMaterial_add(){
        debugger;
        $.get("rawMaterial/add_judge",'',function(data){
            if(data.msg != null){
                $.messager.alert('提示', data.msg);
            }else{
                $("#rawMaterialAddWindow").window("open");
            }
        });
    }

    function rawMaterial_edit(){
        $.get("rawMaterial/edit_judge",'',function(data){
            if(data.msg != null){
                $.messager.alert('提示', data.msg);
            }else{
                var ids = getContractSelectionsIds();

                if(ids.length == 0){
                    $.messager.alert('提示','必须选择一个合同才能编辑!');
                    return ;
                }
                if(ids.indexOf(',') > 0){
                    $.messager.alert('提示','只能选择一个合同!');
                    return ;
                }

                $("#rawMaterialEditWindow").window({
                    onLoad :function(){
                        //回显数据
                        var data = $("#rawMaterialList").datagrid("getSelections")[0];
                        $("#rawMaterialEditForm").form("load", data);
                    }
                }).window("open");
            }
        });
    }

    function rawMaterial_delete(){
        $.get("rawMaterial/delete_judge",'',function(data){
            if(data.msg != null){
                $.messager.alert('提示', data.msg);
            }else{
                var ids = getContractSelectionsIds();
                if(ids.length == 0){
                    $.messager.alert('提示','未选中合同!');
                    return ;
                }
                $.messager.confirm('确认','确定删除ID为 '+ids+' 的合同吗？',function(r){
                    if (r){
                        var params = {"ids":ids};
                        $.post("rawMaterial/delete_batch",params, function(data){
                            if(data.status == 200){
                                $.messager.alert('提示','删除合同成功!',undefined,function(){
                                    $("#rawMaterialList").datagrid("reload");
                                });
                            }
                        });
                    }
                });
            }
        });
    }

    function rawMaterial_reload(){
        $("#rawMaterialList").datagrid("reload");
    }
</script>