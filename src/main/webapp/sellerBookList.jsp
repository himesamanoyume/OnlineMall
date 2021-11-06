<%--
  Created by IntelliJ IDEA.
  User: 28583
  Date: 2021/11/4
  Time: 19:59:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        @import "/css/MyIndexCSS.css";
        @import "/css/divSpace.css";
        @import "/css/divTips.css";
    </style>

<<<<<<< Updated upstream
    <script type="text/javascript" src="js/jquery-3.5.1.min.js"/>
    <script type="text/javascript" src="js/createBookJS.js"/>
    <script type="text/javascript" src="js/MyIndexJS.js"/>
=======
    <script type="text/javascript" src="/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="/js/generalJS.js"></script>
    <script src="/js/bookListJS.js" type="text/javascript"></script>

>>>>>>> Stashed changes
</head>
<body>
<div id="top">

    <c:if test="${sessionScope.user!=null and sessionScope.user.type == 1}">
        <button type="button" id="userType">商家端</button>
    </c:if>
    <c:if test="${sessionScope.user!=null and sessionScope.user.type == 2}">
        <button type="button" id="userType">管理员端</button>
    </c:if>
    <select id="searchStatus" class="topItem">
        <option value="" ${status == '' || status == null ? 'selected' : ''}>全部</option>
        <option value="1" ${status == '1' ? 'selected' : ''}>未提交</option>
        <option value="2" ${status == '2' ? 'selected' : ''}>待审核</option>
        <option value="3" ${status == '3' ? 'selected' : ''}>上架</option>
        <option value="4" ${status == '4' ? 'selected' : ''}>下架</option>
    </select>
    <select id="searchType" class="topItem">
        <option value="1">书名</option>
        <option value="2">出版社</option>
        <option value="3">简介</option>
    </select>

<<<<<<< Updated upstream
    <input type="text" class="topItem"/>
=======
    <%@include file="./component/title.jsp" %>

</div>
>>>>>>> Stashed changes

    <button class="topItem" id="searchButton">搜索</button>

    <c:if test="${sessionScope.user==null}">
        <button type="button" id="topLogin" onclick="window.location.href = '/view/login'">登录</button>
    </c:if>

    <c:if test="${sessionScope.user!=null}">
        <button type="button" id="topLoginAfter">${sessionScope.user.account}
            <div id="topLoginInfo">
                <a id="topLoginInfoLogout">退出登录</a>

            </div>
        </button>
    </c:if>

    <c:if test="${sessionScope.user!=null and sessionScope.user.type == 0}">
        <button type="button" id="topLogin">我的图书</button>
        <button type="button" id="topLogin">我的订单</button>
    </c:if>

    <c:if test="${sessionScope.user!=null and sessionScope.user.type == 1}">
        <button type="button" id="topLogin">我的订单</button>
    </c:if>

    <c:if test="${sessionScope.user!=null and sessionScope.user.type == 2}">
        <button type="button" id="topLogin">用户列表</button>
        <button type="button" id="topLogin">图书列表</button>
    </c:if>

    <c:if test="${sessionScope.user!=null}">
        <button type="button" id="topLogin" onclick="window.location.href = '/view/index'">首页</button>
    </c:if>
</div>

<<<<<<< Updated upstream
<c:forEach items="${bookList}" var="item">
    <div class="divTips">
        <div class="divTipsImg"></div>
        <div class="divTipsTitle">
            <span class="spanTitle">${item.title}</span>
        </div>
        <div class="divPrice">
            <span class="spanPrice">${item.price}元</span>
        </div>
        <div class="divTipsAuthor">
            <span class="spanDes">作者：${item.author}</span>
        </div>
        <div class="divTipsCount">
            <span class="spanDes">数量：${item.stock}</span>
        </div>
        <div class="divTipsTxt">
            <span class="spanDes">描述：${item.txt}</span>
        </div>
    </div>
</c:forEach>

<%@include file="./component/page.jsp" %>
=======
<div id="divFooter">
    &nbsp;&nbsp;&nbsp;Copyright 2021©  &nbsp; @姫様の夢 &nbsp;&nbsp;&nbsp;
</div>
>>>>>>> Stashed changes
</body>
</html>
