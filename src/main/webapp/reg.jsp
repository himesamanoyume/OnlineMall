<%--
  Created by IntelliJ IDEA.
  User: 28583
  Date: 2021/11/2
  Time: 15:59:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="/js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script src="/js/Funcs.js" type="text/javascript"></script>
    <script src="/js/reg.js" type="text/javascript"></script>
    <title>reg</title>
    <style>
        @import "/css/MyIndexCSS.css";
        @import "/css/divSpace.css";
        @import "/css/divTips.css";
    </style>
</head>
<body>
<c:set var="urlWhere" value="null"/>
<div id="top">
    <%@include file="component/top.jsp" %>
</div>
<div style="width:300px;height:400px;background-color: white;z-index: 9;margin-top: 200px;margin-left:38%;border-radius: 10px;padding:15px;">
    <div style="font-size:20px;font-weight:bold;width:100%;text-align: center;">注册</div>
    <div style="width:100%;height:1px;background-color: #CCC;margin:10px auto;"></div>

    <div style="width:100%;display: flex;margin-top:30px;line-height:30px;align-items: center;">
        <div style="width:80px;text-align:right;">
            用户类型：
        </div>

        <input name="type" type="radio" value="0" checked="true"/>买家

        <input name="type" type="radio" value="1" style="margin-left:20px;" />卖家
    </div>

    <div style="width:100%;display: flex;margin-top:30px;line-height:30px;">
        <div style="width:80px;text-align:right;">
            账号：
        </div>
        <input type="text" name="account" placeholder="输入手机号"/>
    </div>

    <div style="width:100%;display: flex; margin-top:30px;line-height:30px;">
        <div style="width:80px;text-align:right;">
            密码：
        </div>
        <input type="password" name="password" placeholder="密码不少于6位"/>
    </div>

    <div style="width:100%;display: flex; margin-top:30px;line-height:30px;">
        <div style="width:80px;text-align:right;">
            确认密码：
        </div>

        <input type="password" name="confirmPassword" placeholder="请确认密码"/>
    </div>

    <div style="width:100%;display: flex; margin-top:30px;line-height:30px;">
        <div style="width:80px;text-align:right;"></div>
        <div style="flex:1;text-align: center;">
            <button style="width:60px;margin:0 auto;display: inline-block;" id="submit">确定</button>
        </div>
    </div>

</div>
</body>
</html>
