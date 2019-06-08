<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet"> 
<script src="js/jquery.uploadfile.js"></script>
<script src="js/malsup.github.iojquery.form.js"></script>
<script src="js/jquery.edatagrid.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>

<div style="padding:10px 10px 10px 10px">
	<form id="deliveryListForm" class="productForm" method="post">
	    <table cellpadding="5" >
	        <tr>
	            <td>出库单号:</td>
	            <td>
	            	<input id="deliveryCode" class="easyui-textbox" type="text" name="deliveryCode" data-options="required:true"/>
	            </td>
	        </tr>
			<tr>
				<td>发货时间:</td>
				<td>
					<input class="easyui-datetimebox" data-options="formatter:TAOTAO.formatDate"
						   name="deleveyDate"/>
				</td>
			</tr>
			<tr>
				<td>发货地址:</td>
				<td>
					<input id="deleveyAddress" class="easyui-textbox" type="text" name="deleveyAddress" data-options="required:true"/>
				</td>
			</tr>
	    </table>
	</form>
	<form id="" name="" class="contractForm" method="post">
		<table cellpadding="5">
			<tr>
				<td>合同名称:</td>
				<td>
					<select id="changeContact" class="easyui-combobox" name="roleId"  panelHeight="auto" data-options="valueField:'contId',
	            		textField:'contName',url:'contract/validContract?status=1',required:true, editable:false,align:'center',width:90"/>
				</td>
			</tr>
		</table>
	</form>
	<form name="" class="contractForm" method="post">
		<input type="hidden" name="id"/>
		<table class="easyui-datagrid" id="contDetailList" title="合同明细列表" data-options="singleSelect:false,toolbar:toolbar_delivery">
			<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'prodName',align:'center',width:80">产品名称</th>
				<th data-options="field:'prodCode',align:'center',width:80">产品编号</th>
				<th data-options="field:'specification',align:'center',width:100">产品规格</th>
				<th data-options="field:'quantity',align:'center',width:60">合同数量</th>
				<th data-options="field:'unQuantity',align:'center',width:60">未完成数量</th>
				<th data-options="field:'prodUnit',align:'center',width:60">单位</th>
			</tr>
			</thead>
		</table>
	</form>
	<br>
	<form id="contractDetailForm" name="contractDetailForm" class="contractForm" method="post">
		<input type="hidden" name="id"/>
		<table class="easyui-datagrid" id="deliverDetailList" title="出库单明细">
			<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'contId',hidden:true"></th>
				<th data-options="field:'contName',align:'center',width:80">合同名称</th>
				<th data-options="field:'prodName',align:'center',width:80">产品名称</th>
				<th data-options="field:'prodCode',align:'center',width:80">产品编号</th>
				<th data-options="field:'specification',align:'center',width:100">产品规格</th>
				<th data-options="field:'addNum',width:60,align:'center',editor:{type:'textbox',options:{required:true,height:34}}" >出库数量</th>
				<th data-options="field:'prodUnit',align:'center',width:60">单位</th>
				<th data-options="field:'_delivery',width:60,align:'center',formatter:formatOperForDelivery">操作</th>
			</tr>
			</thead>
		</table>
	</form>
	<br>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitDeliveryAddForm()">提交</a>
	</div>

	<div  id="toolbar_delivery" style="height: 22px; padding: 3px 11px; background: #fafafa;">
		<div style="float: left;">
			<a href="#" class="easyui-linkbutton" plain="true" icon="icon-add" onclick="moveDelivery()">新增</a>
		</div>
	</div>

</div>
<script type="text/javascript">
    $(function () {
        $("#changeContact").combobox({
            onChange: function (nvalue, ovalue) {
                debugger;
                $("#contDetailList").edatagrid({
                    url: "contract/contractdetails",
                    method:'get',
                    pagination: true,
                    queryParams: {
                        contId: nvalue
                    }
                })

            }
        });
        $("#deliverDetailList").edatagrid({});
    })

    function formatOperForDelivery(val, row, index){
        return '<a href="#" class="easyui-linkbutton c3" iconCls="icon-remove"  onclick="delDeliveryData(' + index + ')">删除</a>';
	}

	function delDeliveryData(index) {
        debugger;
        if($('#deliverDetailList').edatagrid("getRows").length > 1){
            $('#deliverDetailList').edatagrid('deleteRow', index);
		}else{
            $.messager.alert('提示', "出货清单最少有一件产品");
		}
    }
	
	// 遍历数据
	function getContactInfo(data){
        debugger;
        var oldData = $("#deliverDetailList").edatagrid("getRows");

        var contName = $("#changeContact").combobox('getText');
        var contId = $("#changeContact").combobox('getValue');
		for(var i=0;i<data.length;i++){
            data[i]["contName"] = contName;
            data[i]["contId"] = contId;
		}

		if(oldData != null && oldData.length > 0){
            for(var j=0;j<oldData.length;j++){
                data.push(oldData[j])
            }
		}
		return data;
	}
	function moveDelivery() {
        debugger;
        var data = $("#contDetailList").datagrid("getSelections");

        $("#deliverDetailList").edatagrid("loadData",getContactInfo(data));
    }
	
    function getFormData($form) {
        var unindexed_array = $form.serializeArray();
        var indexed_array = {};

        $.map(unindexed_array, function (n, i) {
            indexed_array[n['name']] = n['value'];
        });

        return indexed_array;
    }
	//提交表单
	function submitDeliveryAddForm(){
		//有效性验证
		if(!$('#deliveryListForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}

        var eaRows = $("#deliverDetailList").datagrid('getRows');
        $.each(eaRows,function(index,item){
            $("#deliverDetailList").datagrid('endEdit',index);
        });

        //同步文本框中的订单要求
        // productAddEditor.sync();

		//ajax的post方式提交表单
		//$("#userAddForm").serialize()将表单序列号为key-value形式的字符串
        var data = {};
        data =  getFormData($("#deliveryListForm"));
        var prod = $("#deliverDetailList").datagrid("getData");
        if(prod!=null && prod != undefined){
            data["details"] = prod.rows;
        }
        $.ajax({
            type: "POST",
            url: 'deliveryList/insert',
            data: JSON.stringify(data),
            dataType:'json',
            contentType:"application/json",
            cache: false,
            success: function(data){
                if (data.status == 200) {
                    $.messager.alert('提示', data.msg);
                    $("#deliveryListForm").window('close');
                    $("#deliveryList").datagrid("reload");
                } else {
                    $.messager.alert('提示', data.msg);
                }
            }
        });
	}
</script>
