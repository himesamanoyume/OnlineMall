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
    <script type="text/javascript" src="/js/createBookJS.js"></script>
</head>
<body>
<div id="top">
    <%@include file="./component/title.jsp" %>
</div>
<div style="font-size: 22px; font-weight: bolder;margin-bottom: 30px;">	新增商品	</div>

<div class="input_item">
    <div class="input_label">名字</div>
    <input id = "name" type="text" />
</div>

<div class="input_item">
    <div class="input_label">价格</div>
    <input id = "price" type="number" />
</div>

<div class="input_item">
    <div class="input_label">厂商</div>
    <input id = "publisher" type="text" />
</div>

<div style="display: flex;align-items: center;">
    <div class="input_label">库存</div>
    <input id = "stock" type="number" />
</div>

<div class="input_item">
    <div class="input_label">简介</div>
    <textarea id = "txt" rows="" cols="" style="width: 250px; min-height: 100px;" ></textarea>
</div>

<button id = "sumbit" style="margin-left: 130px;width: 70px;height: 26px;line-height: 26px">保存商品</button>
</div>

</body>
</html>
