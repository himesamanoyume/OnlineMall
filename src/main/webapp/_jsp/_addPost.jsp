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
    <title>发布 | HimeBlog</title>
    <link rel="shortcut icon" href="../_jsp/favicon.ico">
    ${head}
</head>
<body id="body" data-theme="auto">
<c:set var="urlWhere" value="addPost"/>
<%@include file="../_component/_headerAndTitle.jsp" %>
    <main class="main" data-url="addPost">
        <div class="home-container">
            <div class="post-container">
                <%@include file="../_component/_post.jsp" %>
            </div>
            <%@include file="../_component/_info.jsp" %>
        </div>
    </main>
<%@include file="../_component/_footer.jsp" %>
</body>
</html>

