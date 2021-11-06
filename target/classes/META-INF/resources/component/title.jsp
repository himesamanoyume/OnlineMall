<%--
  Created by IntelliJ IDEA.
  User: 28583
  Date: 2021/11/4
  Time: 16:30:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="top">

    <c:if test="${sessionScope.user!=null and sessionScope.user.type == 1}">
        <button type="button" id="userType">商家端</button>
    </c:if>
    <c:if test="${sessionScope.user!=null and sessionScope.user.type == 2}">
        <button type="button" id="userType">管理员端</button>
    </c:if>

    <select class="topItem" id="searchType">
        <option value="1">书名</option>
        <option value="2">作者</option>
        <option value="3">简介</option>
    </select>

    <input type="text" class="topItem" id="keyword" value="${keyword}"/>

    <button class="topItem" id="searchButton">搜索</button>

    <c:if test="${sessionScope.user==null}">
        <button type="button" class="topLogin" onclick="window.location.href = '/view/login'">登录</button>
    </c:if>

    <c:if test="${sessionScope.user!=null}">
        <button type="button" id="topLoginAfter">${sessionScope.user.account}</button>
        <div id="topLoginInfo">
            <a id="topLoginInfoLogout">退出登录</a>
        </div>
    </c:if>

    <c:if test="${sessionScope.user!=null and sessionScope.user.type == 0}">
        <button type="button" class="topItem">我的订单</button>
    </c:if>

    <c:if test="${sessionScope.user!=null and sessionScope.user.type == 1}">
        <button type="button" class="topItem" onclick="window.location.href ='/view/sellerBookList'">我的图书</button>
        <button type="button" class="topItem">我的订单</button>
<<<<<<< Updated upstream
=======
        <button type="button" class="topItem" onclick="window.location.href ='/view/createBook'">新增商品</button>

>>>>>>> Stashed changes
    </c:if>

    <c:if test="${sessionScope.user!=null and sessionScope.user.type == 2}">
        <button type="button" class="topItem">用户列表</button>
        <button type="button" class="topItem">图书列表</button>
    </c:if>

    <c:if test="${sessionScope.user!=null}">
        <button type="button" class="topLogin" onclick="window.location.href = '/view/index'">首页</button>
    </c:if>
</div>
