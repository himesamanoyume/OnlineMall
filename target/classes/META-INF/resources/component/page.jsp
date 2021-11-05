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

<div class="page">
<%--    <div style="flex:1;"></div>--%>

    <c:if test="${currentPage>1}">
        <button class="pageItem" id="prePage">上一页</button>
    </c:if>

    <c:if test="${currentPage!=null}">
    <div class="pageItem" id="currentPage">${currentPage}</div>
    </c:if>

    <c:if test="${currentPage==null}">
        <div>找不到任何书本</div>
    </c:if>

    <c:if test="${currentPage<totalPages}">
        <button class="pageItem" id="nextPage">下一页</button>
    </c:if>
</div>

