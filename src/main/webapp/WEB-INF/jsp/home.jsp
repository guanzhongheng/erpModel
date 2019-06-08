<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@page import="org.apache.shiro.session.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/jsp/commons/common_js.jsp"%>
<%@ include file="/WEB-INF/jsp/commons/common_css.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>农业ERP管理系统</title>
<style type="text/css">
.content {
	padding: 10px 10px 10px 10px;
}
.divNorth{
	background:url('image/TitleBackground.png') no-repeat center center;
	background-size:100% 100%;
}
</style>
</head>
<body class="easyui-layout">

	<!-- North Title -->
	<div class="divNorth" style="height:100px;" data-options="region:'north'" >
		<table id="_TableHeader" width="100%" border="0" cellpadding="0"
		cellspacing="0" class="bluebg">
		<tbody>
			<tr>
				<td valign="top">
					<div style="position:relative;">
						<div style="text-align:right;font-size:15px;margin:2px 0 0 0;">
							<span style="display:inline-block;font-size:20px;color:#c1dff7;margin:0 0 8px 0;">
								农业塑膜ERP管理系统
							</span><br/>
							<span style="color:#c1dff7;">${activeUser.roleName}:</span>
							<span style="color:#c1dff7;">
								${activeUser.username}
							</span>
						    &nbsp;<a href="logout" style="text-decoration:none;color:#A9C3D6;"> 退出</a>&nbsp;  &nbsp; 
						</div>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
	</div>
	<!-- 左侧菜单 -->
	<%@ include file="leftMenu.jsp"%>
	<!-- <div data-options="region:'west',title:'功能菜单',split:true"
		style="width:213px;"> -->

	<div id="HomeFuncAccordion" class="easyui-accordion" style="width:213px;"
		data-options="region:'west',title:'功能菜单',split:false">
		<div title="功能搜索"
			data-options="iconCls:'icon-search',collapsed:false,collapsible:false"
			style="padding:10px;">
			<input id="HomeFuncSearch" class="easyui-searchbox" 
				data-options={prompt:'请输入想要搜索的功能'}
				searcher="doSearch" 
				style="width:178px;height:25px;">
		</div>
		<div title="销售管理" data-options="selected:true" style="padding:10px;">
			<ul id="saleMonitor" class="easyui-tree" data-options="animate:true,lines:true">
				<li><span>销售管理</span>
					<ul>
						<li id=11 data-options="attributes:{'url':'contract/find'}">合同管理</li>
					</ul>
				</li>
			</ul>
		</div>

		<div title="库存管理" data-options="selected:true" style="padding:10px;">
			<ul id="stockMonitor" class="easyui-tree" data-options="animate:true,lines:true">
				<li><span>库存管理</span>
					<ul>
						<li id=21 data-options="attributes:{'url':'inventory/rawmater/find'}">原材料库存管理</li>
					</ul>
					<ul>
						<li id=22 data-options="attributes:{'url':'inventory/find'}">产品库存管理</li>
					</ul>
					<ul>
						<li id=23 data-options="attributes:{'url':'deliveryList/find'}">出库管理</li>
					</ul>

				</li>
			</ul>
		</div>

		<div title="产品及原料管理" data-options="selected:true" style="padding:10px;">
			<ul id="prodMonitor" class="easyui-tree" data-options="animate:true,lines:true">
				<li><span>产品及原料管理</span>
					<ul>
						<li id=31 data-options="attributes:{'url':'product/find'}">产品数据字典</li>
					</ul>
					<ul>
						<li id=32 data-options="attributes:{'url':'semiproduct/find'}">半成品数据字典</li>
					</ul>
					<ul>
						<li id=33 data-options="attributes:{'url':'rawmaterial/find'}">原材料数据字典</li>
					</ul>
				</li>
			</ul>
		</div>

		<div title="任务调度" data-options="selected:true" style="padding:10px;">
			<ul id="workMonitor" class="easyui-tree" data-options="animate:true,lines:true">
				<li><span>任务调度</span>
					<ul>
						<li id=41 data-options="attributes:{'url':'taskasgn/find'}">任务分配</li>
					</ul>
				</li>
			</ul>
		</div>

		<c:if test="${activeUser.roleName == '超级管理员' }">
			<div title="系统管理" style="padding:10px;">

				<ul id="sysManager" class="easyui-tree"
					data-options="animate:true,lines:true">
					<li><span>系统管理</span>
						<ul>
							<li data-options="attributes:{'url':'user/find'}">用户管理</li>
						</ul>
						<ul>
							<li data-options="attributes:{'url':'role/find'}">角色管理</li>
						</ul>
					</li>
				</ul>
			</div>
		</c:if>


		<%--<div title="计划进度" data-options="selected:true" style="padding:10px;">
			<ul id="scheduleMonitor" class="easyui-tree" data-options="animate:true,lines:true">
				<li><span>计划进度</span>
					<ul>
						<li id=11 data-options="attributes:{'url':'order/find'}">订单管理</li>
					</ul>
					<ul>
						<li id=12 data-options="attributes:{'url':'custom/find'}">客户管理</li>
					</ul>
					<ul>
						<li id=13 data-options="attributes:{'url':'product/find'}">产品管理</li>
					</ul>
					<ul>
						<li id=14 data-options="attributes:{'url':'work/find'}">作业管理</li>
					</ul>
					<ul>
						<li id=15 data-options="attributes:{'url':'manufacture/find'}">生产计划管理</li>
					</ul>
					<ul>
						<li id=16 data-options="attributes:{'url':'task/find'}">生产派工管理</li>
					</ul>
				</li>
			</ul>
		</div>

		<div title="设备管理" data-options="selected:true" style="padding:10px">
			<ul id="deviceMonitor" class="easyui-tree" data-options="animate:true,lines:true">
				<li><span>设备管理</span>
					<ul>
						<li id=21 data-options="attributes:{'url':'device/deviceList'}">设备台账</li>
						<li id=22 data-options="attributes:{'url':'device/deviceType'}">设备种类</li>
						<li id=23 data-options="attributes:{'url':'device/deviceCheck'}">设备例检</li>
						<li id=24 data-options="attributes:{'url':'device/deviceFault'}">设备故障</li>
						<li id=25 data-options="attributes:{'url':'device/deviceMaintain'}">设备维修</li>
					</ul></li>
			</ul>
		</div>

		<div title="工艺监控" data-options="selected:true" style="padding:10px">
			<ul id="technologyMonitor" class="easyui-tree" data-options="animate:true,lines:true">
				<li><span>工艺监控</span>
					<ul>
						<li id=31 data-options="attributes:{'url':'technology/find'}">工艺管理</li>
						<li id=32 data-options="attributes:{'url':'technologyRequirement/find'}">工艺要求</li>
						<li id=33 data-options="attributes:{'url':'technologyPlan/find'}">工艺计划</li>
						<li id=34 data-options="attributes:{'url':'process/find'}">工序管理</li>
					</ul>
				</li>
			</ul>
		</div>

		<div title="物料监控" data-options="selected:true" style="padding:10px">

			<ul id="materialMonitor" class="easyui-tree" data-options="animate:true,lines:true">
				<li><span>物料监控 </span>
					<ul>
						<li id=41 data-options="attributes:{'url':'material/find'}">物料信息</li>
						<li id=42 data-options="attributes:{'url':'materialReceive/find'}">物料收入</li>
				    	<li id=43 data-options="attributes:{'url':'materialConsume/find'}">物料消耗</li>
					</ul>
				</li>
			</ul>
		</div>

		<div title="质量监控" data-options="selected:true" style="padding:10px;">
			<ul id="qualifyMonitor" class="easyui-tree"
				data-options="animate:true,lines:true">
				<li><span>质量监控</span>
					<ul>
						<li id=51 data-options="attributes:{'url':'unqualify/find'}">不合格品管理</li>
						<li id=52 data-options="attributes:{'url':'measure/find'}">成品计量质检</li>
						<li id=53 data-options="attributes:{'url':'f_count_check/find'}">成品计数质检</li>
						<li id=54 data-options="attributes:{'url':'p_measure_check/find'}">工序计量质检</li>
						<li id=55 data-options="attributes:{'url':'p_count_check/find'}">工序计数质检</li>
					</ul>
				</li>
			</ul>

		</div>

		<div title="人员监控" data-options="selected:true" style="padding:10px">
			<ul id="employeeMonitor" class="easyui-tree"
				data-options="animate:true,lines:true">
				<li><span>人员监控</span>
					<ul>
						<li id=61 data-options="attributes:{'url':'department/find'}">部门管理</li>
					</ul>
					<ul>
						<li id=62 data-options="attributes:{'url':'employee/find'}">员工管理</li>
					</ul>
				</li>
			</ul>
		</div>--%>


	</div>

	<!-- </div> -->
	<div id="MainPage" data-options="region:'center',title:''">
		<div id="tabs" class="easyui-tabs">
			<div title="首页" style="padding:20px;"></div>
		</div>
	</div>
	<script type="text/javascript" src="/js/hh/home.js"/>
	<script type="text/javascript">


		
	</script>
</body>
</html>