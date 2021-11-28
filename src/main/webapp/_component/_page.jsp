<%--
  Created by IntelliJ IDEA.
  User: 28583
  Date: 2021/11/6
  Time: 1:44:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="post-page">
    <div class="post-page-container">
        <c:if test="${totalPages==0}">
            <div class="post-page-container-nullSearch">找不到任何东西哦</div>
        </c:if>
        <c:if test="${totalPages!=0}">
            <c:if test="${currentPage>1}">
                <div class="post-page-container-button" id="prePage">上一页</div>
            </c:if>

            <c:if test="${currentPage!=null}">
                <div class="post-page-container-currentPage" id="currentPage">第${currentPage}页</div>
            </c:if>
            <c:if test="${currentPage<totalPages}">
                <div class="post-page-container-button" id="nextPage">下一页</div>
            </c:if>
        </c:if>

    </div>
</div>