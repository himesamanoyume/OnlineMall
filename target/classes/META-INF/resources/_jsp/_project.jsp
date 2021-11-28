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
    </style>
    <script src="/_js/jquery.js" type="text/javascript"></script>
    <script src="/_js/_Funcs.js" type="text/javascript"></script>
    <script>
        $(document).ready(function(){
            SaveThemeCookie();
            ThemeSetFunc();
            NavFunc();
            PostOpenDetailFunc();
            SearchButtonFunc();
            PermissionButtonFunc();
            PageFunc();
            function PageFunc(){
                $('#prePage').click(function(){
                    var page = ${currentPage} - 1;
                    location.href="/"
                        + $('.main').attr('data-url')
                        + "?&currentPage="
                        + page;
                });
                $('#nextPage').click(function(){
                    var page = ${currentPage} + 1;
                    location.href="/"
                        + $('.main').attr('data-url')
                        + "?&currentPage="
                        + page;
                });
                $('#firstPage').click(function(){
                    var page = 1;
                    location.href="/"
                        + $('.main').attr('data-url')
                        + "?&currentPage="
                        + page;
                });
                $('#lastPage').click(function(){
                    var page = ${totalPages};
                    location.href="/"
                        + $('.main').attr('data-url')
                        + "?&currentPage="
                        + page;
                });
                $('#currentPre2Page').click(function(){
                    var page = ${currentPage-2};
                    location.href="/"
                        + $('.main').attr('data-url')
                        + "?&currentPage="
                        + page;
                });
                $('#currentPrePage').click(function(){
                    var page = ${currentPage-1};
                    location.href="/"
                        + $('.main').attr('data-url')
                        + "?&currentPage="
                        + page;
                });
                $('#currentNextPage').click(function(){
                    var page = ${currentPage+1};
                    location.href="/"
                        + $('.main').attr('data-url')
                        + "?&currentPage="
                        + page;
                });
                $('#currentNext2Page').click(function(){
                    var page = ${currentPage+2};
                    location.href="/"
                        + $('.main').attr('data-url')
                        + "?&currentPage="
                        + page;
                });
            }
        })

    </script>
</head>
<body id="body" data-theme="auto">
    <main class="main" data-url="project" data-type="2">
        <%@include file="../_component/_headerAndTitle.jsp" %>
        <div class="home-container">
            <div class="post-container">
                <div class="post">
                    <img src="/_jsp/test.png">
                    <div class="post-txt-container">
                        <div class="post-txt-container-title">测试标题测试标题测试标题</div>
                        <div class="post-txt-container-introduction">
                            好长的简介好长的简介好长的简介好长的简介好长的简介好长的简介好长的简介好长的简介好长的简介好长的简介好长的简介好长的简介好长的简介好长的简介好长的简介好长的简介好长的简介好长的简介好长的简介好长的简介
                        </div>
                        <div class="post-txt-container-datetime">2021-11-24</div>

                    </div>
                </div>
                <%@include file="../_component/_get.jsp" %>
                <%@include file="../_component/_page.jsp" %>
            </div>
            <%@include file="../_component/_info.jsp" %>
        </div>

        <%@include file="../_component/_footer.jsp" %>
    </main>



</body>
</html>

