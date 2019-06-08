<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet"> 
<script src="js/jquery.uploadfile.js"></script>
<script src="js/malsup.github.iojquery.form.js"></script>
<script src="js/jquery.edatagrid.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<div style="padding:10px 10px 10px 10px">
	<form id="semiProductEditForm" class="userForm" method="post">
		<input type="hidden" name="id"/>
	    <table cellpadding="5" >
	        <tr>
	            <td>半产品编号:</td>
	            <td>
					<input class="easyui-textbox" type="text" name="code" readOnly="true"/>
	            </td>
	        </tr>
			<tr>
				<td>半产品名称:</td>
				<td>
					<input class="easyui-textbox" type="text" name="name"/>
				</td>
			</tr>
			<tr>
				<td>半产品规格:</td>
				<td>
					<input class="easyui-textbox" type="text" name="specification"/>
				</td>
			</tr>
			<tr>
				<td>半产品厚度:</td>
				<td>
					<input class="easyui-textbox" type="text" name="tickness"/>
				</td>
			</tr>
			<tr>
				<td>内衬树脂:</td>
				<td>
					<input class="easyui-textbox" type="text" name="innerResin"/>
				</td>
			</tr>
			<tr>
				<td>结构树脂:</td>
				<td>
					<input class="easyui-textbox" type="text" name="structuralResin"/>
				</td>
			</tr>
			<tr>
				<td>外层树脂:</td>
				<td>
					<input class="easyui-textbox" type="text" name="outerResin"/>
				</td>
			</tr>
			<tr>
				<td>附件信息:</td>
				<td >
					<a href="javascript:void(0)" class="easyui-linkbutton picFileUpload">上传图片</a>
					<div class="pics" >
						<ul id="semiProdImgList">
						</ul>
					</div>
					<input type="hidden" id="attachment" name="attachment"/>
				</td>
			</tr>
	    </table>
	</form>
	<br><br>
	<table class="easyui-datagrid" id="rawMaterialEditList" name="rawMaterialEditList" title="原材料管理" border="true" fitColumns="true"
		   pagination="true" rownumbers="true" singleSelect="true" collapsible="true" toolbar="#rawMaterialDatagridToolbar"
		   data-options="">
		<thead>
		<tr>

			<th data-options="field:'name',align:'center',width:60,
                        editor:{
                            type:'combobox',
                            options:{
                                valueField:'name',
                                textField:'name',
                                url:'semiproduct/rawmaterial',
                                required:true,
                                height:34,
                                editer:false,
                                onSelect:function(value){
                                    debugger;
                                    var grid = $('#rawMaterialEditList');
                                    var rowIndex= grid.datagrid('getRowIndex',grid.datagrid('getSelected'));
                                    grid.datagrid('beginEdit', rowIndex);
                                    var editors = grid.datagrid('getEditors', rowIndex);
                                    var supplier = grid.datagrid('getEditor', { index: rowIndex, field: 'supplier' });
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
			<th data-options="field:'supplier',align:'center',width:60,editor:{type:'textbox',options:{required:true,height:34}}">
				半产品供应商
			</th>
			<th data-options="field:'code',align:'center',width:60,editor:{type:'textbox',options:{required:true,height:34}}">
				半产品编号
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
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitSemiProductEditForm()">提交</a>
	</div>
	<div class="easyui-layout" fit="true">
		<div id="rawMaterialDatagridToolbar" region="north" border="false"
			 style="border-bottom: 1px solid #ddd; height: 32px; padding: 2px 5px; background: #fafafa;">
			<div style="float: left;">
				<a href="javascript:;" onclick="javascript:$('#rawMaterialEditList').edatagrid('addRow')"
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
        $('#rawMaterialEditList').datagrid('deleteRow', value);
    }

    // $(function () {
    //     $('#rawMaterialEditList').edatagrid({
    //         onDblClickCell: function (index, field, value) {
    //             debugger;
    //             $("#rawMaterialEditList").datagrid('endEdit', index);
	//
	//
    //             if (opts.editing) {
    //                 $(this).datagrid('clearSelections');
    //             }
    //             if (opts.onDblClickCell) {
    //                 opts.onDblClickCell.call(target, index, field, value);
    //             }
    //         }
    //     });
    // });

    $(function(){
        //加载文件上传插件
        initOrderAddFileUpload();
        //创建富文本编辑器
        //orderAddEditor = TAOTAO.createEditor("#productAddForm [name=file]");
        // productAddEditor = KindEditor.create("#productAddForm [name=note]", TT.kingEditorParams);
        //初始化类目选择和图片上传器
        TAOTAO.init({fun:function(node){
                TAOTAO.changeItemParam(node, "semiProductEditForm");
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
    //提交表单
    //有效性验证
    function submitSemiProductEditForm(){

        if(!$('#semiProductEditForm').form('validate')){
            $.messager.alert('提示','表单还未填写完成!');
            return ;
        }

        var eaRows = $("#rawMaterialEditList").datagrid('getRows');
        $.each(eaRows,function(index,item){
            $("#rawMaterialEditList").datagrid('endEdit',index);
        });

        //ajax的post方式提交表单
        //$("#userAddForm").serialize()将表单序列号为key-value形式的字符串
        var data = {};
        data =  getFormData($("#semiProductEditForm"));
        var prod = $("#rawMaterialEditList").datagrid("getData");
        if(prod!=null && prod != undefined){
            data["rawMaterialList"] = prod.rows;
        }
        $.ajax({
            type: "POST",
            url: 'semiproduct/update',
            data: JSON.stringify(data),
            dataType:'json',
            contentType:"application/json",
            cache: false,
            success: function(data){
                if (data.status == 200) {
                    $.messager.alert('提示', data.msg);
                    clearProductAddForm();
                    $("#semiProductEditForm").window('close');
                    $(".picFileUpload").siblings("div.pics").find("ul > li").remove();
                    $("#semiProductList").datagrid("reload");
                } else {
                    $.messager.alert('提示', data.msg);
                }
            }
        });
    }
</script>
