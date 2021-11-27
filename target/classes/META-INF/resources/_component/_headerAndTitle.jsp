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

<header class="header">
    <nav class="nav">
        <div id="nav-index" class="blogName">HimeBlog</div>
        <div class="nav-container">
            <div id="nav-post" class="nav-link">文章
                <div class="hover-bar"></div>
            </div>
            <div id="nav-project" class="nav-link">项目
                <div class="hover-bar"></div>
            </div>
            <div id="nav-note" class="nav-link">笔记
                <div class="hover-bar"></div>
            </div>
            <div id="nav-tools" class="nav-link">工具
                <div class="hover-bar"></div>
            </div>
            <div id="nav-tags" class="nav-link">标签
                <div class="hover-bar"></div>
            </div>
            <c:if test="${sessionScope.permi!=null and sessionScope.permi.type == 1 or sessionScope.permi.type == 2}">
                <div id="nav-resume" class="nav-link">简历
                    <div class="hover-bar"></div>
                </div>
            </c:if>
            <c:if test="${sessionScope.permi!=null and sessionScope.permi.type == 2}">
                <div id="nav-console" class="nav-link">后台
                    <div class="hover-bar"></div>
                </div>
            </c:if>
        </div>
    </nav>
</header>

<div id="topTitle-index" class="topTitle">
    HimeBlog
</div>