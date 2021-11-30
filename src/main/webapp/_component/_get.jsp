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
    <c:if test="${urlWhere!='dynamic'}">
        <c:if test="${item.typeId!=5 or urlWhere=='console'}">
            <div class="post" data-postId="${item.postId}">
            <div class="post-Img-container">
                <c:if test="${item.topImg!=null}"><img class="lazy" data-src="../Img/${item.keyword}/${item.topImg}"></c:if>
            </div>
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
                <c:if test="${urlWhere == 'console'}">
                    <div class="post-txt-container-introduction">
                        <c:if test="${item.status==1}">状态：开放/标签：</c:if><c:if test="${item.status==0}">状态：隐藏/标签：</c:if><c:if test="${item.typeId==1}">文章</c:if><c:if test="${item.typeId==2}">项目</c:if><c:if test="${item.typeId==3}">笔记</c:if><c:if test="${item.typeId==4}">工具</c:if><c:if test="${item.typeId==5}">动态</c:if>/关键字：${item.keyword}
                    </div>
                    <div class="post-txt-container-console-container">
                        <div class="console-container-edit-button">
                            编辑
                        </div>
                        <c:if test="${item.status==0}">
                            <div class="console-container-set-status-button">
                                设为开放
                            </div>
                        </c:if>
                        <c:if test="${item.status==1}">
                            <div class="console-container-set-status-button">
                                设为隐藏
                            </div>
                        </c:if>
                        <div class="console-container-delete-button">
                            删除
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
        </c:if>
    </c:if>
    <c:if test="${urlWhere == 'dynamic'}">
        <div class="post" data-postId="${item.postId}">
            <div class="post-Img-container">
                <c:if test="${item.topImg!=null}"><img class="lazy" data-src="../Img/${item.keyword}/${item.topImg}"></c:if>
            </div>
            <div class="post-txt-container">
                <div class="post-txt-container-introduction">
                        ${item.article}
                </div>
                <div class="post-txt-container-datetime">
                        ${item.publishTime}
                </div>
            </div>
        </div>
    </c:if>
</c:forEach>