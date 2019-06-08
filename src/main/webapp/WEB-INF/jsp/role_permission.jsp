<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">

<link href="css/uploadfile.css" rel="stylesheet">
<script src="js/jquery.uploadfile.js"></script>

<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
    <form id="permissionForm" class="itemForm" method="post">
        <input type="hidden" name="roleId"/>
        <span style="font-weight: bold;">合同管理：</span>
        <label><input name="permissionOption" type="checkbox" value="7"/>合同查看 </label>
        <label><input name="permissionOption" type="checkbox" value="11"/>合同新增 </label>
        <label><input name="permissionOption" type="checkbox" value="12"/>合同修改 </label>
        <label><input name="permissionOption" type="checkbox" value="13"/>合同删除 </label>
        <br><br>
        <span style="font-weight: bold;">产品库存管理：</span>
        <label><input name="permissionOption" type="checkbox" value="9"/>产品库存查看 </label>
        <label><input name="permissionOption" type="checkbox" value="21"/>产品库存新增 </label>
        <label><input name="permissionOption" type="checkbox" value="22"/>产品库存修改 </label>
        <label><input name="permissionOption" type="checkbox" value="23"/>产品库存删除 </label>
        <br><br>
        <span style="font-weight: bold;">原材料库存管理：</span>
        <label><input name="permissionOption" type="checkbox" value="8"/>原材料库存查看 </label>
        <label><input name="permissionOption" type="checkbox" value="51"/>原材料库存新增 </label>
        <label><input name="permissionOption" type="checkbox" value="52"/>原材料库存修改 </label>
        <label><input name="permissionOption" type="checkbox" value="53"/>原材料库存删除 </label>
        <br><br>
        <span style="font-weight: bold;">出库单管理：</span>
        <label><input name="permissionOption" type="checkbox" value="10"/>出库单查看 </label>
        <label><input name="permissionOption" type="checkbox" value="14"/>出库单新增 </label>
        <br><br>
        <span style="font-weight: bold;">产品字典管理：</span>
        <label><input name="permissionOption" type="checkbox" value="30"/>产品查看 </label>
        <label><input name="permissionOption" type="checkbox" value="31"/>产品新增 </label>
        <label><input name="permissionOption" type="checkbox" value="32"/>产品修改 </label>
        <label><input name="permissionOption" type="checkbox" value="33"/>产品删除 </label>
        <br><br>
        <span style="font-weight: bold;">半成品管理：</span>
        <label><input name="permissionOption" type="checkbox" value="34"/>半成品查看 </label>
        <label><input name="permissionOption" type="checkbox" value="35"/>半成品新增 </label>
        <label><input name="permissionOption" type="checkbox" value="36"/>半成品修改 </label>
        <label><input name="permissionOption" type="checkbox" value="37"/>半成品删除 </label>
        <br><br>
        <span style="font-weight: bold;">原材料管理：</span>
        <label><input name="permissionOption" type="checkbox" value="44"/>原材料查看 </label>
        <label><input name="permissionOption" type="checkbox" value="45"/>原材料新增 </label>
        <label><input name="permissionOption" type="checkbox" value="46"/>原材料修改 </label>
        <label><input name="permissionOption" type="checkbox" value="47"/>原材料删除 </label>
        <br><br>
        <span style="font-weight: bold;">任务调度：</span>
        <label><input name="permissionOption" type="checkbox" value="60"/>任务查看 </label>
        <br><br>
        <span style="font-weight: bold;">用户管理：</span>
        <label><input name="permissionOption" type="checkbox" value="200"/>用户查看 </label>
        <label><input name="permissionOption" type="checkbox" value="201"/>用户新增 </label>
        <label><input name="permissionOption" type="checkbox" value="202"/>用户修改 </label>
        <label><input name="permissionOption" type="checkbox" value="203"/>用户删除 </label>
        <br><br>
        <span style="font-weight: bold;">角色管理：</span>
        <label><input name="permissionOption" type="checkbox" value="210"/>角色查看 </label>
        <label><input name="permissionOption" type="checkbox" value="211"/>角色新增 </label>
        <label><input name="permissionOption" type="checkbox" value="212"/>角色修改 </label>
        <label><input name="permissionOption" type="checkbox" value="213"/>角色删除 </label>
        <br><br><br>
    </form>
    <div style="padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="updatePermission()">保存</a>
    </div>
</div>
<script type="text/javascript">
    function rolePermissionInit() {
        var roleId = $('#permissionForm [name=roleId]').val();
        $.get("permission/get_permission", {roleId: roleId}, function (data) {
            //获得所要回显的值，此处为","分割的字符串
            var checkeds = data.sysPermissionId;
            if (checkeds != '' && checkeds != null) {
                //拆分为字符串数组
                checkArray = checkeds.split(",");
                //获得所有的复选框对象
                var checkBoxAll = $("input[name='permissionOption']");
                //获得所有复选框的value值，然后，用checkArray中的值和他们比较，如果有，则说明该复选框被选中
                for (var i = 0; i < checkArray.length - 1; i++) {
                    //获取所有复选框对象的value属性，然后，用checkArray[i]和他们匹配，如果有，则说明他应被选中
                    $.each(checkBoxAll, function (j, checkbox) {
                        //获取复选框的value属性
                        var checkValue = $(checkbox).val();

                        if (checkArray[i] == checkValue) {
                            $(checkbox).prop("checked", true);
                        }
                    });
                }
            }
        });
    }

    function updatePermission() {
        var permission = '';
        if ($("input[name='permissionOption']:checkbox:checked").length > 0) {
            $("input[name='permissionOption']:checkbox:checked").each(function () {
                permission += $(this).val() + ',';
            });
        }
        var roleId = $("#permissionForm [name=roleId]").val();
        $.post('permission/update_by_roleid', {roleId: roleId, permission: permission}, function (data) {
            if (data.status == 200) {
                $("#permissionWindow").window("close");
                $("#roleList").datagrid("reload");
                $.messager.alert("操作提示", "更新权限成功！");
            } else {
                $.messager.alert("操作提示", "更新权限失败！", "error");
            }
        });
    }
</script>
