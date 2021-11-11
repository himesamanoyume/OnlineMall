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
    <title>mall</title>
    <style>
        @import "/css/MyIndexCSS.css";
        @import "/css/divSpace.css";
        @import "/css/divTips.css";

        th{
            background: #66ccff;

        }
        td{
            padding: 3px 5px 3px 5px;
        }
        .tableDiv{
            justify-content: center;
        }

    </style>
    <script src="/js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script src="/js/Funcs.js" type="text/javascript"></script>
    <script src="/js/userList.js" type="text/javascript"></script>
</head>
<body>
<c:set var="urlWhere" value="userList"/>
<div id="top">
    <%@include file="component/top.jsp" %>
</div>
<div id="title">

        用户列表

</div>
<div class="tableDiv">
        <table border="1" align="center" id="table">
            <tr>
                <th>序号</th>
                <th>账号</th>
                <th>姓名</th>
                <th>类别</th>
                <th>余额</th>
                <th>地址</th>
                <th>操作</th>
            </tr>
<%--            <tr>--%>
<%--                <td>row 1, cell 1</td>--%>
<%--                <td>row 1, cell 2</td>--%>
<%--                <td>row 1, cell 3</td>--%>
<%--                <td>row 1, cell 4</td>--%>
<%--                <td>row 1, cell 5</td>--%>
<%--                <td>row 1, cell 6</td>--%>
<%--            </tr>--%>

        </table>
</div>
<div id="divFooter">
    &nbsp;&nbsp;&nbsp;Copyright 2021©  &nbsp; @姫様の夢 &nbsp;&nbsp;&nbsp;
</div>
</body>

</html>

