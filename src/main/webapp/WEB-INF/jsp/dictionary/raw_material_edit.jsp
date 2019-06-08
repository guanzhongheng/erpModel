<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet"> 
<script src="js/jquery.uploadfile.js"></script>
<script src="js/malsup.github.iojquery.form.js"></script>
<script src="js/jquery.edatagrid.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<div style="padding:10px 10px 10px 10px">
	<form id="rawMaterialEditForm" class="userForm" method="post">
		<input type="hidden" name="id"/>
	    <table cellpadding="5" >
	        <tr>
	            <td>原材料编号:</td>
	            <td>
					<input class="easyui-textbox" type="text" name="code" readOnly="true"/>
	            </td>
	        </tr>
			<tr>
				<td>原材料名称:</td>
				<td>
					<input class="easyui-textbox" type="text" name="name"/>
				</td>
			</tr>
			<tr>
				<td>供应商:</td>
				<td>
					<input class="easyui-textbox" type="text" name="supplier"/>
				</td>
			</tr>
			<tr>
				<td>附件信息:</td>
				<td >
					<a href="javascript:void(0)" class="easyui-linkbutton picFileUpload">上传图片</a>
					<div class="pics" >
						<ul id="rawMaterialImgList">
						</ul>
					</div>
					<input type="hidden" id="attachment" name="attachment"/>
				</td>
			</tr>
	    </table>
	</form>
	<br><br>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitRawMaterialEditForm()">提交</a>
	</div>
</div>
<script type="text/javascript">

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

    function getFormData($form) {
        var unindexed_array = $form.serializeArray();
        var indexed_array = {};

        $.map(unindexed_array, function (n, i) {
            indexed_array[n['name']] = n['value'];
        });

        return indexed_array;
    }

    $(function(){
        //加载文件上传插件
        initOrderAddFileUpload();
        //创建富文本编辑器
        //orderAddEditor = TAOTAO.createEditor("#productAddForm [name=file]");
        // productAddEditor = KindEditor.create("#productAddForm [name=note]", TT.kingEditorParams);
        //初始化类目选择和图片上传器
        TAOTAO.init({fun:function(node){
                TAOTAO.changeItemParam(node, "rawMaterialEditForm");
            }},"attachment");
    });
    //提交表单
    //有效性验证
    function submitRawMaterialEditForm(){

        if(!$('#rawMaterialEditForm').form('validate')){
            $.messager.alert('提示','表单还未填写完成!');
            return ;
        }

        var data = {};
        data =  getFormData($("#rawMaterialEditForm"));
        //ajax的post方式提交表单
        //$("#userAddForm").serialize()将表单序列号为key-value形式的字符串
        $.ajax({
            type: "POST",
            url: 'rawmaterial/update',
            data: JSON.stringify(data),
            dataType:'json',
            contentType:"application/json",
            cache: false,
            success: function(data){
                if (data.status == 200) {
                    $.messager.alert('提示', data.msg);
                    $("#rawMaterialEditForm").window('close');
                    $(".picFileUpload").siblings("div.pics").find("ul > li").remove();
                    $("#rawMaterialList").datagrid("reload");
                } else {
                    $.messager.alert('提示', data.msg);
                }
            }
        });
    }
</script>
