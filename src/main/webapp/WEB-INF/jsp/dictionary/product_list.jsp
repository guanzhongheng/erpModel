<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<table class="easyui-datagrid" id="productList" title="产品列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,rownumbers:true,url:'product/list',
       	method:'get',pageSize:10,fitColumns:true,toolbar:toolbar_product">
    <thead>
        <tr>
			<th data-options="field:'ck',checkbox:true"></th>
			<th data-options="field:'name',align:'center',width:60">产品名称</th>
			<th data-options="field:'code',align:'center',width:60">产品编号</th>
			<th data-options="field:'specification',align:'center',width:60">产品规格</th>
			<th data-options="field:'type',align:'center',width:60,formatter:formatType">产品类型</th>
			<th data-options="field:'createTime',width:60,align:'center',formatter:formateDate">创建时间</th>
			<th data-options="field:'updateTime',width:60,align:'center',formatter:formateDate">更新时间</th>
			<th data-options="field:'nid',align:'center',width:120,formatter:formatUserOper">操作</th>
        </tr>
    </thead>
</table>

<div  id="toolbar_product" style=" height: 22px; padding: 3px 11px; background: #fafafa;">
	
	<c:forEach items="${sessionScope.sysPermissionList}" var="per" >
		<c:if test="${per=='product:add' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="product_add()">新增</a>
		    </div>  
		</c:if>
		<c:if test="${per=='product:delete' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel" onclick="product_delete()">删除</a>
		    </div>  
		</c:if>
	</c:forEach>
	
	<div class="datagrid-btn-separator"></div>

	<div style="float: left;">
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="product_reload()">刷新</a>
	</div>

	<div id="search_product" style="float: right;">
		<input type="text" name="name" id="name" size=20 placeholder="产品名称"/>
		<input type="text" name="code" id="code" size=20 placeholder="产品编号"/>
		<select name="type" id="type" >
			<option value="a">请选择产品类型</option>
			<option value="1">树脂</option>
			<option value="2" >乙烯基</option>
		</select>
		<span class="l-btn" style="width: 50px;height: 20px;" id="search_text_product" onclick="doSearch_product()">搜索</span>
	</div>

</div>

<div id="productSearchWindow" class="easyui-window" title="查看产品" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'product/search'" style="width:45%;height:70%;padding:10px;">
</div>

<div id="productAddWindow" class="easyui-window" title="添加产品" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'product/add'" style="width:45%;height:75%;padding:10px;">
</div>

<div id="productEditWindow" class="easyui-window" title="修改产品" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'product/edit'" style="width:45%;height:70%;padding:10px;">
</div>
<script>
    function formatUserOper(value, row, index) {
        var $row = JSON.stringify(row).replace(/\"/g,"'");
        return '<a href="#" onclick="product_search('+$row+')" >查看</a> &nbsp;&nbsp;<a href="#" onclick="product_edit('+$row+')" >修改</a>';
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

    function product_edit(value){
        debugger;
        $("#productEditWindow").window({
            onLoad :function(){
                debugger;
                //回显数据
                $("#productEditForm").form("load", value);
                $("#prodImgList").append(getImg(value.attachment));
                // var options = $('#semiProdEditList').datagrid('options');
                // options.url = "/product/" + value.id + "/semiprod";
                // $('#semiProdEditList').datagrid(options);

                $("#semiProdEditList").edatagrid({
                    url: "/product/" + value.id + "/semiprod"
                });
            }
        }).window("open");
    }

    function product_search(value){
        value["mapType"] = "1";
        $("#productSearchWindow").window({
            onLoad :function(){
                //回显数据
                $("#productSearchForm").form("load", value);
                $("#prodImgList").append(getImg(value.attachment));

                var options = $('#semiProdSearchList').datagrid('options');
                options.url = "/product/" + value.id + "/semiprod";
                $('#semiProdSearchList').datagrid(options);

                $('input,select,textarea',$('form[name="productSearchForm"]')).prop('readonly',true);
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


    function doSearch_product(){ //点击搜素,触发此函数

        $('#productList').datagrid('load',{
            type:$('#type').val(),
            name:$('#name').val(),
            code:$('#code').val()
        });
    }

	function formatAttachment(value) {
        return "查看附件";
    }
    function formatType(value) {
		if(value == 1) {
		    return "树脂";
		}else if(value == 2) {
		    return "乙烯基";
		}
    }

	function formatSemiProdCons(value, row, index) {
        return "查看半成品";
    }

    function product_add(){
        $.get("product/add_judge",'',function(data){
            if(data.msg != null){
                $.messager.alert('提示', data.msg);
            }else{
                $("#productAddWindow").window("open");
            }
        });
    }

    function product_delete(){
        $.get("product/delete_judge",'',function(data){
            if(data.msg != null){
                $.messager.alert('提示', data.msg);
            }else{
                var ids = getProductSelectionsIds();
                if(ids.length == 0){
                    $.messager.alert('提示','未选中产品!');
                    return ;
                }
                $.messager.confirm('确认','确定删除ID为 '+ids+' 的产品吗？',function(r){
                    if (r){
                        var params = {"ids":ids};
                        $.post("product/delete_batch",params, function(data){
                            if(data.status == 200){
                                $.messager.alert('提示','删除产品成功!',undefined,function(){
                                    $("#productList").datagrid("reload");
                                });
                            }
                        });
                    }
                });
            }
        });
    }

    function getProductSelectionsIds(){
        var productList = $("#productList");
        var sels = productList.datagrid("getSelections");
        var ids = [];
        for(var i in sels){
            ids.push(sels[i].id);
        }
        ids = ids.join(",");

        return ids;
    }

    function product_reload(){
        $("#productList").datagrid("reload");
    }


</script>