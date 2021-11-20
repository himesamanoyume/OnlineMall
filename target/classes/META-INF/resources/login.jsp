<%--
  Created by IntelliJ IDEA.
  User: 28583
  Date: 2021/11/2
  Time: 15:40:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="/js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script src="/js/Funcs.js" type="text/javascript"></script>
    <script src="/js/login.js" type="text/javascript"></script>
    <style>
        @import "/css/MyIndexCSS.css";
        @import "/css/divSpace.css";
        @import "/css/divTips.css";
    </style>

    <style>
        body{
            background: rgb(255,250,250);
            justify-content: center;
        }


    </style>
    <title>登陆</title>
</head>
<body>
<c:set var="urlWhere" value="null"/>
<div id="top">
    <%@include file="component/top.jsp" %>
</div>
<div style="width:300px;height:330px;background-color: white;z-index: 9;margin-top: 150px;margin-bottom: 150px;margin-left:38%;border-radius: 10px;padding:15px;box-shadow: 0 0 0 1px #66ccff;">

    <div>
        <div style="font-size:20px;font-weight:bold;width:100%;text-align: center;">登录</div>
        <div style="width:100%;height:1px;background-color: #66ccff;margin:10px auto;"></div>

        <div style="width:100%;display: flex;margin-top:30px;line-height:70px;">
            <div style="width:80px;text-align:right;">
                账号：
            </div>

            <input class="topItem" type="text" name="account" placeholder="请输入手机号"/>
        </div>

        <div style="width:100%;display: flex; margin-top:30px;line-height:70px;">
            <div style="width:80px;text-align:right;">
                密码：
            </div>

            <input class="topItem" type="password" name="password" placeholder="请输入密码"/>
        </div>

        <div style="width:100%;display: flex; margin-top:30px;line-height:70px;justify-content: right">
            <button id="submit" class="topItem">确定</button>

            <button class="topItem" onclick="window.location.href = '/view/reg'">
                注册
            </button>
        </div>
    </div>
</div>
<%@include file="./component/divFooter.jsp" %>
</body>
</html>
