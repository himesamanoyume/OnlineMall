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
    <title>文章 | HimeBlog</title>
    <link rel="shortcut icon" href="../_jsp/favicon.ico">
    ${head}
    <script>
        var currentPage = ${currentPage};
        var totalPages = ${totalPages};
    </script>
</head>
<body id="body" data-theme="auto">
<c:set var="urlWhere" value="post"/>
<%@include file="../_component/_headerAndTitle.jsp" %>
    <main class="main" data-url="post" data-type="1" data-keyword="">
        <div class="home-container">
            <div class="post-container">
                <%@include file="../_component/_get.jsp" %>
                <%@include file="../_component/_page.jsp" %>
            </div>
            <%@include file="../_component/_info.jsp" %>
        </div>
    </main>
<%@include file="../_component/_footer.jsp" %>
</body>
</html>

