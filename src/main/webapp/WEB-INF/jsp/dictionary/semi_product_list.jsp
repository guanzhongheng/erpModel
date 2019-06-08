<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<table class="easyui-datagrid" id="semiProductList" title="半产品列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,rownumbers:true,url:'semiproduct/list',
       	method:'get',pageSize:10,fitColumns:true,toolbar:toolbar_semiproduct">
    <thead>
        <tr>
			<th data-options="field:'ck',checkbox:true"></th>
			<th data-options="field:'name',align:'center',width:60">半产品名称</th>
			<th data-options="field:'code',align:'center',width:60">半产品编号</th>
			<th data-options="field:'specification',align:'center',width:60">半产品规格</th>
			<th data-options="field:'tickness',align:'center',width:60">半产品厚度</th>
			<th data-options="field:'innerResin',align:'center',width:60">内衬树脂</th>
			<th data-options="field:'structuralResin',align:'center',width:60">结构树脂</th>
			<th data-options="field:'outerResin',align:'center',width:60">外层树脂</th>
			<th data-options="field:'createTime',width:60,align:'center',formatter:formateDate">创建时间</th>
			<th data-options="field:'updateTime',width:60,align:'center',formatter:formateDate">更新时间</th>
			<th data-options="field:'nid',align:'center',width:120,formatter:formatUserOper">操作</th>
        </tr>
    </thead>
</table>

<div  id="toolbar_semiproduct" style=" height: 22px; padding: 3px 11px; background: #fafafa;">
	
	<c:forEach items="${sessionScope.sysPermissionList}" var="per" >
		<c:if test="${per=='semiproduct:add' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="semiproduct_add()">新增</a>
		    </div>  
		</c:if>
		<c:if test="${per=='semiproduct:delete' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel" onclick="semiproduct_delete()">删除</a>
		    </div>  
		</c:if>
	</c:forEach>
	
	<div class="datagrid-btn-separator"></div>

	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="semiproduct_reload()">刷新</a>
	</div>

	<div id="search_semiproduct" style="float: right;">
		<input type="text" name="name" id="name" size=20 placeholder="半产品名称"/>
		<input type="text" name="code" id="code" size=20 placeholder="半产品编号"/>
		<span class="l-btn" style="width: 50px;height: 20px;" id="search_text_semiproduct" onclick="doSearch_semiproduct()">搜索</span>
	</div>

</div>

<div id="semiProductSearchWindow" class="easyui-window" title="查看半产品" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'semiproduct/search'" style="width:45%;height:70%;padding:10px;">
</div>

<div id="semiproductAddWindow" class="easyui-window" title="添加半产品" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'semiproduct/add'" style="width:45%;height:60%;padding:10px;">
</div>

<div id="semiProductEditWindow" class="easyui-window" title="修改半产品" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'semiproduct/edit'" style="width:45%;height:70%;padding:10px;">
</div>
<script>

    function formatUserOper(value, row, index) {
        var $row = JSON.stringify(row).replace(/\"/g,"'");
        return '<a href="#" onclick="semiproduct_search('+$row+')" >查看</a> &nbsp;&nbsp;<a href="#" onclick="semiproduct_edit('+$row+')" >修改</a>';
    }

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

    function semiproduct_edit(value){
        debugger;
        $("#semiProductEditWindow").window({
            onLoad :function(){
                debugger;
                //回显数据
                $("#semiProductEditForm").form("load", value);
                $("#spImgList").append(getImg(value.attachment));
                // var options = $('#rawMaterialEditList').datagrid('options');
                // options.url = "/semiproduct/" + value.id + "/rawmaterial";
                // $('#rawMaterialEditList').datagrid(options);

                $("#rawMaterialEditList").edatagrid({
                    url: "/semiproduct/" + value.id + "/rawmaterial"
                });
            }
        }).window("open");
    }

    function semiproduct_search(value){
        $("#semiProductSearchWindow").window({
            onLoad :function(){
                //回显数据
                $("#semiProductSearchForm").form("load", value);
                $("#semiProdImgList").append(getImg(value.attachment));

                var options = $('#rawMaterialSearchList').datagrid('options');
                options.url = "/semiproduct/" + value.id + "/rawmaterial";
                $('#rawMaterialSearchList').datagrid(options);

                $('input,select,textarea',$('form[name="semiProductSearchForm"]')).prop('readonly',true);
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

    function doSearch_semiproduct(){ //点击搜素,触发此函数

        $('#semiProductList').datagrid('load',{
            name:$('#name').val(),
            code:$('#code').val()
        });
    }

    function semiproduct_add(){
        $.get("semiproduct/add_judge",'',function(data){
            if(data.msg != null){
                $.messager.alert('提示', data.msg);
            }else{
                $("#semiproductAddWindow").window("open");
            }
        });
    }

    function semiproduct_delete(){
        $.get("semiproduct/delete_judge",'',function(data){
            if(data.msg != null){
                $.messager.alert('提示', data.msg);
            }else{
                var ids = getSemiProductSelectionsIds();
                if(ids.length == 0){
                    $.messager.alert('提示','未选中半产品!');
                    return ;
                }
                $.messager.confirm('确认','确定删除ID为 '+ids+' 的半产品吗？',function(r){
                    if (r){
                        var params = {"ids":ids};
                        $.post("semiproduct/delete_batch",params, function(data){
                            if(data.status == 200){
                                $.messager.alert('提示','删除半产品成功!',undefined,function(){
                                    $("#semiProductList").datagrid("reload");
                                });
                            }
                        });
                    }
                });
            }
        });
    }

    function getSemiProductSelectionsIds(){
        var semiProductList = $("#semiProductList");
        var sels = semiProductList.datagrid("getSelections");
        var ids = [];
        for(var i in sels){
            ids.push(sels[i].id);
        }
        ids = ids.join(",");

        return ids;
    }

    function semiproduct_reload(){
        $("#semiProductList").datagrid("reload");
    }


</script>