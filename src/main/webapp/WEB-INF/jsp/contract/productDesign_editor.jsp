<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet">
<script src="js/jquery.uploadfile.js"></script>
<script src="js/malsup.github.iojquery.form.js"></script>
<script src="js/jquery.edatagrid.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<div style="padding:10px 10px 10px 10px">
    <form id="proDesinEditorForm" name="proDesinEditorForm" class="productForm" method="post">
        <input type="text" id="contId" hidden="hidden" name="contId"/>
        <input type="text" id="prodId" hidden="hidden" name="prodId"/>
        <input type="text" id="contDetailId" hidden="hidden" name="contDetailId"/>
        <input type="text" id="parentId" hidden="hidden" name="parentId"/>
        <table cellpadding="5" >
            <tr>
                <td>产品名称:</td>
                <td>
                    <input id="prodName" class="easyui-textbox" type="text" name="prodName">
                </td>
            </tr>
            <tr>
                <td>产品规格:</td>
                <td>
                    <input id="specification" class="easyui-textbox" type="text" name="specification" data-options="required:true"/>
                </td>
            </tr>


            <tr>
                <td>产品编号:</td>
                <td>
                    <input id="prodCode" class="easyui-textbox" type="text" name="prodCode" data-options="required:true"/>
                </td>
            </tr>

            <tr>
                <td>产品类型:</td>
                <td>
                    <select class="easyui-combobox" id="prodType" name="prodType" panelHeight="auto" data-options="width:150,
		            		editable:false">
                        <option value="1">树脂</option>
                        <option value="2">乙烯基</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td>产品数量:</td>
                <td>
                    <input id="quantity" class="easyui-textbox" type="text" name="quantity" data-options="editor:{type:'numberbox'},required:true"/>
                </td>
            </tr>

            <tr>
                <td>产品单位:</td>
                <td>
                    <input id="prodUnit" class="easyui-textbox" type="text" name="prodUnit" data-options="required:true"/>
                </td>
            </tr>

            <tr>
                <td>备注:</td>
                <td>
                    <input id="remark" class="easyui-textbox" type="text" name="remark" data-options="required:true"/>
                </td>
            </tr>
        </table>

    </form>
    <br><br>
    <div style="padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitEditorProductAddForm()">提交</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearEditorProductDesinForm()">重置</a>
    </div>
</div>
<script type="text/javascript">

    function getFormData($form) {
        var unindexed_array = $form.serializeArray();
        var indexed_array = {};

        $.map(unindexed_array, function (n, i) {
            indexed_array[n['name']] = n['value'];
        });

        return indexed_array;
    }
    //提交表单
    function submitEditorProductAddForm(){
        debugger;
        //有效性验证
        if(!$('#proDesinEditorForm').form('validate')){
            $.messager.alert('提示','表单还未填写完成!');
            return ;
        }
        var data = getFormData($("#proDesinEditorForm"));
        $.ajax({
            type: "POST",
            url: 'contract/updateProDesin',
            data: JSON.stringify(data),
            dataType:'json',
            contentType:"application/json",
            cache: false,
            success: function(data){
                if (data.status == 200) {
                    $.messager.alert('提示', data.msg);
                    clearProductDesinForm();
                    $("#proDesignEditWindow").window('close');
                    $("#treeTable").treegrid({
                        url:'contract/contractdetail?code='+$("#contId").val(),
                        method:"get",
                        success:function (data) {
                            debugger;
                            $("#treeTable").treegrid("loadData", tProcessData(data));
                            $("#treeTable").treegrid("expandAll");
                        }
                    });
                    $("#treeTable").treegrid("expandAll");
                } else {
                    $.messager.alert('提示', data.msg);
                }
            }
        });
    }

    function clearEditorProductDesinForm(){
        $('#proDesinEditorForm').form('reset');
    }
</script>
