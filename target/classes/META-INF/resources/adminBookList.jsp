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

    <script src="/js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script src="/js/Funcs.js" type="text/javascript"></script>
    <script src="/js/adminBookList.js" type="text/javascript" ></script>

</head>
<body>
<c:set var="urlWhere" value="adminBookList"/>
<div id="top">
    <select id="searchStatus" class="topItem">
        <option value="" ${status == '' || status == null ? 'selected' : ''}>全部</option>

        <option value="2" ${status == '2' ? 'selected' : ''}>待审核</option>
        <option value="3" ${status == '3' ? 'selected' : ''}>上架</option>
        <option value="4" ${status == '4' ? 'selected' : ''}>下架</option>
    </select>

    <%@include file="component/top.jsp" %>
</div>


<div id="title">

    图书列表

</div>

<%@include file="./component/divSpace.jsp" %>

<%@include file="./component/get.jsp" %>

<%@include file="./component/page.jsp" %>


</body>
</html>
