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
<div id="top">
<%@include file="./component/title.jsp" %>
</div>

<div id="title">

        网上商城

</div>

<%@include file="./component/divSpace.jsp" %>

<%@include file="./component/get.jsp" %>

<%@include file="./component/page.jsp" %>


<div id="divFooter">
    &nbsp;&nbsp;&nbsp;Copyright 2021©  &nbsp; @姫様の夢 &nbsp;&nbsp;&nbsp;
</div>
</body>

</html>

