<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet">
<script src="js/jquery.uploadfile.js"></script>
<script src="js/malsup.github.iojquery.form.js"></script>
<script src="js/jquery.edatagrid.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<div style="padding:10px 10px 10px 10px">
    <form id="contractAddForm" class="contractForm" method="post">
        <table cellpadding="5">
            <tr>
                <td>合同编号:</td>
                <td>
                    <input id="code" class="easyui-textbox" type="text" name="contCode" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td>合同名称:</td>
                <td>
                    <input id="name" class="easyui-textbox" type="text" name="contName"
                           data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td>合同经办人:</td>
                <td>
                    <input id="manager" class="easyui-textbox" type="text" name="manager"
                           data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td>合同签订时间:</td>
                <td>
                    <input class="easyui-datetimebox" data-options="formatter:TAOTAO.formatDate"
                           name="signDate"/>
                </td>
            </tr>
            <tr>
                <td>交货日期:</td>
                <td>-
                    <input class="easyui-datetimebox" data-options="formatter:TAOTAO.formatDate"
                           name="deleveyDate"/>
                </td>
            </tr>
            <tr>
                <td>合同评审表:</td>
                <td>
                    <a href="javascript:void(0)" class="easyui-linkbutton picFileUpload">上传图片</a>
                    <input type="hidden" id="attachment" name="attachment"/>
                </td>
            </tr>
        </table>

    </form>
    <br><br>
    <div style="padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitContractAddForm()">提交</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearContractAddForm()">重置</a>
    </div>

</div>
<script type="text/javascript">

    var contractAddEditor;
    //页面初始化完毕后执行此方法
    $(function () {
        //加载文件上传插件
        // initOrderAddFileUpload();
        //初始化类目选择和图片上传器
        debugger;
        TAOTAO.init({
            fun: function (node) {
            }
        }, "attachment");
    });

    //提交表单
    function submitContractAddForm() {
        //有效性验证
        if (!$('#contractAddForm').form('validate')) {
            $.messager.alert('提示', '表单还未填写完成!');
            return;
        }

        debugger;
        var data = getFormData($("#contractAddForm"));
        $.ajax({
            type: "POST",
            url: 'contract/insert',
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json",
            cache: false,
            success: function (data) {
                if (data.status == 200) {
                    $.messager.alert('提示', data.msg);
                    clearContractAddForm();
                    $("#contractAddWindow").window('close');
                    $(".picFileUpload").siblings("div.pics").find("ul > li").remove();
                    $("#contractList").datagrid("reload");
                } else {
                    $.messager.alert('提示', data.msg);
                }
            }
        });

    }

    function clearContractAddForm() {
        $('#contractAddForm').form('reset');
        // contractAddEditor.html('');
    }
</script>