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

<div class="post" <c:if test="${urlWhere == 'editPost'}"> data-postId="${post.postId}"</c:if>>
    <div class="post-txt-container">
        <input id="topImg" class="post-edit-topImg" <c:if test="${urlWhere == 'editPost'}"> value="${post.topImg}"</c:if> placeholder="NAME.TYPE">
        <input id="keyword" class="post-edit-topImg" <c:if test="${urlWhere == 'editPost'}">style="pointer-events: none;" value="${post.keyword}"</c:if> placeholder="关键字">

        <input id="tempInput" style="position: absolute;top: 0;left: 0;opacity: 0;z-index: -10;">
        <input id="title" class="post-edit-title" <c:if test="${urlWhere == 'editPost'}"> value="${post.title}"</c:if> placeholder="标题名">
        <div class="post-detail-postInfo-container">
            <input id="publishTime" class="post-edit-datetime" type="date" <c:if test="${urlWhere == 'editPost'}"> value="${post.publishTime}"</c:if>>
            <select id="typeId" class="post-edit-tags">
                <c:if test="${urlWhere == 'editPost'}">
                <option value="0">
                    <c:if test="${post.typeId == 1}">
                        文章
                    </c:if>
                    <c:if test="${post.typeId == 2}">
                        项目
                    </c:if>
                    <c:if test="${post.typeId == 3}">
                        笔记
                    </c:if>
                    <c:if test="${post.typeId == 4}">
                        工具
                    </c:if>
                    <c:if test="${post.typeId == 5}">
                        标签
                    </c:if>
                </option>
                </c:if>
                <option value="1">文章</option>
                <option value="2">项目</option>
                <option value="3">笔记</option>
                <option value="4">工具</option>
                <option value="5">标签</option>
            </select>
        </div>
        <hr class="hr"/>
        <textarea id="introduction" class="post-edit-introduction" placeholder="简介"><c:if test="${urlWhere == 'editPost'}">${post.introduction}</c:if></textarea>

        <textarea id="article" class="post-edit-txt" placeholder="正文"><c:if test="${urlWhere == 'editPost'}">${post.article}</c:if></textarea>
    </div>
</div>