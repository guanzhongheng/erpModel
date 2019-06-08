<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet">
<script src="js/jquery.uploadfile.js"></script>
<script src="js/jquery.edatagrid.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
    <form id="productEditForm" name="productEditForm" class="productForm" method="post">
        <input type="hidden" name="id"/>
        <table cellpadding="5">
            <tr>
                <td>产品编号:</td>
                <td>
                    <input class="easyui-textbox" type="text" name="code" readOnly="true"/>
                </td>
            </tr>
            <tr>
                <td>产品名称:</td>
                <td>
                    <input class="easyui-textbox" type="text" name="name"/>
                </td>
            </tr>
            <tr>
                <td>产品规格:</td>
                <td>
                    <input class="easyui-textbox" type="text" name="specification"/>
                </td>
            </tr>
            <tr>
                <td>产品类型:</td>
                <td>
                    <select id="cc" class="easyui-combobox" name="type" data-options="required:true,width:150,
		            	editable:false">
                        <option value="1">树脂</option>
                        <option value="2">乙烯基</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>附件信息:</td>
                <td >
                    <a href="javascript:void(0)" class="easyui-linkbutton picFileUpload">上传图片</a>
                    <div class="pics" >
                        <ul id="prodImgList">
                        </ul>
                    </div>
                    <input type="hidden" id="attachment" name="attachment"/>
                </td>
            </tr>
        </table>
    </form>
    <br><br>
    <table class="easyui-datagrid" id="semiProdEditList" name="semiProdEditList" title="半产品管理" border="true" fitColumns="true"
           pagination="true" rownumbers="true" singleSelect="true" collapsible="true" toolbar="#prodEditDatagridToolbar"
           data-options="">
        <thead>
        <tr>
            <th data-options="field:'name',align:'center',width:60">半产品名称
            </th>
            <th data-options="field:'code',align:'center',width:60">
                半产品编号
            </th>
            <th data-options="field:'specification',align:'center',width:60">
                半产品规格
            </th>
            <th data-options="field:'quantity',align:'center',width:60,editor:{type:'numberbox',options:{required:true,min:1,precision:0,height:34}}">
                数量
            </th>
            <th data-options="field:'unit',align:'center',width:60,editor:{type:'textbox',options:{required:true,min:1,precision:0,height:34}}">
                单位
            </th>
            <th data-options="field:'_operate',width:60,align:'center',formatter:formatOper">操作</th>
            <th data-options="field:'id',hidden:true,editor:{type:'textbox'}"></th>
        </tr>
        </thead>
    </table>
    <div style="padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitProductEditForm()">提交</a>
    </div>
    <!-- 数据表格组件工具栏 -->
    <div class="easyui-layout" fit="true">
        <div id="prodEditDatagridToolbar" region="north" border="false"
             style="border-bottom: 1px solid #ddd; height: 32px; padding: 2px 5px; background: #fafafa;">
            <div style="float: left;">
                <a href="javascript:;" onclick="javascript:$('#semiProdEditList').edatagrid('addRow')"
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
        $('#semiProdEditList').datagrid('deleteRow', value);
    }

    // $(function () {
        // $('#semiProdEditList').edatagrid({
        //     onDblClickCell: function (index, field, value) {
        //         debugger;
        //         $("#semiProdEditList").datagrid('endEdit', index);
        //     }
        // });
    // });

    function formateDate(value, row, index) {
        if (value == null || value == '') {
            return '';
        }
        var dt;
        if (value instanceof Date) {
            dt = value;
        } else {
            dt = new Date(value);
        }
        return dt.format("yyyy-MM-dd hh:mm:ss");
    }

    $(function(){
        //加载文件上传插件
        initOrderAddFileUpload();
        //创建富文本编辑器
        //orderAddEditor = TAOTAO.createEditor("#productAddForm [name=file]");
        // productAddEditor = KindEditor.create("#productAddForm [name=note]", TT.kingEditorParams);
        //初始化类目选择和图片上传器
        TAOTAO.init({fun:function(node){
                TAOTAO.changeItemParam(node, "productEditForm");
            }},"attachment");
    });

    function getFormData($form) {
        var unindexed_array = $form.serializeArray();
        var indexed_array = {};

        $.map(unindexed_array, function (n, i) {
            indexed_array[n['name']] = n['value'];
        });

        return indexed_array;
    }

    function initValue() {
        debugger;
        var user = $("#semiProdEditList").datagrid("getChecked");

    }

    function initProductPic(data){
        $(".productPic").each(function(i,e){
            var _ele = $(e);
            _ele.siblings("div.pics").remove();
            _ele.after('\
    			<div class="pics">\
        			<ul></ul>\
        		</div>');
            // 回显图片
            var j = false;
            if(data && data.pics){
                var imgs = data.pics.split(",");
                for(var i in imgs){
                    if($.trim(imgs[i]).length > 0){
                        _ele.siblings(".pics").find("ul").append("<li><a id='img"+i+"' href='"+imgs[i]+"' target='_blank'>" +
                            "<img src='"+imgs[i]+"' width='80' height='50' /></a> ");
                        j = true;
                    }
                }
            }
            if(!j){
                $("#productPic").html("<span style='font-size: 12px;font-family: Microsoft YaHei;'>无</span>");
            }
        });
    }

    function clearManuSpan(){
        $("#productPic").html('');
    }

    function submitProductEditForm(){

        var eaRows = $("#semiProdEditList").datagrid('getRows');
        $.each(eaRows,function(index,item){
            $("#semiProdEditList").datagrid('endEdit',index);
        });

        var data = {};
        data =  getFormData($("#productEditForm"));
        var prod = $("#semiProdEditList").datagrid("getData");
        if(prod!=null && prod != undefined){
            data["semiProdList"] = prod.rows;
        }
        $.ajax({
            type: "POST",
            url: 'product/update',
            data: JSON.stringify(data),
            dataType:'json',
            contentType:"application/json",
            cache: false,
            success: function(data){
                if (data.status == 200) {
                    $.messager.alert('提示', data.msg);
                    $("#productEditForm").window('close');
                    $(".picFileUpload").siblings("div.pics").find("ul > li").remove();
                    $("#productList").datagrid("reload");
                } else {
                    $.messager.alert('提示', data.msg);
                }
            }
        });
        if(!$('#productEditForm').form('validate')){
            $.messager.alert('提示','表单还未填写完成!');
            return ;
        }
    }
</script>
