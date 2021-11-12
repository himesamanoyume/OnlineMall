<%--
  Created by IntelliJ IDEA.
  User: 28583
  Date: 2021/11/4
  Time: 19:59:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        @import "/css/MyIndexCSS.css";
        @import "/css/divSpace.css";
        @import "/css/divTips.css";
    </style>

    <script src="/js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script src="/js/Funcs.js" type="text/javascript"></script>
    <script>
        window.onload=function(){
            StockFunc();
            LoginInfoFunc();
            $('#submitCheck').click(function () {
                $.post('/book/commitBook', {
                    bookId:${book.bookId}
                }, function (res) {
                    if (res && res.bookId) {
                        alert("提交审核成功")
                        location.reload();
                    } else {
                        alert("失败")
                    }
                }).fail(function (res) {
                    alert(res.responseJSON.message)

                })
            });
            $('#shelve').click(function () {
                $.post('/book/shelveBook', {
                    bookId:${book.bookId}
                }, function (res) {
                    if (res && res.bookId) {
                        alert("下架成功")
                        location.reload();
                    } else {
                        alert("失败")
                    }
                }).fail(function (res) {
                    alert(res.responseJSON.message)

                })
            });
            $('#shelves').click(function () {
                $.post('/book/shelvesBook', {
                    bookId:${book.bookId}
                }, function (res) {
                    if (res && res.bookId) {
                        alert("上架成功")
                        location.reload();
                    } else {
                        alert("失败")
                    }
                }).fail(function (res) {
                    alert(res.responseJSON.message)

                })
            });
            $('#checkOK').click(function () {
                $.post('/book/checkBook', {
                    bookId:${book.bookId},
                    status:3
                }, function (res) {
                    if (res && res.bookId) {
                        alert("审核通过成功")
                        location.reload();
                    } else {
                        alert("失败")
                    }
                }).fail(function (res) {
                    alert(res.responseJSON.message)

                })
            });
            $('#checkNoOK').click(function () {
                $.post('/book/checkBook', {
                    bookId:${book.bookId},
                    status:1
                }, function (res) {
                    if (res && res.bookId) {
                        alert("审核不通过成功")
                        location.reload();
                    } else {
                        alert("失败")
                    }
                }).fail(function (res) {
                    alert(res.responseJSON.message)

                })
            });
            $('#buyBotton').click(function(){
                var bookId = $('#title').attr('data-bookId')
                var amount = parseInt($('#count').val())

                $.post('/order/createOrder', {
                    bookId: bookId,
                    amount: amount
                }, function(res){
                    if(res && res.ordId){
                        alert('生成订单成功')
                        location.href = "/view/orderList"
                    }else{
                        alert('生成订单失败')
                    }


                }).fail(function(res){
                    alert(res.responseJSON.message)
                })


            })

            $('#edit').click(function(){
                location.href = "/view/editBook?bookId=${book.bookId}"
            })
        }
    </script>

</head>
<body>
<c:set var="urlWhere" value="null"/>
<div id="top">
    <%@include file="component/top.jsp" %>

</div>

<div id="title" data-bookId="${book.bookId}">

    ${book.name}

</div>
<div>
    <div class="detailInfo">书名</div>${book.name}
</div>
<div>
    <div class="detailInfo">作者</div>${book.author}
</div>
<div>
    <div class="detailInfo">出版日期</div>${book.publishTime}
</div>
<div>
    <div class="detailInfo">价格</div><span id="price">${book.price}</span>
</div>
<div>
    <div class="detailInfo">页数</div>${book.amount}
</div>
<div>
    <div class="detailInfo">简介</div>${book.txt}
</div>



<c:if test="${sessionScope.user==null || sessionScope.user.type==0}">
    <div>
        <div class="detailInfo">购买数量</div><input id="count" type="number" value="1">
    </div>
    <div>
        <div class="detailInfo">库存</div><span id="stock">${book.stock}</span>
    </div>
    <div>
        <div class="detailInfo">总额</div><span id="money">${book.price}</span>
    </div>
    <button class="topItem" id="buyBotton">确认购买</button>
</c:if>
<c:if test="${sessionScope.user!=null}">
    <c:if test="${book.status==1}">
        <div class="detailInfo">
            <span class="spanDes">未提交</span>
        </div>
    </c:if>
    <c:if test="${book.status==2}">
        <div class="detailInfo">
            <span class="spanDes">未审核</span>
        </div>
    </c:if>
    <c:if test="${book.status==3}">
        <div class="detailInfo">
            <span class="spanDes">上架</span>
        </div>
    </c:if>
    <c:if test="${book.status==4}">
        <div class="detailInfo">
            <span class="spanDes">下架</span>
        </div>
    </c:if>

    <c:if test="${sessionScope.user!=null && sessionScope.user.type ==1}">
        <button id="edit" class="topItem">编辑</button>
        <c:if test="${book.status ==1}">
            <button class="topItem" id="submitCheck">提交审核</button>
        </c:if>
        <c:if test="${book.status ==3}">
        <button class="topItem" id="shelve">下架</button>
        </c:if>
        <c:if test="${book.status ==4}">
        <button class="topItem" id="shelves">上架</button>
        </c:if>
    </c:if>
    <c:if test="${sessionScope.user!=null && sessionScope.user.type ==2}">
        <c:if test="${book.status ==2}">
            <button class="topItem" id="checkOK">审核通过</button>
            <button class="topItem" id="checkNoOK">审核不通过</button>
        </c:if>
    </c:if>
</c:if>
<div class="divLine">
<div id="indexBackground">
        <c:forEach items="${book.srcList}" var="item">
            <img src="${item.imgSrc}"/>

        </c:forEach>

    </div>
</div>



<div id="divFooter">
    &nbsp;&nbsp;&nbsp;Copyright 2021©  &nbsp; @姫様の夢 &nbsp;&nbsp;&nbsp;
</div>
</body>
</html>
