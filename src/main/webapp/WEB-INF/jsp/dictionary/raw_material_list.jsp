<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<table class="easyui-datagrid" id="rawMaterialList" title="原材料列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,rownumbers:true,url:'rawmaterial/list',
       	method:'get',pageSize:10,fitColumns:true,toolbar:toolbar_rawmaterial">
    <thead>
        <tr>
			<th data-options="field:'ck',checkbox:true"></th>
			<th data-options="field:'name',align:'center',width:60">原材料名称</th>
			<th data-options="field:'code',align:'center',width:60">原材料编号</th>
			<th data-options="field:'supplier',align:'center',width:60">供应商</th>
			<th data-options="field:'createTime',width:60,align:'center',formatter:formateDate">创建时间</th>
			<th data-options="field:'updateTime',width:60,align:'center',formatter:formateDate">更新时间</th>
			<th data-options="field:'nid',align:'center',width:120,formatter:formatUserOper">操作</th>
        </tr>
    </thead>
</table>

<div  id="toolbar_rawmaterial" style=" height: 22px; padding: 3px 11px; background: #fafafa;">
	
	<c:forEach items="${sessionScope.sysPermissionList}" var="per" >
		<c:if test="${per=='rawmaterial:add' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="rawmaterial_add()">新增</a>
		    </div>  
		</c:if>
		<c:if test="${per=='rawmaterial:delete' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel" onclick="rawmaterial_delete()">删除</a>
		    </div>  
		</c:if>
	</c:forEach>
	
	<div class="datagrid-btn-separator"></div>

	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="rawmaterial_reload()">刷新</a>
	</div>

	<div id="search_rawMaterial" style="float: right;">
		<input type="text" name="name" id="name" size=20 placeholder="原材料名称"/>
		<input type="text" name="code" id="code" size=20 placeholder="原材料编号"/>
		<input type="text" name="supplier" id="supplier" size=20 placeholder="供应商"/>
		<span class="l-btn" style="width: 50px;height: 20px;" id="search_text_rawmaterial" onclick="doSearch_rawMaterial()">搜索</span>
	</div>

</div>

<div id="rawMaterialSearchWindow" class="easyui-window" title="查看原材料信息" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'rawmaterial/search'" style="width:45%;height:70%;padding:10px;">
</div>

<div id="rawMaterialAddWindow" class="easyui-window" title="添加原材料" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'rawmaterial/add'" style="width:45%;height:60%;padding:10px;">
</div>

<div id="rawMaterialEditWindow" class="easyui-window" title="修改半产品" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'rawmaterial/edit'" style="width:45%;height:70%;padding:10px;">
</div>
<script>

    function formateDate(value, row, index) {
        if (value == null || value == '') {
            return '--';
        }
        var dt;
        if (value instanceof Date) {
            dt = value;
        } else {
            dt = new Date(value);
        }
        return dt.format("yyyy-MM-dd hh:mm:ss");
    }

    function formatUserOper(value, row, index) {
        var $row = JSON.stringify(row).replace(/\"/g,"'");
        return '<a href="#" onclick="rawmaterial_search('+$row+')" >查看</a> &nbsp;&nbsp;<a href="#" onclick="rawmaterial_edit('+$row+')" >修改</a>';
    }
    function rawmaterial_edit(value){
        $("#rawMaterialEditWindow").window({
            onLoad :function(){
                debugger;
                //回显数据
                $("#rawMaterialEditForm").form("load", value);
                $("#rmImgList").append(getImg(value.attachment));
            }
        }).window("open");
    }
    function rawmaterial_search(value){
        $("#rawMaterialSearchWindow").window({
            onLoad :function(){
                //回显数据
                $("#rawMaterialSearchForm").form("load", value);
                $("#rawMaterialImgList").append(getImg(value.attachment));
                $('input,select,textarea',$('form[name="rawMaterialSearchForm"]')).prop('readonly',true);
            }
        }).window("open");
    }
    function getImg(str){
        var res= "";
        if(str != null){
            var s = str.split(",");
            res += "<li>"
            for(var i = 0;i<s.length; i++){
                if(s[i].length > 0 && s[i] != '') {
                    res += "<a></li id='img"+i+"' href='"+s[i]+"' target=\"_blank\">" +
                        "<img src='"+s[i]+"'  width=\"80\" height=\"50\">" +
                        "</a></li>"
                }

            }
            res += "</li>"
        }
        return res;
    }
    function doSearch_rawMaterial(){ //点击搜素,触发此函数
        $('#rawMaterialList').datagrid('load',{
            name:$('#name').val(),
            code:$('#code').val(),
            supplier:$('#supplier').val()
        });
    }

    function rawmaterial_add(){
        $.get("semiproduct/add_judge",'',function(data){
            if(data.msg != null){
                $.messager.alert('提示', data.msg);
            }else{
                $("#rawMaterialAddWindow").window("open");
            }
        });
    }

    function rawmaterial_delete(){
        $.get("rawmaterial/delete_judge",'',function(data){
            if(data.msg != null){
                $.messager.alert('提示', data.msg);
            }else{
                var ids = getRawMaterialSelectionsIds();
                if(ids.length == 0){
                    $.messager.alert('提示','未选中原材料!');
                    return ;
                }
                $.messager.confirm('确认','确定删除ID为 '+ids+' 的原材料吗？',function(r){
                    if (r){
                        var params = {"ids":ids};
                        $.post("rawmaterial/delete_batch",params, function(data){
                            if(data.status == 200){
                                $.messager.alert('提示','删除原材料成功!',undefined,function(){
                                    $("#rawMaterialList").datagrid("reload");
                                });
                            }
                        });
                    }
                });
            }
        });
    }

    function getRawMaterialSelectionsIds(){
        var rawMaterialList = $("#rawMaterialList");
        var sels = rawMaterialList.datagrid("getSelections");
        var ids = [];
        for(var i in sels){
            ids.push(sels[i].id);
        }
        ids = ids.join(",");

        return ids;
    }

    function rawmaterial_reload(){
        $("#rawMaterialList").datagrid("reload");
    }


</script>