<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/commons/taglib.jsp" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html charset=utf-8">
    <!-- Bootstrap 3.3.7 -->
</head>
<body class="hold-transition skin-black-light sidebar-mini">
<div class="wrapper">
    <%@ include file="../commons/padTop.jsp" %>
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box-body">
                    <div class="row">
                        <div class="col-lg-3 col-xs-6">
                            <div class="small-box bg-aqua" id="prodUpInfo" onclick="gotoProd()">
                                <div class="inner" style="min-height: 100px">
                                    <h1 style="text-align: center">生产上报</h1>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-xs-6">
                            <div class="small-box bg-aqua">
                                <div class="inner" style="min-height: 100px">
                                    <h1 style="text-align: center">材料领用</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-lg-3 col-xs-6" style="text-align: right">
                        <button class="btn btn-default btn-lg">布匹确认</button>
                    </div>
                    <div class="col-lg-3 col-xs-6">
                        <button class="btn btn-default btn-lg">质检退回</button>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <script>
        function gotoProd() {
            debugger;
            window.location.href = "/pad/padProd";
        }

    </script>

</div>
</body>
</html>
