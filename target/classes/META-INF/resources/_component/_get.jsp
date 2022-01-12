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

            <div class="post" data-postId="${item.postId}">
            <div class="post-Img-container">
                <c:if test="${item.topImg!=null}"><img class="lazy" data-src="./Img/${item.keyword}/${item.topImg}"></c:if>
            </div>
            <div class="post-txt-container">
                <div class="post-txt-container-title">
                        ${item.title}
                </div>
                <div class="post-txt-container-introduction">

                    <c:if test="${item.typeId!=5}">
                        <pre>${item.introduction}</pre>
                    </c:if>
                    <c:if test="${item.typeId==5}">
                        <pre>${item.article}</pre>
                    </c:if>

                </div>
                <div class="post-txt-container-datetime">
                        ${item.publishTime}
                </div>
                <c:if test="${urlWhere == 'console'}">
                    <div class="post-txt-container-introduction">
                        <pre>状态：<c:if test="${item.status==1}"><span class="highlight-green">开放</span></c:if><c:if test="${item.status==0}"><span class="highlight-red">隐藏</span></c:if></pre>
                        <pre>标签：<span class="highlight"><c:if test="${item.typeId==1}">文章</c:if><c:if test="${item.typeId==2}">项目</c:if><c:if test="${item.typeId==3}">笔记</c:if><c:if test="${item.typeId==4}">工具</c:if><c:if test="${item.typeId==5}">动态</c:if></span></pre>
                        <pre>关键字：<span class="highlight">${item.keyword}</span></pre>
                    </div>
                    <div class="post-txt-container-console-container">
                        <div class="console-container-edit-button">
                            编辑
                        </div>
                        <div class="console-container-edit-button">
                            查看
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