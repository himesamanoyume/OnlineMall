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
        <%@include file="../_component/_style.jsp" %>
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
            editPostFunc();
            $('#savePost').click(function (){
                var topImg = $('#topImg').val()
                var title = $('#title').val()
                var introduction = $('#introduction').val()
                var publishTime = $('#publishTime').val()
                var typeId = $('#typeId').val()
                var article = $('#article').val()

                topImg = topImg.trim()
                title = title.trim()
                introduction = introduction.trim()
                publishTime = publishTime.trim()
                typeId = typeId.trim()
                article = article.trim()

                if(!title){
                    alert("标题不能为空")
                    return
                }

                $.post('/post/addPost',{
                    topImg:topImg,
                    title:title,
                    introduction:introduction,
                    publishTime:publishTime,
                    typeId:typeId,
                    article:article
                },function (res){
                    if (res && res.postId){
                        alert("新增文章成功")
                        location.href="/console";
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
<c:set var="urlWhere" value="addPost"/>
    <main class="main" data-url="addPost">
        <%@include file="../_component/_headerAndTitle.jsp" %>
        <div class="home-container">
            <div class="post-container">
                <%@include file="../_component/_post.jsp" %>
            </div>
            <%@include file="../_component/_info.jsp" %>
        </div>

        <%@include file="../_component/_footer.jsp" %>
    </main>



</body>
</html>

