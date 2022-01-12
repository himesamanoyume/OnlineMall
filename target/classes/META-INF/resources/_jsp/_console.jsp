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
    <title>后台 | HimeBlog</title>
    <link rel="shortcut icon" href="../_jsp/favicon.ico">
    <style>
        <%@include file="../_component/_style.jsp" %>
        @import "/_css/postDetail.css";
        @media screen and (max-width: 990px){
            .home-container {
                flex-direction: column-reverse;
            }
        }
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
            SearchButtonFunc();
            ConsolePostOpenEditFunc();
            ConsolePostOpenDetailFunc();
            ConsoleAddPostFunc();
            ConsoleContorlPostFunc();
            BackTopFunc();
            function ConsoleContorlPostFunc(){
                $('body').on('click', '.console-container-set-status-button', function (){
                    $.post('/post/setStatus',{
                        postId:$(this).parent().parent().parent().attr('data-postId')
                    },function (res){
                        if (res&&res.postId){
                            alert("状态改变成功")
                            location.reload();
                        }else{
                            alert("失败")
                        }
                    }).fail(function (res){
                        alert(res.responseJSON.message)
                    })
                });
                $('body').on('click', '.console-container-delete-button', function (){
                    $.post('/post/deletePost',{
                        postId:$(this).parent().parent().parent().attr('data-postId')
                    },function (res){
                        if (res&&res.postId){
                            alert("删除文章成功")
                            location.reload();
                        }else{
                            alert("失败")
                        }
                    }).fail(function (res){
                        alert(res.responseJSON.message)
                    })
                });
            }
            PageFunc();
            function PageFunc(){
                $('#prePage').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = ${currentPage} - 1;
                    if (getCookie("console-type")){
                        $('.main').attr('data-type',getCookie("console-type"))
                        location.href="/"
                            + $('.main').attr('data-url')
                            + "?type="
                            + $('.main').attr('data-type')
                            + "&keyword="
                            + getCookie("input-keyword")
                            // + $('#keyword').val()
                            + "&currentPage="
                            + page;
                    }else{
                        location.href="/"
                            + $('.main').attr('data-url')
                            + "?type="
                            + "&keyword="
                            + getCookie("input-keyword")
                            // + $('#keyword').val()
                            + "&currentPage="
                            + page;
                    }
                });
                $('#nextPage').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = ${currentPage} + 1;
                    if (getCookie("console-type")){
                        $('.main').attr('data-type',getCookie("console-type"))
                        location.href="/"
                            + $('.main').attr('data-url')
                            + "?type="
                            + $('.main').attr('data-type')
                            + "&keyword="
                            + getCookie("input-keyword")
                            // + $('#keyword').val()
                            + "&currentPage="
                            + page;
                    }else{
                        location.href="/"
                            + $('.main').attr('data-url')
                            + "?type="
                            + "&keyword="
                            + getCookie("input-keyword")
                            // + $('#keyword').val()
                            + "&currentPage="
                            + page;
                    }
                });
                $('#firstPage').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = 1;
                    if (getCookie("console-type")){
                        $('.main').attr('data-type',getCookie("console-type"))
                        location.href="/"
                            + $('.main').attr('data-url')
                            + "?type="
                            + $('.main').attr('data-type')
                            + "&keyword="
                            + getCookie("input-keyword")
                            // + $('#keyword').val()
                            + "&currentPage="
                            + page;
                    }else{
                        location.href="/"
                            + $('.main').attr('data-url')
                            + "?type="
                            + "&keyword="
                            + getCookie("input-keyword")
                            // + $('#keyword').val()
                            + "&currentPage="
                            + page;
                    }
                });
                $('#lastPage').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = ${totalPages};
                    if (getCookie("console-type")){
                        $('.main').attr('data-type',getCookie("console-type"))
                        location.href="/"
                            + $('.main').attr('data-url')
                            + "?type="
                            + $('.main').attr('data-type')
                            + "&keyword="
                            + getCookie("input-keyword")
                            // + $('#keyword').val()
                            + "&currentPage="
                            + page;
                    }else{
                        location.href="/"
                            + $('.main').attr('data-url')
                            + "?type="
                            + "&keyword="
                            + getCookie("input-keyword")
                            // + $('#keyword').val()
                            + "&currentPage="
                            + page;
                    }
                });
                $('#currentPre2Page').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = ${currentPage-2};
                    if (getCookie("console-type")){
                        $('.main').attr('data-type',getCookie("console-type"))
                        location.href="/"
                            + $('.main').attr('data-url')
                            + "?type="
                            + $('.main').attr('data-type')
                            + "&keyword="
                            + getCookie("input-keyword")
                            // + $('#keyword').val()
                            + "&currentPage="
                            + page;
                    }else{
                        location.href="/"
                            + $('.main').attr('data-url')
                            + "?type="
                            + "&keyword="
                            + getCookie("input-keyword")
                            // + $('#keyword').val()
                            + "&currentPage="
                            + page;
                    }
                });
                $('#currentPrePage').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = ${currentPage-1};
                    if (getCookie("console-type")){
                        $('.main').attr('data-type',getCookie("console-type"))
                        location.href="/"
                            + $('.main').attr('data-url')
                            + "?type="
                            + $('.main').attr('data-type')
                            + "&keyword="
                            + getCookie("input-keyword")
                            // + $('#keyword').val()
                            + "&currentPage="
                            + page;
                    }else{
                        location.href="/"
                            + $('.main').attr('data-url')
                            + "?type="
                            + "&keyword="
                            + getCookie("input-keyword")
                            // + $('#keyword').val()
                            + "&currentPage="
                            + page;
                    }
                });
                $('#currentNextPage').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = ${currentPage+1};
                    if (getCookie("console-type")){
                        $('.main').attr('data-type',getCookie("console-type"))
                        location.href="/"
                            + $('.main').attr('data-url')
                            + "?type="
                            + $('.main').attr('data-type')
                            + "&keyword="
                            + getCookie("input-keyword")
                            // + $('#keyword').val()
                            + "&currentPage="
                            + page;
                    }else{
                        location.href="/"
                            + $('.main').attr('data-url')
                            + "?type="
                            + "&keyword="
                            + getCookie("input-keyword")
                            // + $('#keyword').val()
                            + "&currentPage="
                            + page;
                    }

                });
                $('#currentNext2Page').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = ${currentPage+2};
                    if (getCookie("console-type")){
                        $('.main').attr('data-type',getCookie("console-type"))
                        location.href="/"
                            + $('.main').attr('data-url')
                            + "?type="
                            + $('.main').attr('data-type')
                            + "&keyword="
                            + getCookie("input-keyword")
                            // + $('#keyword').val()
                            + "&currentPage="
                            + page;
                    }else{
                        location.href="/"
                            + $('.main').attr('data-url')
                            + "?type="
                            + "&keyword="
                            + getCookie("input-keyword")
                            // + $('#keyword').val()
                            + "&currentPage="
                            + page;
                    }
                });
            }
            ConsoleTypeFunc();
            function ConsoleTypeFunc(){
                $('#type0').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    $('.main').attr('data-type','')
                    setCookie("console-type",$('.main').attr('data-type'))
                    location.href="/"
                        + $('.main').attr('data-url')
                        + "?type="
                        + $('.main').attr('data-type')
                        + "&keyword="
                        + getCookie("input-keyword")
                        // + $('#keyword').val()
                        + "&currentPage=1"
                });
                $('#type1').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    $('.main').attr('data-type','1')
                    setCookie("console-type",$('.main').attr('data-type'))
                    location.href="/"
                        + $('.main').attr('data-url')
                        + "?type="
                        + $('.main').attr('data-type')
                        + "&keyword="
                        + getCookie("input-keyword")
                        // + $('#keyword').val()
                        + "&currentPage=1"
                });
                $('#type2').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    $('.main').attr('data-type','2')
                    setCookie("console-type",$('.main').attr('data-type'))
                    location.href="/"
                        + $('.main').attr('data-url')
                        + "?type="
                        + $('.main').attr('data-type')
                        + "&keyword="
                        + getCookie("input-keyword")
                        // + $('#keyword').val()
                        + "&currentPage=1"
                });
                $('#type3').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    $('.main').attr('data-type','3')
                    setCookie("console-type",$('.main').attr('data-type'))
                    location.href="/"
                        + $('.main').attr('data-url')
                        + "?type="
                        + $('.main').attr('data-type')
                        + "&keyword="
                        + getCookie("input-keyword")
                        // + $('#keyword').val()
                        + "&currentPage=1"
                });
                $('#type4').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    $('.main').attr('data-type','4')
                    setCookie("console-type",$('.main').attr('data-type'))
                    location.href="/"
                        + $('.main').attr('data-url')
                        + "?type="
                        + $('.main').attr('data-type')
                        + "&keyword="
                        + getCookie("input-keyword")
                        // + $('#keyword').val()
                        + "&currentPage=1"
                });
                $('#type5').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    $('.main').attr('data-type','5')
                    setCookie("console-type",$('.main').attr('data-type'))
                    location.href="/"
                        + $('.main').attr('data-url')
                        + "?type="
                        + $('.main').attr('data-type')
                        + "&keyword="
                        + getCookie("input-keyword")
                        // + $('#keyword').val()
                        + "&currentPage=1"
                });
            }
        })
    </script>
</head>
<body id="body" data-theme="auto">
<c:set var="urlWhere" value="console"/>
    <main class="main" data-url="console" data-keyword="" data-type="">
        <%@include file="../_component/_headerAndTitle.jsp" %>
        <div class="home-container">
            <div class="post-container">
                <div class="post-page">
                    <div class="console-type-container">
                        <div class="console-container-button" id="type0">
                            全部
                        </div>
                        <div class="console-container-button" id="type1">
                            文章
                        </div>
                        <div class="console-container-button" id="type2">
                            项目
                        </div>
                        <div class="console-container-button" id="type3">
                            笔记
                        </div>
                        <div class="console-container-button" id="type4">
                            工具
                        </div>
                        <div class="console-container-button" id="type5">
                            动态
                        </div>
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

