<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<table class="easyui-datagrid" id="userList" title="用户列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,rownumbers:true,url:'user/list',
       	method:'get',pageSize:10,fitColumns:true,toolbar:toolbar_user">
    <thead>
        <tr>
			<th data-options="field:'ck',checkbox:true"></th>
			<th data-options="field:'id',align:'center',width:60">用户编号</th>
			<th data-options="field:'username',align:'center',width:60">用户名</th>
			<th data-options="field:'userNumber',align:'center',width:60">工号</th>
			<th data-options="field:'password',align:'center',width:60">密码</th>
			<th data-options="field:'name',align:'center',width:60">姓名</th>
			<th data-options="field:'roleName',align:'center',width:60,formatter:formatRole">角色</th>
			<th data-options="field:'status',width:60,align:'center',formatter:formatUserStatus">状态</th>
			<th data-options="field:'createTime',width:60,align:'center'">创建时间</th>
			<th data-options="field:'loseTime',width:60,align:'center'">失效时间</th>
			<%--<th data-options="field:'nid',align:'center',width:120,formatter:formatUserOper">操作</th>--%>
        </tr>
    </thead>
</table>

<div  id="toolbar_user" style=" height: 22px; padding: 3px 11px; background: #fafafa;">  
	
	<c:forEach items="${sessionScope.sysPermissionList}" var="per" >
		<c:if test="${per=='user:add' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="user_add()">新增</a>  
		    </div>  
		</c:if>
		<c:if test="${per=='user:edit' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="user_edit()">编辑</a>  
		    </div>  
		</c:if>
		<c:if test="${per=='user:delete' }" >
		    <div style="float: left;">  
		        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel" onclick="user_delete()">删除</a>  
		    </div>  
		</c:if>
	</c:forEach>
	
	<div class="datagrid-btn-separator"></div>  
	
	<div style="float: left;">  
		<a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="user_reload()">刷新</a>  
	</div>  
	
    <div id="search_user" style="float: right;">
			<input type="text" name="username" id="username" size=20 placeholder="用户名"/>
			<input type="text" name="usernumber" id="usernumber"  size=20 placeholder="用户工号"/>
			 <select name="role_id" id="role_id" >
				<option value="-1">请选择搜索角色</option>
				<option value="001" >超级管理员</option>
				<option value="002" >订单管理员</option>
				<option value="004" >物料管理员</option>
				<option value="005" >普通用户</option>
				<option value="007" >设备管理员</option>
			</select>
			<span class="l-btn" style="width: 50px;height: 20px;" id="search_text_user" onclick="doSearch_user()">搜索</span>
    </div>

</div>  

<div id="userEditWindow" class="easyui-window" title="编辑用户" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'user/edit'" style="width:45%;height:60%;padding:10px;">
</div>
<div id="userAddWindow" class="easyui-window" title="添加用户" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'user/add'" style="width:45%;height:60%;padding:10px;">
</div>
<div id="userRoleWindow" class="easyui-window" title="添加用户" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'user/role'" style="width:45%;height:60%;padding:10px;">
</div>
<script>
function doSearch_user(){ //用户输入用户名,点击搜素,触发此函数

    $('#userList').datagrid('load',{
        roleId: $('#role_id').val(),
        userNumber:$('#usernumber').val(),
        username:$('#username').val()
    });
}


	function formatUserStatus(value){
        if (value == 0){
            return '有效用户';
        }else if(value == 1){
        	return '<span style="color:red;">锁定</span>';
        }else {
        	return '<span style="color:#E5B717;">未知状态用户</span>';
        }
    }
	
	//根据index拿到该行值
	function onUserClickRow(index) {
		var rows = $('#userList').datagrid('getRows');
		return rows[index];
		
	}
	
	//格式化角色信息
	function formatRole(value, row, index){
		return "<a href=javascript:openRole("+index+")>"+row.roleName+"</a>";
	};

	function formatUserOper(value, row, index) {
		return "<a href='#'>查看</a> &nbsp;&nbsp;<a href='#'>修改</a>";
	};

	//打开角色信息
	function  openRole(index){ 
		var row = onUserClickRow(index);
		$.get("role/get/"+row.roleId,'',function(data){
			$("#userRoleWindow").window({
	    		onLoad :function(){
	    			//回显数据
	    			$("#userRoleEditForm").form("load", data);
	    			userPermissionInit();
	    		}
	    	}).window("open");
    	});
	};
	
	function submitUserRoleEditForm(){
		if(!$('#userRoleEditForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
	
		if($("input[name='permissionOption3']:checked").length>0){
			var permission = '';
			$("input[name='permissionOption3']:checked").each(function(){
				permission += $(this).val()+',';
			}); 
			$("#userRoleEditForm [name=permission]").val(permission);
		}
		$.post("role/update_all",$("#userRoleEditForm").serialize(), function(data){
			if(data.label == 200){
				$.messager.alert('提示', data.msg);
				$("#userRoleInfo").dialog("close");
			}else{
				$.messager.alert('提示', data.msg);
			}
		});
	}
	
    function getUserSelectionsIds(){
    	var userList = $("#userList");
    	var sels = userList.datagrid("getSelections");
    	var ids = [];
    	for(var i in sels){
    		ids.push(sels[i].id);
    	}
    	ids = ids.join(","); 
    	
    	return ids;
    }
    
    function user_add(){
	    debugger;
    	$.get("user/add_judge",'',function(data){
       		if(data.msg != null){
       			$.messager.alert('提示', data.msg);
       		}else{
       			$("#userAddWindow").window("open");
       		}
       	});
    }
    
    function user_edit(){
    	$.get("user/edit_judge",'',function(data){
       		if(data.msg != null){
       			$.messager.alert('提示', data.msg);
       		}else{
       			var ids = getUserSelectionsIds();
            	
            	if(ids.length == 0){
            		$.messager.alert('提示','必须选择一个用户才能编辑!');
            		return ;
            	}
            	if(ids.indexOf(',') > 0){
            		$.messager.alert('提示','只能选择一个用户!');
            		return ;
            	}
            	
            	$("#userEditWindow").window({
            		onLoad :function(){
            			//回显数据
            			var data = $("#userList").datagrid("getSelections")[0];
            			$("#userEditForm").form("load", data);
            		}
            	}).window("open");
       		}
       	});
    }
    
    function user_delete(){
    	$.get("user/delete_judge",'',function(data){
      		if(data.msg != null){
      			$.messager.alert('提示', data.msg);
      		}else{
      			var ids = getUserSelectionsIds();
            	if(ids.length == 0){
            		$.messager.alert('提示','未选中用户!');
            		return ;
            	}
            	$.messager.confirm('确认','确定删除ID为 '+ids+' 的用户吗？',function(r){
            	    if (r){
            	    	var params = {"ids":ids};
                    	$.post("user/delete_batch",params, function(data){
                			if(data.status == 200){
                				$.messager.alert('提示','删除用户成功!',undefined,function(){
                					$("#userList").datagrid("reload");
                				});
                			}
                		});
            	    }
            	});
      		}
      	});
    }
    
    function user_reload(){
    	$("#userList").datagrid("reload");
    }
</script>