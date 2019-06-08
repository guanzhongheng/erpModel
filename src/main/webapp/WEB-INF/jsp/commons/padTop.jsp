<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header class="main-header">
    <!-- Logo -->
    <a href="/pad/padIndex" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>H</b>H</span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>农业</b>塑膜</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" title="个人信息">您好, ${activeUser.username}&nbsp;<span id="notifyNum" class="label label-info hide"></span></a>

                </li>
                <li><a href="/logout" title="退出登录">退出</a></li>
                <!-- Control Sidebar Toggle Button -->
            </ul>
        </div>
    </nav>
</header>