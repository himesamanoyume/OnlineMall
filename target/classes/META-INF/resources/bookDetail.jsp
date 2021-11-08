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
    <script src="/js/bookDetail.js" type="text/javascript" ></script>

</head>
<body>
<c:set var="urlWhere" value="null"/>
<div id="top">
    <%@include file="component/top.jsp" %>
</div>


<div id="title">

    ${book.name}

</div>

<div id="indexBackground">
    <div class="divLine">
    <c:forEach items="${book.srcList}" var="item">
        <img src="${item.imgSrc}"/>

    </c:forEach>
    </div>
</div>




</body>
</html>
