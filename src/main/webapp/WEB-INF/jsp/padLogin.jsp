<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/jsp/commons/common_css.jsp"%>
<%@ include file="/WEB-INF/jsp/commons/common_js.jsp"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="copyright" content="" />
    <meta name="Author" content="" />
    <meta name="keywords" content="ERP管理系统--销售管理、仓储管理、产品管理、调度管理" />
    <meta name="description" content="农业ERP管理系统/系统登陆页面" />
    <title>农业ERP管理系统系统登录页面</title>

    <link rel="stylesheet" href="/plugins/common/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/plugins/common/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="/plugins/common/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/dist/css/AdminLTE.css">

    <link rel="stylesheet" href="/plugins/iCheck/square/blue.css">

    <style type="text/css">
        .download{margin:20px 33px 10px;*margin-bottom:30px;padding:5px;border-radius:3px;-webkit-border-radius:3px;
            -moz-border-radius:3px;background:#e6e6e6;border:1px dashed #df0031;font-size:14px;font-family:Comic Sans MS;
            font-weight:bolder;color:#555}
        .download a{padding-left:5px;font-size:14px;font-weight:normal;color:#555;text-decoration:none;letter-spacing:1px}
        .download a:hover{text-decoration:underline;color:#36F}
        .download span{float:right}
    </style>

</head>

<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="#"><b>农业塑膜</b>ERP-PAD</a>
    </div>
    <div class="login-box-body">
        <form name="login" action="#" method="post">

            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="用户名" name="name" id="username" >
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div id="username_span"style="display:none;padding-bottom:7px;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="userspan"></span>
            </div>

            <div class="form-group has-feedback">
                <input type="password" name="password" id="password" class="form-control" placeholder="密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>

            <div>
                <span id="errorspan" style="margin-left:88px;"></span>
            </div>

            <div class="row">
                <div class="col-xs-6">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox" name="remember" id="remember" checked="checked"> 记住密码
                        </label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4" style="text-align: right">
                    <button type="button" id="login" class="btn btn-primary btn-block btn-flat" onclick="loginUser()">登录</button>
                </div>
                <!-- /.col -->
            </div>
        </form>
    </div>
</div>

<!-- iCheck -->
<script src="/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' /* optional */
        });
    });

    function loginUser(){
        debugger;
        var uname = $("#username");
        var pwd = $("#password");
        if ($.trim(uname.val()) == "") {
            $('#username_span').css('display','block');
            $("#passwordspan").html("");
            $("#userspan")
                .html(
                    "<font color='red'>用户名不能为空！</font>");
            uname.focus();
        } else if ($.trim(pwd.val()) == "") {
            $('#username_span').css('display','none');
            $('#password_span').css('display','block');
            $("#userspan").html("");
            $("#passwordspan").html(
                "<font color='red'>密码不能为空！</font>");
            pwd.focus();
        } else {
            $('#password_span').css('display','none');
            $("#userspan").html("");
            $("#passwordspan").html("");
            $.ajax({
                url : 'ajaxLogin',// 跳转到 action
                data : {
                    username : uname.val(),
                    password : pwd.val(),
                },
                type : 'post',
                cache : false,
                dataType : 'json',
                success : function(data) {
                    debugger;
                    if (data.msg == 'account_error') {
                        console.log("account_erroe.");
                        $("#errorspan")
                            .html(
                                "<font color='red'> 用户不存在！</font>");
                        rcode_flag = 1;
                    } else if (data.msg == 'password_error') {
                        $("#errorspan")
                            .html(
                                "<font color='red'> 密码错误！</font>");
                        rcode_flag = 1;
                    } else if (data.msg == 'authentication_error') {
                        $("#errorspan")
                            .html(
                                "<font color='red'> 您没有授权！</font>");
                        rcode_flag = 1;
                    } else {
                        location.href = "${baseurl}home";
                    }
                },
                error : function() {
                    debugger;
                    // view("异常！");
                    alert("异常！");
                }
            });
        }

    }

    //刷新验证码
    //实现思路，重新给图片的src赋值，后边加时间，防止缓存
    function randomcode_refresh() {
        debugger;
        $("#randomcode_img").attr('src',
            '${baseurl}validatecode.jsp?time' + new Date().getTime());
    }

</script>
<!--[if IE 6]>
<script type="text/javascript" src="js/login/belatedpng.js" ></script>
<script type="text/javascript">
    DD_belatedPNG.fix("*");
</script>
<![endif]--></body>
</html>