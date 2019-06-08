<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<table class="easyui-datagrid" id="taskAsgnList" title="任务分配"
	   data-options="singleSelect:false,collapsible:true,pagination:true,rownumbers:true,url:'taskasgn/list',
       	method:'get',pageSize:10,fitColumns:true,toolbar:toolbar_taskasgn">
	<thead>
	<tr>
		<th data-options="field:'ck',checkbox:true"></th>
		<th data-options="field:'contCode',align:'center',width:60">合同编号</th>
		<th data-options="field:'contName',align:'center',width:60">合同名称</th>
		<th data-options="field:'manager',align:'center',width:60">合同经办人</th>
		<th data-options="field:'signDate',align:'center',width:60">合同签订时间</th>
		<th data-options="field:'nid',align:'center',width:120,formatter:formatUserOper">操作</th>
	</tr>
	</thead>
</table>

<div  id="toolbar_taskasgn" style=" height: 22px; padding: 3px 11px; background: #fafafa;">
	<div id="search_taskasgn" style="float: right;">
		<input type="text" name="contCode" id="code" size=20 placeholder="合同编号"/>
		<input type="text" name="contName" id="name"  size=20 placeholder="合同名称"/>
		<input type="text" name="manager" id="manager"  size=20 placeholder="合同经办人"/>
		<input type="text" name="signDate" id="createTime"  size=20 placeholder="合同签订时间"/>
		<span class="l-btn" style="width: 50px;height: 20px;" id="search_text_user" onclick="doSearch_contract()">搜索</span>
	</div>
</div>

<div id="taskAsgnEditWindow" class="easyui-window" title="任务分配" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'taskasgn/edit'" style="width:45%;height:70%;padding:10px;">
</div>

<script>
    function doSearch_contract(){ //用户输入用户名,点击搜素,触发此函数
        $('#taskAsgnList').datagrid('load',{
            code: $('#code').val(),
            name:$('#name').val(),
            createTime:$('#manager').val(),
            status:'0',
        });
    }
    function formatUserOper(value, row, index) {
        var $row = JSON.stringify(row).replace(/\"/g,"'");
        return '<a href="#" onclick="task_asgn('+$row+')" >任务分配</a>';
    };

    function task_asgn(value){
        debugger;
        $("#taskAsgnEditWindow").window({
            onLoad :function(){
                //回显数据
                $("#taskAsgnEditForm").form("load", value);
                $("#imgList").append(getImg(value.attachment));

                /*var options = $('#taskAsgnProdList').datagrid('options');
                options.url = 'contract/get/contractdetail?code='+value.id;
                $('#taskAsgnProdList').datagrid(options);*/
                $('#taskAsgnProdList').edatagrid({
					url:'contract/contractdetail?code='+value.id
				});

            }
        }).window("open");
    }

    function getImg(str){
        var res= "";
        if(str != null){
            var s = str.split(",");
            res += "<li>"
            for(var i = 0;i<s.length; i++){
                if(s[i].length > 0 && s[i] !=''){
                    res += "<a></li id='img"+i+"' href='"+s[i]+"' target=\"_blank\">" +
                        "<img src='"+s[i]+"'  width=\"80\" height=\"50\">" +
                        "</a></li>"
                }
            }
            res += "</li>"
        }
        return res;
    }

</script>