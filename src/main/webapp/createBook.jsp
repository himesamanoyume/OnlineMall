<%--
  Created by IntelliJ IDEA.
  User: 28583
  Date: 2021/11/4
  Time: 19:52:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

    <script type="text/javascript" src="/js/jquery-3.5.1.min.js"></script>
    <script src="/js/generalJS.js" type="text/javascript"></script>

    <style>
        @import "/css/MyIndexCSS.css";
        @import "/css/divSpace.css";
        @import "/css/divTips.css";
    </style>
</head>
<body>
<div id="top">
    <%@include file="./component/title.jsp" %>
</div>

<div id="title">

    新增商品

</div>

<div class="input_item">
    <div class="input_label">名字</div>
    <input id = "name" type="text" />
</div>

<div class="input_item">
    <div class="input_label">价格</div>
    <input id = "price" type="number" />
</div>

<div class="input_item">
    <div class="input_label">作者</div>
    <input id = "author" type="text" />
</div>

<div class="input_item">
    <div class="input_label">总页数</div>
    <input id = "amount" type="text" />
</div>

<div class="input_item">
    <div class="input_label">简介</div>
    <textarea id = "txt" rows="" cols="" style="width: 250px; min-height: 100px;" ></textarea>
</div>

<div class="input_item">
    <div class="input_label">出版社</div>
    <input id = "publisher" type="text" />
</div>

<div class="input_item">
    <div class="input_label">出版日期</div>
    <input id = "publishTime" type="date" />
</div>

<div class="input_item">
    <div class="input_label">库存</div>
    <input id = "stock" type="number" />
</div>

<button id = "submit" style=" margin-top: 20px;margin-left: 130px;width: 70px;height: 26px;line-height: 26px">保存商品</button>
</div>


<div id="divFooter">
    &nbsp;&nbsp;&nbsp;Copyright 2021©  &nbsp; @姫様の夢 &nbsp;&nbsp;&nbsp;
</div>
</body>
</html>
