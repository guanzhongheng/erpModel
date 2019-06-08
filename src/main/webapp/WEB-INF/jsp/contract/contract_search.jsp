<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet">
<script src="js/jquery.uploadfile.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
    <form id="contractSearchForm" name="contractSearchForm" class="contractForm" method="post">
        <input type="hidden" name="contId" id="contId" value=""/>
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
    <table class="easyui-datagrid" id="prodSearchList" name="prodSearchList" title="产品管理" border="true" fitColumns="true"
           pagination="false" rownumbers="true" singleSelect="true" collapsible="true"  toolbar="#contractExportToolbar"
           data-options="singleSelect:false,method:'get'">
        <thead>
        <tr>
            <th data-options="field:'prodName',align:'center',width:60">产品名称</th>
            <th data-options="field:'specification',align:'center',width:60">产品规格</th>
            <th data-options="field:'prodCode',align:'center',width:60">产品编号</th>
            <%--<th data-options="field:'quantity',align:'center',width:60">--%>
                <%--数量--%>
            <%--</th>--%>
            <%--<th data-options="field:'unQuantity',align:'center',width:60">--%>
                <%--未发货数量--%>
            <%--</th>--%>
        </tr>
        </thead>
    </table>
</div>
<div class="easyui-layout" fit="true">
    <div id="contractExportToolbar" region="north" border="false"
         style="border-bottom: 1px solid #ddd; height: 32px; padding: 2px 5px; background: #fafafa;">
        <div style="float: left">
            <a href="javascript:;" onclick="doExportProd()"
               class="easyui-linkbutton c1" iconCls="icon-save">导出</a>

        </div>
    </div>
</div>

<script type="text/javascript">

    function doExportProd(){
        var contId = $("#contId").val();
        window.location.href = "/export/productDesin?contId=" + contId;
    }


    $(function () {
        debugger;
        $("#imgList").innerHTML = "12312412";
    });
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

    function submitContractEditForm(){
        if(!$('#contractSearchForm').form('validate')){
            $.messager.alert('提示','表单还未填写完成!');
            return ;
        }
        $.post("contract/update_all",$("#contractSearchForm").serialize(), function(data){
            if(data.status == 200){
                $.messager.alert('提示', data.msg);
                $("#contractEditWindow").window('close');
                $("#contractList").datagrid("reload");
            }else{
                $.messager.alert('提示', data.msg);
            }
        });
    }
</script>
