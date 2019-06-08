<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet">
<script src="js/jquery.uploadfile.js"></script>
<script src="js/malsup.github.iojquery.form.js"></script>
<script src="js/jquery.edatagrid.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<div style="padding:10px 10px 10px 10px">
    <form id="proDesinForm" class="productForm" method="post">
        <input type="text" id="fContId" hidden="hidden" name="contId"/>
        <input type="text" id="fProdId" hidden="hidden" name="prodId"/>
        <table cellpadding="5">
            <tr>
                <td>产品名称:</td>
                <td>
                    <input id="fProdName" class="easyui-textbox" type="text" name="prodName">
                </td>
            </tr>
            <tr>
                <td>产品规格:</td>
                <td>
                    <input id="fSpecification" class="easyui-textbox" type="text" name="specification"
                           data-options="required:true"/>
                </td>
            </tr>


            <tr>
                <td>产品编号:</td>
                <td>
                    <input id="fCode" class="easyui-textbox" type="text" name="prodCode" data-options="required:true"/>
                </td>
            </tr>

            <tr>
                <td>产品类型:</td>
                <td>
                    <select class="easyui-combobox" id="fProdType" name="prodType" panelHeight="auto" data-options="width:150,
		            		editable:false">
                        <option value="1">树脂</option>
                        <option value="2">乙烯基</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td>产品数量:</td>
                <td>
                    <input id="quantity" class="easyui-textbox" type="text" name="quantity"
                           data-options="editor:{type:'numberbox'},required:true"/>
                </td>
            </tr>

            <tr>
                <td>产品单位:</td>
                <td>
                    <input id="prodUnit" class="easyui-textbox" type="text" name="prodUnit"
                           data-options="required:true"/>
                </td>
            </tr>

            <tr>
                <td>备注:</td>
                <td>
                    <input id="remark" class="easyui-textbox" type="text" name="remark" data-options="required:true"/>
                </td>
            </tr>

            <%--<tr>--%>
            <%--<td>附件信息:</td>--%>
            <%--<td>--%>
            <%--<a href="javascript:void(0)" class="easyui-linkbutton picFileUpload">上传图片</a>--%>
            <%--<input type="hidden" id="attachment" name="attachment"/>--%>
            <%--</td>--%>
            <%--</tr>--%>
        </table>
        <table class="easyui-datagrid" id="semiProdList" name="semiProdList" title="半产品管理" border="true"
               fitColumns="true"
               pagination="true" rownumbers="true" singleSelect="true" collapsible="true"
               toolbar="#prodAddDatagridToolbar"
               data-options="">
            <thead>
            <tr>

                <th data-options="field:'name',align:'center',width:60,
                        editor:{
                            type:'combobox',
                            options:{
                                valueField:'name',
                                textField:'name',
                                url:'product/semiprod',
                                required:true,
                                height:34,
                                editer:false,
                                onSelect:function(value){
                                    debugger;
                                    var grid = $('#semiProdList');
                                    var rowIndex= grid.datagrid('getRowIndex',grid.datagrid('getSelected'));
                                    grid.datagrid('beginEdit', rowIndex);
                                    var editors = grid.datagrid('getEditors', rowIndex);
                                    var specification = grid.datagrid('getEditor', { index: rowIndex, field: 'specification' });
                                    var code = grid.datagrid('getEditor', { index: rowIndex, field: 'code' });
                                    var id = grid.datagrid('getEditor', { index: rowIndex, field: 'id' });
                                    if(value.specification != null){
                                        $(specification.target).textbox('setValue',value.specification);
                                    }
                                    if(value.code != null){
                                    	$(code.target).textbox('setValue',value.code);
                                    }

                                    if(value.id != null){
                                        $(id.target).textbox('setValue',value.id);
                                    }
                                }
                            }
                        }">半产品名称
                </th>
                <th data-options="field:'specification',align:'center',width:60,editor:{type:'textbox',options:{required:true,height:34}}">
                    半产品规格
                </th>
                <th data-options="field:'code',align:'center',width:60,editor:{type:'textbox',options:{required:true,height:34}}">
                    半产品编号
                </th>
                <th data-options="field:'quantity',align:'center',width:60,editor:{type:'numberbox',options:{required:true,min:1,precision:0,height:34}}">
                    数量
                </th>
                <th data-options="field:'unit',align:'center',width:60,editor:{type:'textbox',options:{required:true,height:34}}">
                    单位
                </th>
                <th data-options="field:'_operate',width:60,align:'center',formatter:formatOper">操作</th>
                <th data-options="field:'id',hidden:true,editor:{type:'textbox'}"></th>
            </tr>
            </thead>
        </table>
    </form>
    <br><br>
    <div style="padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitProductAddForm()">提交</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearProductAddForm()">重置</a>
    </div>
    <!-- 数据表格组件工具栏 -->
    <div class="easyui-layout" fit="true">
        <div id="prodAddDatagridToolbar" region="north" border="false"
             style="border-bottom: 1px solid #ddd; height: 32px; padding: 2px 5px; background: #fafafa;">
            <div style="float: left;">
                <a href="javascript:;" onclick="javascript:$('#semiProdList').edatagrid('addRow')"
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
        $('#semiProdList').datagrid('deleteRow', value);
    }

    $(function () {

        $("#fProdName").combobox({
            valueField: "name",
            textField: "name",
            url: "contract/product",
            onSelect: function (value) {
                debugger;
                $("#fContId").val($("#id").val());
                $("#fProdId").val(value.id);
                $("#fSpecification").textbox("setValue", value.specification);
                $("#fCode").textbox("setValue", value.code);
                $("#fProdType").combobox('select', value.prodType);

            }
        });

        $('#semiProdList').edatagrid({
            onDblClickCell: function (index, field, value) {
                debugger;
                $("#semiProdList").datagrid('endEdit', index);


                if (opts.editing) {
                    $(this).datagrid('clearSelections');
                }
                if (opts.onDblClickCell) {
                    opts.onDblClickCell.call(target, index, field, value);
                }
            }
        });
    });

    function initValue() {
        debugger;
        var user = $("#semiProdList").datagrid("getChecked");

    }

    // var productAddEditor ;
    //页面初始化完毕后执行此方法
    $(function () {
        //加载文件上传插件
        initOrderAddFileUpload();
        //创建富文本编辑器
        //orderAddEditor = TAOTAO.createEditor("#proDesinForm [name=file]");
        // productAddEditor = KindEditor.create("#proDesinForm [name=note]", TT.kingEditorParams);
        //初始化类目选择和图片上传器
        TAOTAO.init({
            fun: function (node) {
                TAOTAO.changeItemParam(node, "proDesinForm");
            }
        }, "attachment");
    });

    function getFormData($form) {
        var unindexed_array = $form.serializeArray();
        var indexed_array = {};

        $.map(unindexed_array, function (n, i) {
            indexed_array[n['name']] = n['value'];
        });

        return indexed_array;
    }

    //提交表单
    function submitProductAddForm() {
        debugger;
        //有效性验证
        if (!$('#proDesinForm').form('validate')) {
            $.messager.alert('提示', '表单还未填写完成!');
            return;
        }

        var eaRows = $("#semiProdList").datagrid('getRows');
        $.each(eaRows, function (index, item) {
            $("#semiProdList").datagrid('endEdit', index);
        });

        //同步文本框中的订单要求
        // productAddEditor.sync();

        //ajax的post方式提交表单
        //$("#userAddForm").serialize()将表单序列号为key-value形式的字符串
        var data = {};
        data = getFormData($("#proDesinForm"));
        var prod = $("#semiProdList").datagrid("getData");
        if (prod != null && prod != undefined) {
            data["semiProdList"] = prod.rows;
        }
        $.ajax({
            type: "POST",
            url: 'contract/saveProDesin',
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json",
            cache: false,
            success: function (data) {
                if (data.status == 200) {
                    $.messager.alert('提示', data.msg);
                    clearProductDesinForm();
                    $("#proDesinForm").window('close');
                    // $(".picFileUpload").siblings("div.pics").find("ul > li").remove();
                    // $("#productList").datagrid("reload");
                    $("#treeTable").treegrid({
                        url: 'contract/contractdetail?code=' + $("#id").val(),
                        method: "get",
                        success: function (data) {
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

    function clearProductDesinForm() {
        $('#proDesinForm').form('reset');
        $('#semiProdList').edatagrid({});
    }
</script>
