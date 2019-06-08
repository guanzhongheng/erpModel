<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet">
<script src="js/jquery.uploadfile.js"></script>
<script src="js/malsup.github.iojquery.form.js"></script>
<script src="js/jquery.edatagrid.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<div style="padding:10px 10px 10px 10px">
    <form id="rawMaterialAddForm" class="contractForm" method="post">
        <input type="text" id="fid" hidden="hidden" name="id"/>
        <table cellpadding="5">
            <tr>
                <td>原材料名称:</td>
                <td>
                    <input id="fname" class="easyui-textbox" type="text" name="name" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td>原材料供应商:</td>
                <td>
                    <input id="fsupplier" class="easyui-textbox" type="text" name="supplier"
                           data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td>原材料编码:</td>
                <td>
                    <input id="fcode" class="easyui-textbox" type="text" name="code"
                           data-options="required:true"/>
                </td>
            </tr>

            <%--<tr>--%>
                <%--<td>原材料单位:</td>--%>
                <%--<td>--%>
                    <%--<input id="funit" class="easyui-textbox" type="text" name="unit"--%>
                           <%--data-options="required:true"/>--%>
                <%--</td>--%>
            <%--</tr>--%>

            <tr>
                <td>库存数量:</td>
                <td>
                    <input class="easyui-textbox" type="number" name="invTotal" value="0"/>
                </td>
            </tr>
            <tr>
                <td>入库数量:</td>
                <td>
                    <input class="easyui-textbox" type="number" name="addNum"/>
                </td>
            </tr>
            <tr>
                <td>原材料图片信息:</td>
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

    $(function () {
        $("#fname").combobox({
            valueField:"name",
            textField:"name",
            url:"rawmaterial/get",
            onSelect:function(value) {
                debugger;
                $("#fid").val(value.id);
                $("#fcode").textbox("setValue",value.code);
                $("#fsupplier").textbox('setValue',value.supplier);

            }
        });
    })

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
    function submitRawMaterialAddForm() {
        //有效性验证
        if (!$('#rawMaterialAddForm').form('validate')) {
            $.messager.alert('提示', '表单还未填写完成!');
            return;
        }

        debugger;
        var data = getFormData($("#rawMaterialAddForm"));
        $.ajax({
            type: "POST",
            url: 'inventory/rawmater/insert',
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json",
            cache: false,
            success: function (data) {
                if (data.status == 200) {
                    $.messager.alert('提示', data.msg);
                    clearRawMaterialAddForm();
                    $("#rawMaterialAddWindow").window('close');
                    $(".picFileUpload").siblings("div.pics").find("ul > li").remove();
                    $("#contractList").datagrid("reload");
                } else {
                    $.messager.alert('提示', data.msg);
                }
            }
        });

    }

    function clearRawMaterialAddForm() {
        $('#rawMaterialAddForm').form('reset');
        // contractAddEditor.html('');
    }
</script>