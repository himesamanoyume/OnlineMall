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

<aside class="info-container">
    <div class="info-container-inner">
        <div class="info">
            <img src="/_jsp/usericon.png" class="info-icon">
            <div class="info-name">姫様の夢</div>
            <div class="info-txt">Princess Dreamland</div>
        </div>
        <c:if test="${urlWhere !='index' and urlWhere !='postDetail' and urlWhere!='resume'}">
        <div class="info-link">
            <input type="text" class="searchBar" id="keyword"placeholder="模糊搜索标题" value="${keyword}"/>
            <div id="search" class="searchButton">搜索</div>
        </div>
        </c:if>
        <div class="info-link">
            <div id="info-theme" class="link-button">
                <svg xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 512 512" width="20px" height="40px">
                    <title>深色/浅色主题切换</title>
                    <circle cx="256" cy="256" r="208" fill="none" stroke="var(--text-color)" stroke-linejoin="round" stroke-width="32"/>
                    <path d="M256 464c-114.88 0-208-93.12-208-208S141.12 48 256 48z" fill="var(--text-color)" stroke="--text-color"/>
                </svg>
            </div>
        </div>
        <c:if test="${urlWhere !='postDetail'}">
            <div class="info-link">
                <input type="password" class="searchBar" name="password" placeholder="输入密码获取权限" value="${password}"/>
                <div id="permiSubmit" class="searchButton">提交</div>
            </div>
        </c:if>
        <c:if test="${sessionScope.permi!=null and sessionScope.permi.type == 1}">
            <div class="info-link">
                <div class="permi-info">
                    当前权限:低级
                </div>

            </div>
        </c:if>
        <c:if test="${sessionScope.permi!=null and sessionScope.permi.type == 2}">
            <div class="info-link">
                <div class="permi-info">
                    当前权限:站长
                </div>

            </div>
        </c:if>
    </div>

</aside>