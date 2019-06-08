<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet">
<script src="js/jquery.uploadfile.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
    <form id="rawMaterialSearchForm" name="rawMaterialSearchForm" class="rawMaterial" method="post">
        <input type="hidden" name="id"/>
        <table cellpadding="5">
            <tr>
                <td>原材料编号:</td>
                <td>
                    <input class="easyui-textbox" type="text" name="code"/>
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
                    <div class="pics" >
                        <ul id="rawMaterialImgList">
                        </ul>
                    </div>
                </td>
            </tr>
        </table>
    </form>
    <br><br>
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
