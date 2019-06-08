<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet">
<script src="js/jquery.uploadfile.js"></script>
<script src="js/jquery.edatagrid.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">

    <form id="productDesignForm" name="productDesignForm" class="contractForm" method="post">
        <input type="hidden" name="contId" id="id"/>
        <input type="hidden" name="mapType" value=""/>
        <table cellpadding="5">
            <tr>
                <td>清单编号:</td>
                <td>
                    <input class="easyui-textbox" type="text" name="" value="" disabled/>
                </td>
            </tr>
            <tr>
                <td>交货日期:</td>
                <td>
                    <input class="easyui-datetimebox" data-options="formatter:TAOTAO.formatDate"
                           name="deleveyDate" value="" disabled/>
                </td>
            </tr>
            <tr>
                <td>合同编号:</td>
                <td>
                    <input class="easyui-textbox" type="text" name="contCode" disabled/>
                </td>
            </tr>
            <tr>
                <td>合同名称:</td>
                <td>
                    <input class="easyui-textbox" type="text" name="contName" disabled/>
                </td>
            </tr>

        </table>
    </form>
    <br><br>


    <table id="treeTable" name="treeTable" title="产品设计" border="true" fitColumns="false"
           pagination="false" rownumbers="true" singleSelect="true" collapsible="true"
           toolbar="#treeDatagridToolbar"></table>

    <div style="padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitProDesignEditForm()">提交</a>
        <%--<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearProDesinForm()">重置</a>--%>
    </div>


    <div class="easyui-layout" fit="true">
        <div id="treeDatagridToolbar" region="north" border="false"
             style="border-bottom: 1px solid #ddd; height: 32px; padding: 2px 5px; background: #fafafa;">
            <div style="float: left;">
                <a href="#" id="btn_add" class="easyui-linkbutton" plain="true" icon="icon-add">添加</a>
                <a href="#" id="btn_edit" class="easyui-linkbutton" plain="true" icon="icon-edit">编辑</a>
                <a href="#" id="btn_delete" class="easyui-linkbutton" plain="true" icon="icon-cancel">删除</a>
            </div>
        </div>
    </div>
</div>

<div id="proDesignEditWindow" class="easyui-window" title="编辑产品" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'contract/productEditorDesign'" style="width:45%;height:60%;padding:10px;">
</div>
<div id="proDesignAddWindow" class="easyui-window" title="添加产品" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'contract/productDesign'" style="width:45%;height:60%;padding:10px;">


    <script type="text/javascript" charset="utf-8" src="js/hh/productDesign.js"></script>

    <%--<script type="text/javascript" charset="utf-8" src="js/bootstrap/dist/js/bootstrap.min.js"></script>--%>

    <script type="text/javascript">

        $('#btn_delete').on('click', function () {
            $.get("contract/delete_judge", '', function (data) {
                if (data.msg != null) {
                    $.messager.alert('提示', data.msg);
                } else {
                    var selected = $table.treegrid("getSelected");
                    debugger;
                    if (selected.length == 0) {
                        $.messager.alert('提示', '未选中产品!');
                        return;
                    }
                    $.messager.confirm('确认', '确定删除产品名称为 ' + selected['prodName'] + ' 的产品吗？', function (r) {
                        if (r) {
                            debugger;
                            $.ajax({
                                type: 'POST',
                                url: "contract/deleteProDesin",
                                data: JSON.stringify(selected),
                                dataType: 'json',
                                contentType: "application/json",
                                success: function (data) {
                                    if (data.status == 200) {
                                        $.messager.alert('提示', '删除产品成功!', undefined, function () {
                                            $('#productDesignList').edatagrid({});
                                        });
                                    }
                                }
                            });
                        }
                    });
                }
            });
        });


        function submitProDesignEditForm() {

            debugger;
            if (!$('#prodDesignForm').form('validate')) {
                $.messager.alert('提示', '表单还未填写完成!');
                return;
            }

            var data = {};
            var prod = $("#productDesignList").datagrid("getData");
            if (prod != null && prod != undefined) {
                data["contDetaiList"] = prod.rows;
            }

            $.ajax({
                type: "POST",
                url: 'contract/updateContDetail',
                data: JSON.stringify(prod.rows),
                dataType: 'json',
                contentType: "application/json",
                cache: false,
                success: function (data) {
                    if (data.status == 200) {
                        $.messager.alert('提示', data.msg);

                    } else {
                        $.messager.alert('提示', data.msg);
                    }
                }
            });
        }

        function clearProDesinForm() {
            $('#contractAddForm').form('reset');
            $('#productDesignList').edatagrid({});
        }
    </script>