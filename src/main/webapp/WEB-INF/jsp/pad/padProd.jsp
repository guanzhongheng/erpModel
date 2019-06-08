<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/commons/taglib.jsp" %>

<html>
<link rel="stylesheet" href="/plugins/bootstrap-table/dist/bootstrap-table.css">


<body class="hold-transition skin-black-light sidebar-mini">
<div class="wrapper wrapper-content">
    <%@ include file="../commons/padTop.jsp" %>
    <section class="content">
        <div class="row">
            <div class="col-sm-12">
                <input type="text" onkeyup="tt(this)" >
                <div class="box box-primary" >
                    <div class="box-header">
                        <i class="fa fa-edit"></i>

                        <h3 class="box-title">生产上报</h3>
                    </div>
                    <div class="box-body pad table-responsive">
                        <div role="form" class="form-horizontal m-t">
                            <div class="form-group ui-draggable">
                                <label class="col-sm-1 control-label" >合同选择</label>
                                <div class="col-sm-3">
                                    <select class="form-control" name="contact" id="contact">
                                    </select>
                                </div>
                            </div>
                        </div>

                        <section class="content">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="box">
                                        <div class="box-header">
                                            <h3 class="box-title">Hover Data Table</h3>
                                        </div>
                                        <!-- /.box-header -->
                                        <div class="box-body">
                                            <div class="table-responsive">

                                                <div id="tableToolbar">
                                                    <input type="text"   id="sysWebsiteTitle" name="sysWebsiteTitle">
                                                    <button type="button"  onclick="refreshData()" class="btn btn-success">查询</button>
                                                    <button id="button" class="btn btn-default">insertRow</button>
                                                    <button id="getTableData" class="btn btn-default">getTableData</button>
                                                </div>
                                                <table id="mytable" class="table table-bordered table-hover"></table>
                                            </div>



                                            <table id="example2" class="table table-bordered table-hover">

                                            </table>
                                        </div>
                                        <!-- /.box-body -->
                                    </div>
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                        </section>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <script src="/plugins/common/datatables.net/js/jquery.dataTables.js"></script>
    <script src="/plugins/common/datatables.net-bs/js/dataTables.bootstrap.js"></script>
    <script src="/plugins/bootstrap-table/dist/bootstrap-table.js"></script>
    <script src="/plugins/bootstrap-table/dist/locale/bootstrap-table-zh-CN.js"></script>
    <script>
        var datab ={'total':5,'rows':[{'ID':'1','num':10,'wnum':20,'ynum':20},{'ID':'1','num':10,'wnum':20,'ynum':20},{'ID':'1','num':10,'wnum':20,'ynum':20}]}


        function refreshData() {
            $('#mytable').bootstrapTable('refresh',{
                pageNumber: 1,
            });
        };
        function init_format(value, row, index) {
            var id = row.sysWebsiteId;
            var html = "";
            html += "<a class='ml-5' href=\"javascript:void(0)\" title='编辑'></a>";
            html += "<a class='ml-5'  href=\"javascript:void(0)\" title='删除'></a>";
            return html;
        };
        $('#mytable').bootstrapTable({
            url: '',
            toolbar:'#tableToolbar',
            method: 'get',
            pagination: true,  //表格底部显示分页条
            sidePagination: "server",
            escape:false, //启动转义字符
            pageSize: 5, //每页显示多少条数据
            pageNumber: 1, //初始化翻页的页码
            pageList: [5,10, 25, 50, 100],
            queryParamsType:'',//设置请求参数格式
            queryParams:function queryParams(params) {   //设自定义查询参数
                var param = {
                    pageSize: params.pageSize,   //每页多少条数据
                    pageIndex: params.pageNumber, // 页码
                    sysWebsiteTitle: $("#sysWebsiteTitle").val(),//菜单标题
                    //sysCategoryId: $("#sysCategoryId").val() //网址分类id
                };
                return param;
            },
            onClickCell: function(field, value, row, $element) {
                $element.attr('contenteditable', true);
                $element.blur(function() {
                    var index = $element.parent().data('index');
                    var tdValue = $element.html();

                    saveData(index, field, tdValue);
                })
            },
            columns: [
                {
                    field: 'ID',
                    title: '序号'
                }, {
                    field: 'Name',
                    title: '产品/半成品名称'
                }, {
                    field: 'num',
                    title: '合同数量'
                },{
                    field: 'wnum',
                    title: '未完成数量'
                },{
                    field: 'ynum',
                    title: '当日完成量'
                },
                {
                    field: 'operate',
                    title: '操作',
                    formatter: operateFormatter //自定义方法，添加操作按钮
                }
            ],
            rowStyle: function (row, index) {
                var classesArr = ['success', 'info'];
                var strclass = "";
                if (index % 2 === 0) {//偶数行
                    strclass = classesArr[0];
                } else {//奇数行
                    strclass = classesArr[1];
                }
                return { classes: strclass };
            },//隔行变色
        });
        $('#mytable').bootstrapTable("load",datab);
        $('#mytable').DataTable({
            'paging'      : true,
            'editable'    :true,
            'lengthChange': false,
            'searching'   : false,
            'ordering'    : true,
            'info'        : true,
            'autoWidth'   : false,
            columns: [
                {
                    field: 'ID',
                    title: '序号'
                }, {
                    field: 'Name',
                    title: '产品/半成品名称'
                }, {
                    field: 'num',
                    title: '合同数量'
                },{
                    field: 'wnum',
                    title: '未完成数量'
                },{
                    field: 'ynum',
                    title: '当日完成量',
                    formatter:numForm
                },
                {
                    field: 'operate',
                    title: '操作',
                    formatter: operateFormatter //自定义方法，添加操作按钮
                }
            ],
        });

        $('#mytable').bootstrapTable("load",datab);
        function numForm(value,row,index) {
            return ['<input type="text" id="1plan'+row.id+'" data='+value+' value='+value+' onblur="addTarget('+row.id+',1)">'].join("")
        }

        function saveData(index, field, value) {
            $("#mytable").bootstrapTable('updateCell', {
                index: index,       //行索引
                field: field,       //列名
                value: value        //cell值
            })
        }
        function operateFormatter(value, row, index) {//赋予的参数
            return [
                '<a class="btn active disabled" href="#">原材料用量</a>',
            ].join('');
        }

        $(function () {
            $("#button").click(function() {
                $("#mytable").bootstrapTable('insertRow', {
                    index: 0,
                    row: {
                        id: '',
                        num: '',
                        wnum: '',
                        ynum: '',
                    }
                });
            });

            $("#getTableData").click(function() {
                alert(JSON.stringify($("#mytable").bootstrapTable('getData')));
            });
        })

    </script>
</div>
</body>
</html>