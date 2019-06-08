<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet">
<script src="js/jquery.uploadfile.js"></script>
<script src="js/jquery.edatagrid.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="rawMaterialEditForm" name="rawMaterialEditForm" class="contractForm" method="post">
		<input type="hidden" name="id"/>
		<input type="hidden" name="mapType" id="mapType" value=""/>
		<table cellpadding="5">
			<tr>

				<td>原材料名称:</td>
				<td>
					<input class="easyui-textbox" type="text" name="name">
				</td>
			</tr>

			<tr>
				<td>原材料编码:</td>
				<td>
					<input class="easyui-textbox" type="text" name="code" disabled/>
				</td>
			</tr>
			<tr>
				<td>原材料供应商:</td>
				<td>
					<input class="easyui-textbox" type="text" name="supplier" disabled/>
				</td>
			</tr>

			<tr>
				<td>原材料单位:</td>
				<td>
					<input class="easyui-textbox" type="text" name="name" disabled/>
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
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitRawMaterailInvNumEditForm()">提交</a>
	</div>

</div>
<script type="text/javascript">

    function submitRawMaterailInvNumEditForm() {

        debugger;
        if (!$('#rawMaterialEditForm').form('validate')) {
            $.messager.alert('提示', '表单还未填写完成!');
            return;
        }

        var data = getFormData($("#rawMaterialEditForm"));

        $.ajax({
            type: "POST",
            url: 'inventory/rawmater/update',
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json",
            cache: false,
            success: function (data) {
                if (data.status == 200) {
                    $.messager.alert('提示', data.msg);
                    $("#rawMaterialEditWindow").window('close');
                    $("#rawMaterialList").datagrid("reload");
                } else {
                    $.messager.alert('提示', data.msg);
                }
            }
        });


    }
</script>
