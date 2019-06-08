<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>农业塑膜</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="/plugins/common/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/plugins/common/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="/plugins/common/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="/plugins/common/Ionicons/css/ionicons.min.css">
    <!-- daterange picker -->
    <link rel="stylesheet" href="/plugins/common/bootstrap-daterangepicker/daterangepicker.css">
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="/plugins/common/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="/plugins/common/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">

    <link rel="stylesheet" href="/plugins/common/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="/dist/css/skins/_all-skins.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-black-light sidebar-mini">
<div class="wrapper wrapper-content">
    <%@ include file="../commons/padTop.jsp" %>
    <section class="content">
        <div class="row">
            <div class="col-sm-12">
                <div class="box box-primary" >
                    <div class="box-header">
                        <i class="fa fa-edit"></i>

                        <h3 class="box-title">原材料用量上报</h3>
                    </div>
                    <div class="box-body pad table-responsive">

                        <div class="ibox float-e-margins">
                            <div class="ibox-content">
                                <p> 产品/半成品名称：就是这个加过</p>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-xs-12">
                                <div class="box">
                                    <div class="box-header">
                                        <h5 class="box-title">原料消耗</h5>
                                    </div>

                                    <div class="box-table">
                                        <table id="editorProdTable" data-mobile-responsive="true">
                                        </table>
                                    </div>

                                    <!-- /.box-header -->
                                    <%--<div class="box-body">--%>
                                        <%--<div class="table-responsive">--%>
                                            <%--<div id="tableToolbar">--%>
                                                <%--<button id="button" class="btn btn-default">insertRow</button>--%>
                                                <%--<button id="getTableData" class="btn btn-default">getTableData</button>--%>
                                            <%--</div>--%>
                                            <%--<table id="mateMytable" class="table table-bordered table-hover"></table>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                    <!-- /.box-body -->
                                </div>
                            </div>
                            <!-- /.col -->
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <%--<script src="/plugins/common/datatables.net/js/jquery.dataTables.js"></script>--%>
    <%--<script src="/plugins/common/datatables.net-bs/js/dataTables.bootstrap.js"></script>--%>
    <!-- jQuery 3 -->
    <script src="/plugins/common/jquery/dist/jquery.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="/plugins/common/bootstrap/dist/js/bootstrap.js"></script>
    <!-- InputMask -->
    <!-- date-range-picker -->
    <script src="/plugins/common/moment/min/moment.min.js"></script>
    <script src="/plugins/common/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap datepicker -->
    <script src="/plugins/common/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <!-- bootstrap color picker -->
    <script src="/plugins/common/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
    <!-- bootstrap time picker -->
    <!-- SlimScroll -->
    <script src="/plugins/common/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <!-- iCheck 1.0.1 -->
    <!-- FastClick -->
    <script src="/plugins/common/fastclick/lib/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="/dist/js/adminlte.min.js"></script>

    <!-- AdminLTE for demo purposes -->
    <script src="/dist/js/demo.js"></script>
    <script src="/plugins/bootstrapTable/dist/bootstrap-table.js?v=1.1"></script>
    <script src="/plugins/bootstrapTable/dist/bootstrap-table-locale-all.js"></script>
    <script src="/plugins/bootstrapTable/dist/locale/bootstrap-table-zh-CN.js"></script>
    <!-- Select2 -->
    <script src="/plugins/common/select2/dist/js/select2.full.js"></script>

    <script src="/js/hh/padProdMate.js?v=1.11"></script>

</div>
</body>
</html>