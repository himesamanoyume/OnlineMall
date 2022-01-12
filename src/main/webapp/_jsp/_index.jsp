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
    <link rel="shortcut icon" href="../_jsp/favicon.ico">
    <meta content="HimeBlog" name="title">
    <meta content="Himesamanoyume" name="author-name1">
    <meta content="Princess Dreamland" name="author-name2">
    <title>HimeBlog</title>
    <style>
        <%@include file="../_component/_style.jsp" %>
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
            PostOpenDetailFunc();
            PermissionButtonFunc();
            SearchButtonFunc();
            PageFunc();
            function PageFunc(){
                $('#prePage').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = ${currentPage} - 1;
                    location.href="/?type="
                        + "&keyword="
                        + getCookie("input-keyword")
                        // + $('#keyword').val()
                        + "&currentPage="
                        + page;
                });
                $('#nextPage').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = ${currentPage} + 1;
                    location.href="/?type="
                        + "&keyword="
                        + getCookie("input-keyword")
                        // + $('#keyword').val()
                        + "&currentPage="
                        + page;
                });
                $('#firstPage').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = 1;
                    location.href="/?type="
                        + "&keyword="
                        + getCookie("input-keyword")
                        // + $('#keyword').val()
                        + "&currentPage="
                        + page;
                });
                $('#lastPage').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = ${totalPages};
                    location.href="/?type="
                        + "&keyword="
                        + getCookie("input-keyword")
                        // + $('#keyword').val()
                        + "&currentPage="
                        + page;
                });
                $('#currentPre2Page').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = ${currentPage-2};
                    location.href="/?type="
                        + "&keyword="
                        + getCookie("input-keyword")
                        // + $('#keyword').val()
                        + "&currentPage="
                        + page;
                });
                $('#currentPrePage').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = ${currentPage-1};
                    location.href="/?type="
                        + "&keyword="
                        + getCookie("input-keyword")
                        // + $('#keyword').val()
                        + "&currentPage="
                        + page;
                });
                $('#currentNextPage').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = ${currentPage+1};
                    location.href="/?type="
                        + "&keyword="
                        + getCookie("input-keyword")
                        // + $('#keyword').val()
                        + "&currentPage="
                        + page;
                });
                $('#currentNext2Page').click(function(){
                    setCookie("input-keyword",$('#keyword').val())
                    var page = ${currentPage+2};
                    location.href="/?type="
                        + "&keyword="
                        + getCookie("input-keyword")
                        // + $('#keyword').val()
                        + "&currentPage="
                        + page;
                });
            }

        })

    </script>
</head>
<body id="body" data-theme="auto">
<c:set var="urlWhere" value="index"/>
    <main class="main" data-url="index" data-keyword="">
        <%@include file="../_component/_headerAndTitle.jsp" %>
        <div class="home-container">
            <div class="post-container">
                <c:if test="${currentPage<=1}">
                    ${misc}
<%--                    <div class="main-post">--%>
<%--                        <img class="lazy" data-src="/_jsp/indexMain.webp">--%>
<%--                        <h2>关于本站</h2>--%>
<%--                        <div class="main-post-content">--%>
<%--                            <p>编写时间：8天 (2021.11.23 16:37 - 2021.12.01 02:16)</p>--%>
<%--                            <p>正式上线：2021年12月1日</p>--%>
<%--                            <div class="main-post-content-txt">--%>
<%--                                本站建立首要目标就是手机端浏览体验更佳，因此整体布局借鉴了我一位群友的博客风格，并支持<span class="highlight">Lazyload</span>以及<span class="highlight">深色/浅色--%>
<%--                                主题切换</span>，博客内部模糊搜索，支持站长进入<span class="highlight">后台系统</span>即时修改文章内容，但暂不支持评论--%>
<%--                            </div>--%>
<%--                            <div class="main-post-content-txt">--%>
<%--                                拥有<span class="highlight">低级权限密码</span>的浏览者可以提升权限，将可开启导航栏中的隐藏项目--%>
<%--                                <p>由于本项目内含有个人信息，故不进行开源</p>--%>
<%--                            </div>--%>
<%--                            <h3>个人信息</h3>--%>
<%--                            <div class="main-post-content-txt">--%>
<%--                                <p>FPS游戏爱好者，PC DIY知识储备OK，动漫宅，日本商业动画作画MAD观赏爱好者</p>--%>
<%--                                <p>头像画师<a href="https://www.pixiv.net/users/1198913" target="_blank">@ほし</a></p>--%>
<%--                                <h4>喜欢的插画画师</h4>--%>
<%--                                <p><a href="https://www.pixiv.net/users/25760573" target="_blank">@rurudo</a>,<a href="https://www.pixiv.net/users/16731" target="_blank">@玉之けだま</a>,等..</p>--%>
<%--                                <h4>喜欢的动画原画师</h4>--%>
<%--                                <p>中村丰，阿部望，金子秀一</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </c:if>

                <div class="newest-title">
                    最新发布
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

