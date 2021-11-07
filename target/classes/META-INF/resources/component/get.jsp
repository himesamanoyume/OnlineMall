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
<div id="indexBackground">
    <c:forEach items="${bookList}" var="item">
        <div class="divTips">
            <div class="divTipsImg" >
                <c:if test="${item.imgSrc!=null}">
                <img src="${item.imgSrc!=null?item.imgSrc:null}"/>
                </c:if>
            </div>
            <div class="divTipsTitle">
                <span class="spanTitle">${item.name}</span>
            </div>
            <div class="divPrice">
                <span class="spanPrice">${item.price}元</span>
            </div>
            <div class="divTipsAuthor">
                <span class="spanDes">作者：${item.author}</span>
            </div>

            <c:if test="${urlWhere != 'sellBookList'}">
                <div class="divTipsCount">
                    <span class="spanDes">页数：${item.amount}</span>
                </div>
                <div class="divTipsTxt">
                    <span class="spanDes">描述：${item.txt}</span>
                </div>
            </c:if>
            <c:if test="${sessionScope.user!=null and sessionScope.user.type == 1 and urlWhere == 'sellBookList'}">
                <div class="divTipsCount">
                    <span class="spanDes">库存：${item.stock}</span>
                </div>
<%--                <div class="divTipsTxt">--%>
<%--                    <span class="spanDes">描述：${item.txt}</span>--%>
<%--                </div>--%>
            </c:if>
        </div>
    </c:forEach>
</div>