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
    <title>HimeBlog</title>
    <style>
        @import "/_css/common.css";
        @import "/_css/header.css";
        @import "/_css/footer.css";
        @import "/_css/postDetail.css";
        @import "/_css/editPost.css";
    </style>
    <script src="/_js/jquery.js" type="text/javascript"></script>
    <script src="/_js/_Funcs.js" type="text/javascript"></script>
    <script>
        $(document).ready(function(){
            SaveThemeCookie();
            ThemeSetFunc();
            NavFunc();
            $('#saveEdit').click(function (){
                var topImg = $('#topImg').val()
                var title = $('#title').val()
                var publishTime = $('#publishTime').val()
                var typeId = $('#typeId').val()
                var article = $('#article').val()

                topImg = topImg.trim()
                title = title.trim()
                publishTime = publishTime.trim()
                typeId = typeId.trim()
                article = article.trim()

                if(!title){
                    alert("标题不能为空")
                    return
                }
                if(typeId==0){
                    typeId = ${post.typeId}
                }

                $.post('/post/editPost',{
                    postId:${post.postId},
                    topImg:topImg,
                    title:title,
                    publishTime:publishTime,
                    typeId:typeId,
                    article:article
                },function (res){
                    if (res && res.postId){
                        alert("编辑文章成功")
                        location.reload();
                    }
                }).fail(function (res){
                    alert(res.responseJSON.message)
                })
            })
        })
        window.onresize=function(){

        }
        window.onscroll=function (){

        }
    </script>
</head>
<body id="body" data-theme="auto">
<c:set var="urlWhere" value="editPost"/>
    <main class="main" data-url="editPost">
        <%@include file="../_component/_headerAndTitle.jsp" %>
        <div class="home-container">
            <div class="post-container">

                <div class="post" data-postId="${post.postId}">
                    <input id="topImg" class="post-edit-topImg" value="${post.topImg}" placeholder="图片地址">
                    <div class="post-txt-container">
                        <input id="title" class="post-edit-title" value="${post.title}" placeholder="标题名">
                        <div class="post-detail-postInfo-container">
                            <input id="publishTime" class="post-edit-datetime" type="date" value="${post.publishTime}">
                            <select id="typeId" class="post-edit-tags">
                                <option value="0">
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
                                </option>
                                <option value="1">文章</option>
                                <option value="2">项目</option>
                                <option value="3">笔记</option>
                                <option value="4">工具</option>
                                <option value="5">标签</option>
                            </select>

                        </div>
                        <hr class="hr"/>
                        <textarea id="article" class="post-edit-txt" placeholder="正文">${post.article}</textarea>

                    </div>
                </div>
            </div>
            <%@include file="../_component/_info.jsp" %>
        </div>

        <%@include file="../_component/_footer.jsp" %>
    </main>



</body>
</html>

