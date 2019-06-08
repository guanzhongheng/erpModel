<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Vendor styles -->
    <link rel="stylesheet" href="static/vendors/bower_components/material-design-iconic-font/dist/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="static/vendors/bower_components/animate.css/animate.min.css">
    <link rel="stylesheet" href="static/vendors/bower_components/jquery.scrollbar/jquery.scrollbar.css">
	<!-- 日期框插件 -->
    <link rel="stylesheet" href="static/vendors/bower_components/flatpickr/dist/flatpickr.min.css">
    <!-- 下拉选择框插件 -->
    <link rel="stylesheet" href="static/vendors/bower_components/select2/dist/css/select2.min.css">
    <!-- App styles -->
    <link rel="stylesheet" href="static/css/app.min.css">
</head>

<body data-sa-theme="${sessionScope.SKIN}">

 	<!-- 页面加载过程中的那个加载状态 -->
	<div class="page-loader">
	    <div class="page-loader__spinner">
	        <svg viewBox="25 25 50 50">
	            <circle cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"></circle>
	        </svg>
	    </div>
	</div>

	<div class="card-body">
					
		<form action="deliverylist/${msg }" name="Form" id="Form" method="post">
			<input type="hidden" name="DELIVERYLIST_ID" id="DELIVERYLIST_ID" value="${pd.DELIVERYLIST_ID}"/>
			<div id="showform">
				<div class="input-group" style="margin-top:3px;">
	                <span class="input-group-addon" style="width: 79px;"><span style="width: 100%;">出库单ID</span></span>
	                <div class="form-group">
	                    <input type="number" class="form-control" name="ID" id="ID" value="${pd.ID}" maxlength="32" placeholder="这里输入出库单ID" title="出库单ID">
	                    <i class="form-group__bar"></i>
	                </div>
	            </div>
				<div class="input-group" style="margin-top:3px;">
	                <span class="input-group-addon" style="width: 79px;"><span style="width: 100%;">产品ID</span></span>
	                <div class="form-group">
	                    <input type="number" class="form-control" name="PROD_ID" id="PROD_ID" value="${pd.PROD_ID}" maxlength="32" placeholder="这里输入产品ID" title="产品ID">
	                    <i class="form-group__bar"></i>
	                </div>
	            </div>
				<div class="input-group" style="margin-top:3px;">
	                <span class="input-group-addon" style="width: 79px;"><span style="width: 100%;">半产品/原材料/产品</span></span>
	                <div class="form-group">
	                    <input type="text" class="form-control" name="PROD_TYPE" id="PROD_TYPE" value="${pd.PROD_TYPE}" maxlength="1" placeholder="这里输入半产品/原材料/产品" title="半产品/原材料/产品">
	                    <i class="form-group__bar"></i>
	                </div>
	            </div>
				<div class="input-group" style="margin-top:3px;">
	                <span class="input-group-addon" style="width: 79px;"><span style="width: 100%;">合同ID</span></span>
	                <div class="form-group">
	                    <input type="number" class="form-control" name="CONT_ID" id="CONT_ID" value="${pd.CONT_ID}" maxlength="32" placeholder="这里输入合同ID" title="合同ID">
	                    <i class="form-group__bar"></i>
	                </div>
	            </div>
				<div class="input-group" style="margin-top:3px;">
	                <span class="input-group-addon" style="width: 79px;"><span style="width: 100%;">出库数量</span></span>
	                <div class="form-group">
	                    <input type="number" class="form-control" name="QUANTITY" id="QUANTITY" value="${pd.QUANTITY}" maxlength="32" placeholder="这里输入出库数量" title="出库数量">
	                    <i class="form-group__bar"></i>
	                </div>
	            </div>
				<div class="input-group" style="margin-top:3px;">
	                <span class="input-group-addon" style="width: 79px;"><span style="width: 100%;">出库人</span></span>
	                <div class="form-group">
	                    <input type="text" class="form-control" name="CREATE_USER" id="CREATE_USER" value="${pd.CREATE_USER}" maxlength="64" placeholder="这里输入出库人" title="出库人">
	                    <i class="form-group__bar"></i>
	                </div>
	            </div>
				<div class="input-group" style="margin-top:3px;">
	                <span class="input-group-addon" style="width: 79px;"><span style="width: 100%;">出库时间</span></span>
	                <div class="form-group">
	                    <input type="text" class="form-control date-picker flatpickr-input active" name="CREATE_TIME" id="CREATE_TIME" value="${pd.CREATE_TIME}" maxlength="32" placeholder="这里输入出库时间" title="出库时间">
	                    <i class="form-group__bar"></i>
	                </div>
	            </div>
	            <div class="input-group" style="margin-top:10px;" >
	            	<span style="width: 100%;text-align: center;">
	            		<a class="btn btn-light btn--icon-text" id="to-save" onclick="save();">保存</a>
	            		<a class="btn btn-light btn--icon-text" onclick="top.Dialog.close();">取消</a>
	            	</span>
	            </div>
	            
	       </div>
	           
           <div id="jiazai" style="display:none;width: 100%;text-align: center;" class="page-loader" >
			   <div class="page-loader__spinner">
			        <svg viewBox="25 25 50 50">
			            <circle cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"></circle>
			        </svg>
			   </div>
			   <br/>
		   </div>
		   
		</form>
	    
	</div>
        
    <!-- Javascript -->
    <!-- static/vendors -->
    <script src="static/vendors/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="static/vendors/bower_components/popper.js/dist/umd/popper.min.js"></script>
    <script src="static/vendors/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="static/vendors/bower_components/jquery.scrollbar/jquery.scrollbar.min.js"></script>
    <script src="static/vendors/bower_components/jquery-scrollLock/jquery-scrollLock.min.js"></script>

    <!-- App functions and actions -->
    <script src="static/js/app.min.js"></script>
    
    <!-- 日期框插件 -->
    <script src="static/vendors/bower_components/flatpickr/dist/flatpickr.min.js"></script>
	<!-- 下拉选择框插件 -->
    <script src="static/vendors/bower_components/select2/dist/js/select2.full.min.js"></script>
    
    <!-- 表单验证提示 -->
  	<script src="static/js/jquery.tips.js"></script>
  	<script type="text/javascript">
		//保存
		function save(){
			if($("#ID").val()==""){
				$("#ID").tips({
					side:3,
		            msg:'请输入出库单ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ID").focus();
			return false;
			}
			if($("#PROD_ID").val()==""){
				$("#PROD_ID").tips({
					side:3,
		            msg:'请输入产品ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROD_ID").focus();
			return false;
			}
			if($("#PROD_TYPE").val()==""){
				$("#PROD_TYPE").tips({
					side:3,
		            msg:'请输入半产品/原材料/产品',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PROD_TYPE").focus();
			return false;
			}
			if($("#CONT_ID").val()==""){
				$("#CONT_ID").tips({
					side:3,
		            msg:'请输入合同ID',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CONT_ID").focus();
			return false;
			}
			if($("#QUANTITY").val()==""){
				$("#QUANTITY").tips({
					side:3,
		            msg:'请输入出库数量',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#QUANTITY").focus();
			return false;
			}
			if($("#CREATE_USER").val()==""){
				$("#CREATE_USER").tips({
					side:3,
		            msg:'请输入出库人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATE_USER").focus();
			return false;
			}
			if($("#CREATE_TIME").val()==""){
				$("#CREATE_TIME").tips({
					side:3,
		            msg:'请输入出库时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATE_TIME").focus();
			return false;
			}
			$("#Form").submit();
			$("#showform").hide();
			$("#jiazai").show();
		}
		
		$(function() {
			

		});
		</script>
</body>
</html>