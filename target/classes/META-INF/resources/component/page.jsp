<%--
  Created by IntelliJ IDEA.
  User: 28583
  Date: 2021/11/4
  Time: 20:04:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="width: 100%;height:40px;line-height: 40px;display: flex;align-items: center;margin-top:20px;">
    <div style="flex:1;"></div>

    <c:if test="${currentPage>1}">
        <button class="topItem" id="prePage">上一页</button>
    </c:if>

    <div style="margin-left:8px;" id="currentPage">${currentPage}</div>

    <c:if test="${currentPage<totalPages}">
        <button class="topItem" id="nextPage">下一页</button>
    </c:if>
</div>

