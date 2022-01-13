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

<c:forEach items="${postList}" var="item">
    <c:if test="${urlWhere == 'dynamic'}">
        <div class="post" data-postId="${item.postId}">
            <div class="post-Img-container">
                <c:if test="${item.topImg!=null}"><img class="lazy" data-src="../Img/${item.keyword}/${item.topImg}"></c:if>
            </div>
            <div class="post-txt-container">
                <div class="post-txt-container-introduction">
                    <pre>${item.article}</pre>
                </div>
                <div class="post-txt-container-datetime">
                        ${item.publishTime}
                </div>
            </div>
        </div>
    </c:if>
</c:forEach>