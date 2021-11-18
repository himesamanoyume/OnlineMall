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

    <script src="/js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script src="/js/Funcs.js" type="text/javascript"></script>
    <script src="/js/createBook.js" type="text/javascript"></script>

    <style>
        @import "/css/MyIndexCSS.css";
        @import "/css/divSpace.css";
        @import "/css/divTips.css";
    </style>
    <style>

        .menu_item {
            margin-top: 5px;
            margin-bottom: 5px;
            cursor: pointer;
        }

        .menu_item :hover {
            border: 1px solid #AAA;
        }

        .top_menu {
            margin-right: 25px;
            color: #333;
            cursor: pointer;
        }

        .input_item {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .input_item input{
            width: 250px;
            height: 30px;
            line-height: 30px;
        }

        .input_label {
            width: 120px;
            text-align: right;
        }

        .preview_img {
            width: 180px;
            height: 180px;
            object-fit: cover;
            margin: 10px;
        }

        .del_img {
            position: absolute;
            top: 0;
            right: 0;
            color: red;
            font-size: 30px;
            font-weight: bold;
            cursor: pointer;
            display: none;
            line-height: 32px;
        }

        .img_box{
            width: 180px;
            height: 180px;
            position: relative;
            margin: 10px;
        }

    </style>
</head>
<body>
<div id="top">
    <%@include file="component/top.jsp" %>
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

<div class="input_item">
    <div class="input_label">图片</div>
    <!-- //multiple="multiple" 上传多张文件 -->
    <input id = "file" type="file" accept="image/*" multiple="multiple"/>
</div>

<div id = "show_box" style="width: 100%;display: flex;align-content: flex-start;">
<%--     <img alt="" src="upload/1.jpg" class="preview_img" >--%>

<%--    <div class="img_box">--%>
<%--        <img alt="" src="/upload/1.png" class="preview_img" >--%>
<%--        <div class="del_img">X</div>--%>
<%--    </div>--%>

</div>

<button id = "submit" style=" margin-top: 20px;margin-left: 130px;width: 70px;height: 26px;line-height: 26px">保存商品</button>
</div>


<%@include file="./component/divFooter.jsp" %>
</body>
</html>
