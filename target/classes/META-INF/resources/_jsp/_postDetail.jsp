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
    <title>${post.title} | HimeBlog</title>
    <link rel="shortcut icon" href="../_jsp/favicon.ico">
    <style>
        <%@include file="../_component/_style.jsp" %>
        @import "/_css/postDetail.css";
    </style>
    <script src="/_js/jquery.js" type="text/javascript"></script>
    <script src="/_js/jquery.lazy.min.js" type="text/javascript"></script>
    <script src="/_js/_Funcs.js" type="text/javascript"></script>
    <script>
        $(document).ready(function(){
            InitFunc();
            SaveThemeCookie();
            ThemeSetFunc();
            NavFunc();
            EditAndDetailFunc();
            BackTopFunc();
        })
    </script>
</head>
<body id="body" data-theme="auto">
<c:set var="urlWhere" value="postDetail"/>
    <main class="main" data-url="postDetail">
        <%@include file="../_component/_headerAndTitle.jsp" %>
        <div class="home-container">
            <div class="post-container">
                <div class="post" data-postId="${post.postId}">
                    <div class="post-Img-container">
                        <c:if test="${post.topImg!=null}"><img class="lazy" data-src="./Img/${post.keyword}/${post.topImg}"></c:if>
                    </div>
                    <div class="post-txt-container">
                        <div class="post-detail-title">${post.title}</div>
                        <div class="post-detail-postInfo-container">
                            <div class="post-detail-datetime">${post.publishTime}</div>
                            <div class="post-detail-dynamic">
                                <c:if test="${post.typeId == 1}">
                                    文章
                                </c:if>
                                <c:if test="${post.typeId == 2}">
                                    项目
                                </c:if>
                                <c:if test="${post.typeId == 3}">
                                    笔记
                                </c:if>
                                <c:if test="${post.typeId == 4}">
                                    工具
                                </c:if>
                                <c:if test="${post.typeId == 5}">
                                    标签
                                </c:if>
                            </div>
                        </div>
                        <hr class="hr"/>
                        <div class="post-detail-txt">
                            <pre>${post.article}</pre>
                        </div>

                    </div>
                </div>
                <%@include file="../_component/_get.jsp" %>

            </div>
            <%@include file="../_component/_info.jsp" %>
        </div>

        <%@include file="../_component/_footer.jsp" %>
    </main>



</body>
</html>

