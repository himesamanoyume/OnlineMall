<%--
  Created by IntelliJ IDEA.
  User: 28583
  Date: 2021/11/6
  Time: 1:44:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="header">
    <nav class="nav">
        <div id="nav-index" class="blogName" title="首页">
            HIMEBLOG
        </div>
        <div class="nav-container">
            <div class="nav-content">
                <div id="nav-post" class="nav-link">文章</div>
                <div class="hover-bar"></div>
            </div>
            <div class="nav-content">
                <div id="nav-project" class="nav-link">项目</div>
                <div class="hover-bar"></div>
            </div>
            <div class="nav-content">
                <div id="nav-note" class="nav-link">笔记</div>
                <div class="hover-bar"></div>
            </div>
            <div class="nav-content">
                <div id="nav-tools" class="nav-link">工具</div>
                <div class="hover-bar"></div>
            </div>
            <div class="nav-content">
                <div id="nav-dynamic" class="nav-link">动态</div>
                <div class="hover-bar"></div>
            </div>
            <c:if test="${sessionScope.permi!=null and sessionScope.permi.type == 1 or sessionScope.permi.type == 2}">
                <div class="nav-content">
                    <div id="nav-resume" class="nav-link">简历</div>
                    <div class="hover-bar"></div>
                </div>
            </c:if>
            <c:if test="${sessionScope.permi!=null and sessionScope.permi.type == 2}">
                <div class="nav-content">
                    <div id="nav-console" class="nav-link">后台</div>
                    <div class="hover-bar"></div>
                </div>
            </c:if>
        </div>
    </nav>
</div>

<div id="topTitle-index" class="topTitle" title="首页">
    HIMEBLOG
</div>