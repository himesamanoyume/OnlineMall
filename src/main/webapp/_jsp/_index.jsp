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
    <title></title>
    <style>
        @import "/_css/common.css";
        @import "/_css/header.css";
        @import "/_css/footer.css";
    </style>
    <script src="/_js/jquery.js" type="text/javascript"></script>
    <script src="/_js/_Funcs.js" type="text/javascript"></script>
    <script>
        window.onload=function (){

        }
        window.onresize=function(){

        }
        window.onscroll=function (){

        }
    </script>
</head>
<body>
    <main class="main">
        <header class="header">
            <nav class="nav">
                <div class="blogName">HimeBlog</div>
                <div class="nav-container">
                    <div class="nav-link">主页
                        <div class="hover-bar"></div>
                    </div>
                    <div class="nav-link">简历
                        <div class="hover-bar"></div>
                    </div>
                    <div class="nav-link">项目
                        <div class="hover-bar"></div>
                    </div>
                    <div class="nav-link">笔记
                        <div class="hover-bar"></div>
                    </div>
                    <div class="nav-link">工具
                        <div class="hover-bar"></div>
                    </div>
                    <div class="nav-link">标签
                        <div class="hover-bar"></div>
                    </div>
                </div>

            </nav>
        </header>
        <div class="topTitle">
            HimeBlog
        </div>
        <div class="home-container">
            <div class="post-container">
                <div class="main-post">

                </div>
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
                <c:forEach items="${postList}" var="item">
                    <div class="post">
                        <img>
                        <div class="post-txt-container">
                            <div class="post-txt-container-title">
                                    ${item.title}
                            </div>
                            <div class="post-txt-container-introduction">
                                    ${item.introduction}
                            </div>
                            <div class="post-txt-container-datetime">
                                    ${item.publishTime}
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
            <aside class="info-container">
                <div class="info-container-inner">
                    <div class="info">
                        <img src="/_jsp/usericon.png" class="info-icon">
                        <div class="info-name">姫様の夢</div>
                        <div class="info-txt">Princess Dreamland</div>
                    </div>
                    <div class="info-link"></div>
                </div>

            </aside>
        </div>

        <div class="footer">
            &nbsp;&nbsp;&nbsp;Copyright 2021©  &nbsp; @姫様の夢 &nbsp;&nbsp;&nbsp;
            <a href="https://beian.miit.gov.cn/" target="_blank">桂ICP备2021008786号</a>
        </div>
    </main>



</body>
</html>

