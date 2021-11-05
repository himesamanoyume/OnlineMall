<%--
  Created by IntelliJ IDEA.
  User: 28583
  Date: 2021/10/23
  Time: 20:41:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mall</title>
    <style>
        @import "/css/MyIndexCSS.css";
        @import "/css/divSpace.css";
        @import "/css/divTips.css";
    </style>
    <script src="/js/MyIndexJS.js" type="text/javascript"></script>
    <script src="/js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script src="/js/createBookJS.js" type="text/javascript"></script>
</head>
<body>

<%@include file="./component/title.jsp" %>

<div id="title">

        网上商城

</div>

<div id="divSpace" role="tablist">
    <a class="divSpaceButton">手机
        <div class="divSpaceButtonBar"></div>
    </a>
    <a class="divSpaceButton">电脑
        <div class="divSpaceButtonBar"></div>
    </a>
    <a class="divSpaceButton">大电视
        <div class="divSpaceButtonBar"></div>
    </a>
    <a class="divSpaceButton">日常用品
        <div class="divSpaceButtonBar"></div>
    </a>
    <a class="divSpaceButton">食品超市
        <div class="divSpaceButtonBar"></div>
    </a>
</div>

<div id="indexBackground">
    <c:forEach items="${bookList}" var="item">
        <div class="divTips">
            <div class="divTipsImg"></div>
            <div class="divTipsTitle">
                <span class="spanTitle">${item.name}</span>
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

</div>


<%@include file="./component/page.jsp" %>


<div id="divFooter">
    &nbsp;&nbsp;&nbsp;Copyright 2021©  &nbsp; @姫様の夢 &nbsp;&nbsp;&nbsp;
</div>
</body>

</html>

