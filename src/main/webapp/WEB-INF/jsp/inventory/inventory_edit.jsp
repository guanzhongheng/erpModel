<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet">
<script src="js/jquery.uploadfile.js"></script>
<script src="js/jquery.edatagrid.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="invEditForm" name="invEditForm" class="contractForm" method="post">
		<input type="hidden" name="id"/>
		<input type="hidden" name="mapType" id="mapType" value=""/>
		<table cellpadding="5">
			<tr>
				<td>产品名称:</td>
				<td>
					<input class="easyui-textbox" type="text" name="proName" disabled/>
				</td>
			</tr>
			<tr>
				<td>合同编号:</td>
				<td>
					<input class="easyui-textbox" type="text" name="conCode" disabled/>
				</td>
			</tr>
			<tr>
				<td>合同数量:</td>
				<td>
					<input class="easyui-textbox" type="text" name="conNeedTotal" disabled/>
				</td>
			</tr>
			<tr>
				<td>在库数量:</td>
				<td>
					<input class="easyui-textbox" type="text" name="invTotal" disabled/>
				</td>
			</tr>
			<tr>
				<td>补库数量:</td>
				<td>
					<input class="easyui-textbox" type="text" name="addNum"/>
				</td>
			</tr>
		</table>
	</form>


	<div style="padding:5px">
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitInvNumEditForm()">提交</a>
	</div>

</div>
<script type="text/javascript">




    function submitInvNumEditForm() {

        debugger;
        if (!$('#invEditForm').form('validate')) {
            $.messager.alert('提示', '表单还未填写完成!');
            return;
        }

        var data = getFormData($("#invEditForm"));

        $.ajax({
            type: "POST",
            url: 'inventory/update',
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json",
            cache: false,
            success: function (data) {
                if (data.status == 200) {
                    $.messager.alert('提示', data.msg);
                    $("#inventoryEditWindow").window('close');
                    $("#inventoryList").datagrid("reload");
                    ;
                } else {
                    $.messager.alert('提示', data.msg);
                }
            }
        });


    }
</script>
