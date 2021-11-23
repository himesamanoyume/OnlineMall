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
            changeInfoContainerPosition();
        }
        window.onresize=function(){
            changeInfoContainerPosition();
        }
        window.onscroll=function (){
            changeInfoContainerPosition();
        }
    </script>
</head>
<body>


    <main class="main">
        <header class="header">
            <nav class="nav">
                <div class="blogName">HimeBlog</div>
                <a class="nav-link">蛤蛤
                    <div class="hover-bar"></div>
                </a>
                <a class="nav-link">蛤蛤
                    <div class="hover-bar"></div>
                </a>
                <a class="nav-link">蛤蛤
                    <div class="hover-bar"></div>
                </a>
                <a class="nav-link">蛤蛤
                    <div class="hover-bar"></div>
                </a>
            </nav>
        </header>
        <div class="topTitle">

        </div>
        <div class="home-container">
            <div class="post-container">
                <div class="post"></div>
                <div class="post"></div>
                <div class="post"></div>
                <div class="post"></div>
                <div class="post"></div>
                <div class="post"></div>
                <div class="post"></div>
                <div class="post"></div>
                <div class="post"></div>
            </div>
            <aside class="info-container">
                <div>
                    <div class="info"></div>
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

