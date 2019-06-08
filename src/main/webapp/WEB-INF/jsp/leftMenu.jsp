<%--
  Created by IntelliJ IDEA.
  User: guan
  Date: 2019/5/23
  Time: 12:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String pathf = request.getContextPath();
    String basePathf = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + pathf + "/";
%>

<div id="HomeFuncAccordion" class="easyui-accordion" style="width:213px;"
     data-options="region:'west',title:'功能菜单',split:true">
    <div title="功能搜索"
         data-options="iconCls:'icon-search',collapsed:false,collapsible:false"
         style="padding:10px;">
        <input id="HomeFuncSearch" class="easyui-searchbox"
               data-options={prompt:'请输入想要搜索的功能'}
               searcher="doSearch"
               style="width:178px;height:25px;">
    </div>
    <c:forEach items="${menuList}" var="menu1">
        <c:if test="${menu1.hasMenu && '1' == menu1.AVAILABLE}" >
            <div title="${menu1.MENU_NAME}" data-options="selected:true" style="padding:10px;">
                <ul id="${menu1.MENU_ATTR}" class="easyui-tree" data-options="animate:true,lines:true">
                    <li><span>${menu1.MENU_NAME}</span>
                        <ul>
                            <!-- 判断是否有二级级菜单 -->
                            <c:if test="${'[]' != menu1.subMenu}">
                                <!--二级菜单循环开始 -->
                                <c:forEach items="${menu1.subMenu}" var="menu2" >
                                    <li id="${menu2.MENU_ID}" data-options="attributes:{'url':'${menu2.MENU_URL}'}">${menu2.MENU_NAME}</li>
                                </c:forEach>
                            </c:if>
                        </ul>
                    </li>
                </ul>
            </div>
        </c:if>
    </c:forEach>
</div>
