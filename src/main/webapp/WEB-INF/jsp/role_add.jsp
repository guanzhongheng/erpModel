<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet"> 
<script src="js/jquery.uploadfile.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<div style="padding:10px 10px 10px 10px">
	<form id="roleAddForm" class="roleForm" method="post">
		<span>角色编号:</span>
        	<input class="easyui-textbox" type="text" name="roleId" data-options="required:true"/><br><br>
        <span>角色名&nbsp:</span>
        	<input class="easyui-textbox" type="text" name="roleName" data-options="required:true"/><br><br>
        <span >状&nbsp态&nbsp:</span>
            <select class="easyui-combobox" name="available" panelHeight="auto" data-options="width:150,
            		editable:false">
				<option value="1">有效</option>
				<option value="2">锁定</option>
			</select><br><br>
        <span >权&nbsp限&nbsp:</span><br><br>
		<input type="hidden" name="permission"/>
		<span style="font-weight: bold;">合同管理：</span>
		<label><input name="permissionAdd" type="checkbox" value="7"/>合同查看 </label>
		<label><input name="permissionAdd" type="checkbox" value="11"/>合同新增 </label>
		<label><input name="permissionAdd" type="checkbox" value="12"/>合同修改 </label>
		<label><input name="permissionAdd" type="checkbox" value="13"/>合同删除 </label>
		<br><br>
		<span style="font-weight: bold;">产品库存管理：</span>
		<label><input name="permissionAdd" type="checkbox" value="9"/>产品库存查看 </label>
		<label><input name="permissionAdd" type="checkbox" value="21"/>产品库存新增 </label>
		<label><input name="permissionAdd" type="checkbox" value="22"/>产品库存修改 </label>
		<label><input name="permissionAdd" type="checkbox" value="23"/>产品库存删除 </label>
		<br><br>
		<span style="font-weight: bold;">原材料库存管理：</span>
		<label><input name="permissionAdd" type="checkbox" value="8"/>原材料库存查看 </label>
		<label><input name="permissionAdd" type="checkbox" value="51"/>原材料库存新增 </label>
		<label><input name="permissionAdd" type="checkbox" value="52"/>原材料库存修改 </label>
		<label><input name="permissionAdd" type="checkbox" value="53"/>原材料库存删除 </label>
		<br><br>
		<span style="font-weight: bold;">出库单管理：</span>
		<label><input name="permissionAdd" type="checkbox" value="10"/>出库单查看 </label>
		<label><input name="permissionAdd" type="checkbox" value="14"/>出库单新增 </label>
		<br><br>
		<span style="font-weight: bold;">产品字典管理：</span>
		<label><input name="permissionAdd" type="checkbox" value="30"/>产品查看 </label>
		<label><input name="permissionAdd" type="checkbox" value="31"/>产品新增 </label>
		<label><input name="permissionAdd" type="checkbox" value="32"/>产品修改 </label>
		<label><input name="permissionAdd" type="checkbox" value="33"/>产品删除 </label>
		<br><br>
		<span style="font-weight: bold;">半成品管理：</span>
		<label><input name="permissionAdd" type="checkbox" value="34"/>半成品查看 </label>
		<label><input name="permissionAdd" type="checkbox" value="35"/>半成品新增 </label>
		<label><input name="permissionAdd" type="checkbox" value="36"/>半成品修改 </label>
		<label><input name="permissionAdd" type="checkbox" value="37"/>半成品删除 </label>
		<br><br>
		<span style="font-weight: bold;">原材料管理：</span>
		<label><input name="permissionAdd" type="checkbox" value="44"/>原材料查看 </label>
		<label><input name="permissionAdd" type="checkbox" value="45"/>原材料新增 </label>
		<label><input name="permissionAdd" type="checkbox" value="46"/>原材料修改 </label>
		<label><input name="permissionAdd" type="checkbox" value="47"/>原材料删除 </label>
		<br><br>
		<span style="font-weight: bold;">任务调度：</span>
		<label><input name="permissionAdd" type="checkbox" value="60"/>任务分配</label>
		<br><br>
		<span style="font-weight: bold;">用户管理：</span>
		<label><input name="permissionAdd" type="checkbox" value="200"/>用户查看 </label>
		<label><input name="permissionAdd" type="checkbox" value="201"/>用户新增 </label>
		<label><input name="permissionAdd" type="checkbox" value="202"/>用户修改 </label>
		<label><input name="permissionAdd" type="checkbox" value="203"/>用户删除 </label>
		<br><br>
		<span style="font-weight: bold;">角色管理：</span>
		<label><input name="permissionAdd" type="checkbox" value="210"/>角色查看 </label>
		<label><input name="permissionAdd" type="checkbox" value="211"/>角色新增 </label>
		<label><input name="permissionAdd" type="checkbox" value="212"/>角色修改 </label>
		<label><input name="permissionAdd" type="checkbox" value="213"/>角色删除 </label>
		<br><br><br>
	</form>
	<br><br>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitRoleAddForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearRoleAddForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	
	//提交表单
	function submitRoleAddForm(){
		//有效性验证
		if(!$('#roleAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		
		if($("input[name='permissionAdd']:checked").length>0){
			var permission = '';
			$("input[name='permissionAdd']:checked").each(function(){
				permission += $(this).val()+',';
			}); 
			$("#roleAddForm [name=permission]").val(permission);
		}

		//ajax的post方式提交表单
		//$("#roleAddForm").serialize()将表单序列号为key-value形式的字符串
		$.post("role/insert",$("#roleAddForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示',data.msg);
				clearRoleAddForm();
				$("#roleAddWindow").window('close');
				$("#roleList").datagrid("reload");
			}else{
				$.messager.alert('提示',data.msg);
			}
		});
	}
	
	function clearRoleAddForm(){
		$('#roleAddForm').form('reset');
	}
</script>
