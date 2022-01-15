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
    <meta content="HimeBlog" name="title">
    <meta content="Himesamanoyume" name="author-name1">
    <meta content="Princess Dreamland" name="author-name2">
    <meta content="${post.title}" name="post-title">
    <link rel="shortcut icon" href="../_jsp/favicon.ico">
    ${head}
</head>
<body id="body" data-theme="auto">
<%@include file="../_component/_headerAndTitle.jsp" %>
<c:set var="urlWhere" value="postDetail"/>
    <main class="main" data-url="postDetail">
        <div class="home-container">
            <div class="post-container">
                <div class="post" data-postId="${post.postId}">
                    <div class="post-Img-container">
                        <c:if test="${post.topImg!=null}"><img class="lazy" data-src="./Img/${post.keyword}/${post.topImg}"></c:if>
                    </div>
                    <div class="post-txt-container">
                        <c:if test="${post.typeId == 5}">
                            <div class="post-detail-title">动态详细</div>
                        </c:if>
                        <c:if test="${post.typeId != 5}">
                            <div class="post-detail-title">${post.title}</div>
                        </c:if>
                        <div class="post-detail-postInfo-container">
                            <div class="post-detail-datetime">${post.publishTime}</div>
                            <div class="post-detail-dynamic">
                                <c:if test="${post.typeId == 1}">
                                    随笔
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
                                    动态
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
    </main>
<%@include file="../_component/_footer.jsp" %>
</body>
</html>

