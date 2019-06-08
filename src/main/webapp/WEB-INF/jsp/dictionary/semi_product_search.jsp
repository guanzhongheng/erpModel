<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet">
<script src="js/jquery.uploadfile.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
    <form id="semiProductSearchForm" name="semiProductSearchForm" class="semiProductForm" method="post">
        <input type="hidden" name="id"/>
        <table cellpadding="5">
            <tr>
                <td>半产品编号:</td>
                <td>
                    <input class="easyui-textbox" type="text" name="code"/>
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
                    <div class="pics" >
                        <ul id="semiProdImgList">
                        </ul>
                    </div>
                </td>
            </tr>
        </table>
    </form>
    <br><br>
    <table class="easyui-datagrid" id="rawMaterialSearchList" name="rawMaterialSearchList" title="原材料管理" border="true" fitColumns="true"
           pagination="true" rownumbers="true" singleSelect="true" collapsible="true"
           data-options="">
        <thead>
        <tr>
            <th data-options="field:'name',align:'center',width:60">原材料名称
            </th>
            <th data-options="field:'supplier',align:'center',width:60">
                原材料供应商
            </th>
            <th data-options="field:'code',align:'center',width:60">
                原材料编号
            </th>
            <th data-options="field:'quantity',align:'center',width:60">
                数量
            </th>
            <th data-options="field:'unit',align:'center',width:60">
                单位
            </th>
        </tr>
        </thead>
    </table>
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
</script>
