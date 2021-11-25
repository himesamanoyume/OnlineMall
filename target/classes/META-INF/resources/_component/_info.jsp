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
        <c:if test="${urlWhere !='index' and urlWhere !='postDetail'}">
        <div class="info-link">
            <input type="text" class="searchBar" id="keyword" value="${keyword}"/>
            <div class="searchButton">搜索</div>
        </div>
        </c:if>
        <div class="info-link"></div>
    </div>

</aside>