<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet">
<script src="js/jquery.uploadfile.js"></script>
<script src="js/jquery.edatagrid.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
    <form id="contractEditForm" name="contractEditForm" class="contractForm" method="post">
        <input type="hidden" name="contId"/>
        <input type="hidden" name="mapType" id="mapType" value=""/>
        <table cellpadding="5">
            <tr>
                <td>合同编号:</td>
                <td>
                    <input class="easyui-textbox" type="text" name="contCode"/>
                </td>
            </tr>
            <tr>
                <td>合同名称:</td>
                <td>
                    <input class="easyui-textbox" type="text" name="contName"/>
                </td>
            </tr>
            <tr>
                <td>合同经办人:</td>
                <td>
                    <input class="easyui-textbox" type="text" name="manager"/>
                </td>
            </tr>
            <tr>
                <td>合同签订时间:</td>
                <td>
                    <input class="easyui-datetimebox" data-options="formatter:TAOTAO.formatDate" name="signDate"/>
                </td>
            </tr>
            <tr>
                <td>交货日期:</td>
                <td>
                    <input class="easyui-datetimebox" data-options="formatter:TAOTAO.formatDate" name="deleveyDate"/>
                </td>
            </tr>
            <tr>
                <td>合同评审表:</td>
                <td>
                    <a href="javascript:void(0)" class="easyui-linkbutton picFileUpload">上传图片</a>
                    <input type="hidden" id="attachment" name="attachment"/>
                    <div class="pics"></div>
                </td>
            </tr>
        </table>
    </form>
    <br><br>
    <table class="easyui-datagrid" id="prodEdList" name="prodEdList" title="产品管理" border="true" fitColumns="true"
           pagination="false" rownumbers="true" singleSelect="true" collapsible="true" toolbar="#contractEdDatagridToolbar"
           data-options="method:'get'">
        <thead>
        <tr>

            <th data-options="field:'prodName',align:'center',width:60,
                        editor:{
                            type:'combobox',
                            options:{
                                valueField:'name',
                                textField:'name',
                                url:'contract/product',
                                required:true,
                                height:34,
                                editor:false,
                                onSelect:function(value){
                                    debugger;
                                    var grid = $('#prodEdList');
                                    var rowIndex= grid.datagrid('getRowIndex',grid.datagrid('getSelected'));
                                    grid.datagrid('beginEdit', rowIndex);
                                    var editors = grid.datagrid('getEditors', rowIndex);
                                    var specification = grid.datagrid('getEditor', { index: rowIndex, field: 'specification' });
                                    var prodCode = grid.datagrid('getEditor', { index: rowIndex, field: 'prodCode' });
                                    var prodType = grid.datagrid('getEditor', { index: rowIndex, field: 'prodType' });
                                    if(value.specification != null){
                                        $(specification.target).textbox('setValue',value.specification);
                                    }
                                    if(value.code != null){
                                     $(prodCode.target).textbox('setValue',value.code);
                                    }

                                    if(value.prodType != null){
                                    $(prodType.target).textbox('setValue',value.prodType);
                                    }
                                }
                            }
                        }">产品名称
            </th>
            <th data-options="field:'specification',align:'center',width:60,editor:{type:'textbox',options:{required:true,height:34}}">
                产品规格
            </th>
            <th data-options="field:'prodCode',align:'center',width:60,editor:{type:'textbox',options:{required:true,height:34}}">
                产品编号
            </th>
            <th data-options="field:'quantity',align:'center',width:60,editor:{type:'numberbox',options:{required:true,min:1,precision:0,height:34}}">
                数量
            </th>
            <th data-options="field:'_operate',width:60,align:'center',formatter:formatOper">操作</th>
            <th data-options="field:'prodType',hidden:true,editor:{type:'textbox'}"></th>
            <th data-options="field:'contDetailId',hidden:true,editor:{type:'textbox'}"></th>
        </tr>
        </thead>
    </table>

    <div style="padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitContractEditForm()">提交</a>
    </div>
    <!-- 数据表格组件工具栏 -->
    <div class="easyui-layout" fit="true">
        <div id="contractEdDatagridToolbar" region="north" border="false"
             style="border-bottom: 1px solid #ddd; height: 32px; padding: 2px 5px; background: #fafafa;">
            <div style="float: left;">
                <a href="javascript:;" onclick="javascript:$('#prodEdList').edatagrid('addRow')"
                   class="easyui-linkbutton c1" iconCls="icon-add">添加</a>

            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    function formatOper(val, row, index) {
        return '<a href="#" class="easyui-linkbutton c3" iconCls="icon-remove"  onclick="delData(' + index + ')">删除</a>';
    }

    function delData(value) {
        $('#prodEdList').datagrid('deleteRow', value);
    }

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

    // 加载图片
    function initContractPic(data) {
        $(".contractPic").each(function (i, e) {
            var _ele = $(e);
            _ele.siblings("div.pics").remove();
            _ele.after('\
    			<div class="pics">\
        			<ul></ul>\
        		</div>');
            // 回显图片
            var j = false;
            if (data && data.pics) {
                var imgs = data.pics.split(",");
                for (var i in imgs) {
                    if ($.trim(imgs[i]).length > 0) {
                        _ele.siblings(".pics").find("ul").append("<li><a id='img" + i + "' href='" + imgs[i] + "' target='_blank'>" +
                            "<img src='" + imgs[i] + "' width='80' height='50' /></a> ");
                        j = true;
                    }
                }
            }
            if (!j) {
                $("#contractPic").html("<span style='font-size: 12px;font-family: Microsoft YaHei;'>无</span>");
            }
        });
    }

    function clearManuSpan() {
        $("#contractPic").html('');
    }

    function submitContractEditForm() {

        debugger;
        if (!$('#contractEditForm').form('validate')) {
            $.messager.alert('提示', '表单还未填写完成!');
            return;
        }

        var eaRows = $("#prodEdList").datagrid('getRows');
        $.each(eaRows,function(index,item){
            $("#prodEdList").datagrid('endEdit',index);
        });

        var data = {};
        data = getFormData($("#contractEditForm"));
        var prod = $("#prodEdList").datagrid("getData");
        if (prod != null && prod != undefined) {
            data["prodList"] = prod.rows;
        }

        $.ajax({
            type: "POST",
            url: 'contract/update',
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json",
            cache: false,
            success: function (data) {
                if (data.status == 200) {
                    $.messager.alert('提示', data.msg);
                    $("#contractEditWindow").window('close');
                    $("#contractList").datagrid("reload");
                } else {
                    $.messager.alert('提示', data.msg);
                }
            }
        });

    }
</script>
