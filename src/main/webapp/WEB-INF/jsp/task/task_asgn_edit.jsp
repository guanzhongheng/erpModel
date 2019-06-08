<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet">
<script src="js/jquery.uploadfile.js"></script>
<script src="js/jquery.edatagrid.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
    <form id="taskAsgnEditForm" name="taskAsgnEditForm" class="taskAsgnForm" method="post">
        <input type="hidden" name="id"/>
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
                    <input class="easyui-textbox" type="text" name="signDate"/>
                </td>
            </tr>
            <tr>
                <td>合同评审表:</td>
                <td >
                    <div class="pics" >
                        <ul id="imgList">
                        </ul>
                    </div>
                </td>
            </tr>
        </table>
    </form>
    <br><br>
    <table class="easyui-datagrid" id="taskAsgnProdList" name="taskAsgnProdList" title="产品管理" border="true" fitColumns="true"
           pagination="false" rownumbers="true" singleSelect="true" collapsible="true"
           data-options="method:'get'">
        <thead>
        <tr>
            <th data-options="field:'name',align:'center',width:60">产品名称
            </th>
            <th data-options="field:'code',align:'center',width:60">
                产品编号
            </th>
            <th data-options="field:'specification',align:'center',width:60">
                产品规格
            </th>
            <th data-options="field:'username',align:'center',width:60,
                        editor:{
                            type:'combobox',
                            options:{
                                valueField:'username',
                                textField:'username',
                                url:'user/search',
                                required:true,
                                height:34,
                                editor:false
                            }
                        }">班组分配
            </th>
        </tr>
        </thead>
    </table>
    <div style="padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitTaskAsgnEditForm()">提交</a>
    </div>
</div>
<script type="text/javascript">

    // 加载图片
    function initContractPic(data){
        $(".contractPic").each(function(i,e){
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
                $("#contractPic").html("<span style='font-size: 12px;font-family: Microsoft YaHei;'>无</span>");
            }
        });
    }

    function clearManuSpan(){
        $("#contractPic").html('');
    }

    function getFormData($form) {
        var unindexed_array = $form.serializeArray();
        var indexed_array = {};

        $.map(unindexed_array, function (n, i) {
            indexed_array[n['name']] = n['value'];
        });

        return indexed_array;
    }

    function submitTaskAsgnEditForm(){
        debugger;
        if(!$('#taskAsgnEditForm').form('validate')){
            $.messager.alert('提示','表单还未填写完成!');
            return ;
        }
        var eaRows = $("#taskAsgnProdList").datagrid('getRows');
        $.each(eaRows,function(index,item){
            $("#taskAsgnProdList").datagrid('endEdit',index);
        });

        //ajax的post方式提交表单
        //$("#userAddForm").serialize()将表单序列号为key-value形式的字符串
        var data = {};
        data =  getFormData($("#taskAsgnEditForm"));
        var prod = $("#taskAsgnProdList").datagrid("getData");
        if(prod!=null && prod != undefined){
                data["prodList"] = prod.rows;
        }
        $.ajax({
            type: "POST",
            url: 'taskasgn/update',
            data: JSON.stringify(data),
            dataType:'json',
            contentType:"application/json",
            cache: false,
            success: function(data){
                if (data.status == 200) {
                    $.messager.alert('提示', data.msg);
                    $("#taskAsgnEditForm").window('close');
                    $(".picFileUpload").siblings("div.pics").find("ul > li").remove();
                    $("#taskAsgnList").datagrid("reload");
                } else {
                    $.messager.alert('提示', data.msg);
                }
            }
        });
    }
</script>
