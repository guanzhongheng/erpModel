<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet"> 
<script src="js/jquery.uploadfile.js"></script>
<script src="js/malsup.github.iojquery.form.js"></script>
<script src="js/jquery.edatagrid.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<div style="padding:10px 10px 10px 10px">
	<form id="rawMaterialAddForm" class="userForm" method="post">
	    <table cellpadding="5" >
	        <%--<tr>
	            <td>原材料编号:</td>
	            <td>
	            	<input id="code" class="easyui-textbox" type="text" name="code" data-options="required:true"/>
	            </td>
	        </tr>--%>
			<tr>
				<td>原材料名称:</td>
				<td>
					<input id="name" class="easyui-textbox" type="text" name="name" data-options="required:true"/>
				</td>
			</tr>
			<tr>
				<td>供应商:</td>
				<td>
					<input id="specification" class="easyui-textbox" type="text" name="supplier" data-options="required:true"/>
				</td>
			</tr>
			<tr>
				<td>附件信息:</td>
				<td>
					<a href="javascript:void(0)" class="easyui-linkbutton picFileUpload">上传图片</a>
					<input type="hidden" id="attachment" name="attachment"/>
				</td>
			</tr>
	    </table>
	</form>
	<br><br>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitRawMaterialAddForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearRawMaterialAddForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
    $(function(){
        //加载文件上传插件
        initOrderAddFileUpload();
        //创建富文本编辑器
        //orderAddEditor = TAOTAO.createEditor("#productAddForm [name=file]");
        // productAddEditor = KindEditor.create("#productAddForm [name=note]", TT.kingEditorParams);
        //初始化类目选择和图片上传器
        TAOTAO.init({fun:function(node){
                TAOTAO.changeItemParam(node, "rawMaterialAddForm");
            }},"attachment");
    });
	//提交表单
	function submitRawMaterialAddForm(){
		//有效性验证
		if(!$('#rawMaterialAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}

		//ajax的post方式提交表单
		//$("#rawMaterialAddForm").serialize()将表单序列号为key-value形式的字符串
        var data = {};
        data =  getFormData($("#rawMaterialAddForm"));
        $.ajax({
            type: "POST",
            url: 'rawmaterial/insert',
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json",
            cache: false,
            success: function (data) {
                if (data.status == 200) {
                    $.messager.alert('提示', data.msg);
                    clearSemiProductAddForm();
                    $("#rawMaterialAddWindow").window('close');
                    $(".picFileUpload").siblings("div.pics").find("ul > li").remove();
                    $("#rawMaterialList").datagrid("reload");
                } else {
                    $.messager.alert('提示', data.msg);
                }
            }
        });
	}
	
	function clearRawMaterialAddForm(){
		$('#rawMaterialAddForm').form('reset');
        $('#rawMaterialList').edatagrid({});
	}
</script>
