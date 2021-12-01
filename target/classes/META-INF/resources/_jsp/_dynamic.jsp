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
    <title>动态 | HimeBlog</title>
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
            // PostOpenDetailFunc();
            SearchButtonFunc();
            PermissionButtonFunc();
            PageFunc();
            function PageFunc(){
                $('#prePage').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = ${currentPage} - 1;
                    location.href="/"
                        + $('.main').attr('data-url')
                        + "?type="
                        + $('.main').attr('data-type')
                        + "&keyword="
                        + getCookie("input-keyword")
                        // + $('#keyword').val()
                        + "?&currentPage="
                        + page;
                });
                $('#nextPage').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = ${currentPage} + 1;
                    location.href="/"
                        + $('.main').attr('data-url')
                        + "?type="
                        + $('.main').attr('data-type')
                        + "&keyword="
                        + getCookie("input-keyword")
                        // + $('#keyword').val()
                        + "?&currentPage="
                        + page;
                });
                $('#firstPage').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = 1;
                    location.href="/"
                        + $('.main').attr('data-url')
                        + "?type="
                        + $('.main').attr('data-type')
                        + "&keyword="
                        + getCookie("input-keyword")
                        // + $('#keyword').val()
                        + "?&currentPage="
                        + page;
                });
                $('#lastPage').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = ${totalPages};
                    location.href="/"
                        + $('.main').attr('data-url')
                        + "?type="
                        + $('.main').attr('data-type')
                        + "&keyword="
                        + getCookie("input-keyword")
                        // + $('#keyword').val()
                        + "?&currentPage="
                        + page;
                });
                $('#currentPre2Page').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = ${currentPage-2};
                    location.href="/"
                        + $('.main').attr('data-url')
                        + "?type="
                        + $('.main').attr('data-type')
                        + "&keyword="
                        + getCookie("input-keyword")
                        // + $('#keyword').val()
                        + "?&currentPage="
                        + page;
                });
                $('#currentPrePage').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = ${currentPage-1};
                    location.href="/"
                        + $('.main').attr('data-url')
                        + "?type="
                        + $('.main').attr('data-type')
                        + "&keyword="
                        + getCookie("input-keyword")
                        // + $('#keyword').val()
                        + "?&currentPage="
                        + page;
                });
                $('#currentNextPage').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = ${currentPage+1};
                    location.href="/"
                        + $('.main').attr('data-url')
                        + "?type="
                        + $('.main').attr('data-type')
                        + "&keyword="
                        + getCookie("input-keyword")
                        // + $('#keyword').val()
                        + "?&currentPage="
                        + page;
                });
                $('#currentNext2Page').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = ${currentPage+2};
                    location.href="/"
                        + $('.main').attr('data-url')
                        + "?type="
                        + $('.main').attr('data-type')
                        + "&keyword="
                        + getCookie("input-keyword")
                        // + $('#keyword').val()
                        + "?&currentPage="
                        + page;
                });
            }
        })

    </script>
</head>
<body id="body" data-theme="auto">
<c:set var="urlWhere" value="dynamic"/>
    <main class="main" data-url="dynamic" data-type="5" data-keyword="">
        <%@include file="../_component/_headerAndTitle.jsp" %>
        <div class="home-container">
            <div class="post-container">
                <%@include file="../_component/_get.jsp" %>
                <%@include file="../_component/_page.jsp" %>
            </div>
            <%@include file="../_component/_info.jsp" %>
        </div>

        <%@include file="../_component/_footer.jsp" %>
    </main>



</body>
</html>
