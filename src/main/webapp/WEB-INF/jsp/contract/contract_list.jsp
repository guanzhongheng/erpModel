<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>





<table class="easyui-datagrid" id="contractList" title="合同列表" selectOnCheck="true"
       data-options="singleSelect:false,collapsible:true,pagination:true,rownumbers:true,url:'contract/list',
       	method:'get',pageSize:10,fitColumns:true,toolbar:toolbar_contract">
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'contId',hidden:true,align:'center',width:60"/>
        <th data-options="field:'contCode',align:'center',width:60">合同编号</th>
        <th data-options="field:'contName',align:'center',width:60">合同名称</th>
        <th data-options="field:'manager',align:'center',width:60">合同经办人</th>
        <th data-options="field:'signDate',align:'center',width:60">合同签订时间</th>
        <th data-options="field:'status',width:60,align:'center'">合同状态</th>
        <th data-options="field:'deleveyDate',width:60,align:'center'">合同交付日期</th>
        <th data-options="field:'nid',align:'center',width:120,formatter:formatUserOper">操作</th>
        <%--<th data-options="field:'attachment',width:60,align:'center', formatter:formatImg">附件信息</th>--%>
    </tr>
    </thead>
</table>

<div id="toolbar_contract" style=" height: 22px; padding: 3px 11px; background: #fafafa;">

    <c:forEach items="${sessionScope.sysPermissionList}" var="per">
        <c:if test="${per=='contract:add' }">
            <div style="float: left;">
                <a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="contract_add()">新增</a>
            </div>
        </c:if>
        <c:if test="${per=='contract:edit' }">
            <div style="float: left;">
                <a href="#" class="easyui-linkbutton" plain="true" icon="icon-edit" onclick="contract_edit()">编辑</a>
            </div>
        </c:if>
        <c:if test="${per=='contract:delete' }">
            <div style="float: left;">
                <a href="#" class="easyui-linkbutton" plain="true" icon="icon-cancel" onclick="contract_delete()">删除</a>
            </div>
        </c:if>
    </c:forEach>

    <div class="datagrid-btn-separator"></div>

    <div style="float: left;">
        <a href="#" class="easyui-linkbutton" plain="true" icon="icon-reload" onclick="contract_reload()">刷新</a>
    </div>

    <div id="search_contract" style="float: right;">
        <input type="text" name="contCode" id="code" size=20 placeholder="合同编号"/>
        <input type="text" name="contName" id="name" size=20 placeholder="合同名称"/>
        <input type="text" name="manager" id="manager" size=20 placeholder="合同经办人"/>
        <%--<input type="text" name="status" id="status"  size=20 placeholder="合同状态"/>--%>
        <input type="text" name="signDate" id="createTime" size=20 placeholder="合同签订时间"/>
        <select name="status" id="status">
            <option value="a">请选择合同状态</option>
            <option value="0">新建</option>
            <option value="1">待分配</option>
            <option value="2">执行</option>
            <option value="3">完成</option>
        </select>
        <span class="l-btn" style="width: 50px;height: 20px;" id="search_text_user"
              onclick="doSearch_contract()">搜索</span>
    </div>

</div>

<div id="contractSearchWindow" class="easyui-window" title="查看合同" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'contract/search'" style="width:45%;height:70%;padding:10px;">
</div>
<div id="contractEditWindow" class="easyui-window" title="编辑合同" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'contract/edit'" style="width:45%;height:70%;padding:10px;">
</div>
<div id="contractAddWindow" class="easyui-window" title="添加合同" data-options="modal:true,closed:true,resizable:true,
	iconCls:'icon-save',href:'contract/add'" style="width:45%;height:70%;padding:10px;">
</div>

<script>
    function doSearch_contract() { //用户输入用户名,点击搜素,触发此函数

        $('#contractList').datagrid('load', {
            contCode: $('#code').val(),
            contName: $('#name').val(),
            manager: $('#manager').val(),
            status: $('#status').val(),
        });
    }


    function formatUserOper(value, row, index) {
        var $row = JSON.stringify(row).replace(/\"/g, "'");
        return '<a href="#" onclick="contract_search(' + $row + ')" >查看</a> &nbsp;&nbsp;' +
            '<a href="#" onclick="product_design(' + $row + ')">产品设计</a>';
    };


    function getContractSelectionsIds() {
        var contractList = $("#contractList");
        var sels = contractList.datagrid("getSelections");
        var ids = [];
        for (var i in sels) {
            ids.push(sels[i].contId);
        }
        ids = ids.join(",");

        return ids;
    }

    function contract_add() {
        $.get("contract/add_judge", '', function (data) {
            if (data.msg != null) {
                $.messager.alert('提示', data.msg);
            } else {

                $("#contractAddWindow").window({
                    onLoad: function () {
                        $('#contractAddForm').form('reset');
                        $('#prodList').edatagrid({});
                    }
                }).window("open");

            }
        });
    }

    function getImg(str,num) {
        var res = "";
        debugger;
        if (str != null) {
            var s = str.split(",");
            for (var i = 0; i < s.length; i++) {
                if (s[i].length > 0 && s[i] != '') {
                    res += "<li><a><li id='img" + i + "' href='" + s[i] + "' target='_blank'>" +
                        "<img src='" + s[i] + "' width='80' height='50' /></a>" +
                        "<a id='del" + i + "' href='javascript:removeImg(" + i + ",attachment);'>";
                            if(num == 0){
                                res +=  "<span style='font-size: 16px;font-family: Microsoft YaHei;;margin-left: 16px'>删除</span>"
                            }
                        res += "</a></li>"
                }
            }
        }
        return res;
    }


    //删除图片并删除图片在页面的显示
    function removeImg(i,imageName){
        var picName = $('#img'+i).attr("href");
        //alert($('#image').val());
        $.ajax({
            cache: false,
            url: "pic/delete",
            dataType: "json",
            data: {picName:picName},
            success: function(data)
            {
                if(data.data=="success"){
                    $('#img'+i).remove();		//删除成功后在页面上删除该图片的显示
                    $('#del'+i).remove();
                    var urls = $('#'+imageName).val().split(",");  //将删除的文件url从urls中移除
                    var deletedUrls = [];
                    for(var k in urls){
                        if(urls[k] != picName){
                            deletedUrls.push(urls[k]);
                        }
                    }
                    deletedUrls = deletedUrls.join(",");
                    $('#image').val(deletedUrls);
                }else{
                    console.log(data.message);  //打印服务器返回的错误信息
                }
            }
        });
    }


    function contract_search(value) {
        value["mapType"] = "1";
        $("#contractSearchWindow").window({
            onLoad: function () {
                //回显数据
                debugger;
                $("#contractSearchForm").form("load", value);
                $("#imgList").append(getImg(value.attachment,1));

                $("#prodSearchList").datagrid({
                    url: 'contract/contractdetail?code=' + value.contId
                })

                $('input,select,textarea', $('form[name="contractSearchForm"]')).prop('readonly', true);
            }
        }).window("open");
    }

    function contract_edit() {
        debugger;
        $.get("contract/edit_judge", '', function (data) {
            if (data.msg != null) {
                $.messager.alert('提示', data.msg);
            } else {
                var ids = getContractSelectionsIds();

                if (ids.length == 0) {
                    $.messager.alert('提示', '必须选择一个合同才能编辑!');
                    return;
                }
                if (ids.indexOf(',') > 0) {
                    $.messager.alert('提示', '只能选择一个合同!');
                    return;
                }
                debugger;

                $("#contractEditWindow").window({
                    onLoad: function () {
                        //回显数据
                        var data = $("#contractList").datagrid("getSelections")[0];
                        $("#contractEditForm").form("load", data);
                        debugger;
                        $("#prodEdList").edatagrid({
                            url: 'contract/contractdetail?code=' + ids, autoSave: true
                        });


                        $(".pics").find("ul").append(getImg(data.attachment,0));

                    }
                }).window("open");
            }
        });
    }


    function product_design(value) {
        debugger;


        if (!$('#tabs').tabs('exists', '产品设计列表')) {
            $('#tabs').tabs('add', {
                title: '产品设计列表',
                href: 'contract/productDesignList',
                border: false,
                bodyCls: "indexTabBody",
                closable: true,
                onLoad: function () {
                    debugger;
                    $("#productDesignForm").form("load", value);
                    $.ajax({
                        url: 'contract/prodPracticaInfo?contId=' + value.contId,
                        method: "get",
                        success: function (data) {
                            debugger;
                            $("#treeTable").treegrid("loadData", tProcessData(data));
                            $("#treeTable").treegrid("expandAll");
                            page_init_complete_callback();
                        }
                    });
                }
            });
        } else {
            $("#tabs").tabs("select", '产品设计列表');
            var selTab = $('#tabs').tabs('getSelected');
            $('#tabs').tabs('update', {
                tab: selTab,

                options: {
                    href: 'contract/productDesignList'
                },
                onLoad: function () {
                    $("#productDesignForm").form("load", value);
                    $.ajax({
                        url: 'contract/prodPracticaInfo?contId=' + value.contId,
                        method: "get",
                        success: function (data) {
                            debugger;
                            $("#treeTable").treegrid("loadData", tProcessData(data));
                            $("#treeTable").treegrid("expandAll");
                            page_init_complete_callback();
                        }
                    });
                }
            })
        }
    }

    function contract_delete() {
        $.get("contract/delete_judge", '', function (data) {
            if (data.msg != null) {
                $.messager.alert('提示', data.msg);
            } else {
                var ids = getContractSelectionsIds();
                if (ids.length == 0) {
                    $.messager.alert('提示', '未选中合同!');
                    return;
                }
                $.messager.confirm('确认', '确定删除ID为 ' + ids + ' 的合同吗？', function (r) {
                    if (r) {
                        var params = {"ids": ids};
                        $.post("contract/delete_batch", params, function (data) {
                            if (data.status == 200) {
                                $.messager.alert('提示', '删除合同成功!', undefined, function () {
                                    $("#contractList").datagrid("reload");
                                });
                            }
                        });
                    }
                });
            }
        });
    }

    function contract_reload() {
        $("#contractList").datagrid("reload");
    }
</script>