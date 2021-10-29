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
    <title>${name}</title>
    <style>
        @import "MyIndexCSS.css";
        @import "divSpace.css";
        @import "divTips.css";
    </style>
    <script src="MyIndexJS.js"></script>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
    </script>
</head>
<body>
<div id="top">
    <button type="button" id="topLogin" onclick="window.location.href = '/'">登录</button>
</div>
<div id="title">
    网上商城
</div>

<div id="divSpace" role="tablist">
    <a class="divSpaceButton">手机
        <div class="divSpaceButtonBar"></div>
    </a>
    <a class="divSpaceButton">电脑
        <div class="divSpaceButtonBar"></div>
    </a>
    <a class="divSpaceButton">大电视
        <div class="divSpaceButtonBar"></div>
    </a>
    <a class="divSpaceButton">日常用品
        <div class="divSpaceButtonBar"></div>
    </a>
    <a class="divSpaceButton">食品超市
        <div class="divSpaceButtonBar"></div>
    </a>
</div>

<div id="indexBackground">


    <c:forEach items="${bookList}" var="item">
        <div class="divTips">
            <div class="divTipsImg"></div>
            <div class="divTipsTitle">${item.name}</div>
            <div class="divPrice">
                <span class="spanPrice">${item.price}元</span>
            </div>
            <div class="divTipsAuthor">
                <span class="spanDes">作者：${item.author}</span>
            </div>
            <div class="divTipsCount">
                <span class="spanDes">数量：${item.amount}</span>
            </div>
            <div class="divTipsTxt">
                <span class="spanDes">描述：${item.txt}</span>
            </div>
        </div>
    </c:forEach>

    <c:forEach items="${phoneList}" var="item">
        <div class="divTips">
            <div class="divTipsImg"></div>
            <div class="divTipsTitle">${item.name}</div>
            <div class="divPrice">
                <span class="spanPrice">${item.price}元</span>
            </div>
            <div class="divTipsAuthor">
                <span class="spanDes">设计者：${item.designer}</span>
            </div>
            <div class="divTipsCount">
                <span class="spanDes">库存：${item.amount}</span>
            </div>
            <div class="divTipsTxt">
                <span class="spanDes">描述：${item.txt}</span>
            </div>
        </div>
    </c:forEach>

    <div class="divTips">
        <div class="divTipsImg"></div>
        <div class="divTipsTitle"><span>超级无敌超级无敌超级无敌超级无敌超级无敌超级无敌小氪金</span></div>
        <div class="divPrice">
            <span class="spanPrice">6480元</span>
        </div>
        <div class="divTipsAuthor">
            <span class="spanDes">作者：mhy</span>
        </div>
        <div class="divTipsCount">
            <span class="spanDes">数量：64800</span>
        </div>
        <div class="divTipsTxt">
            <span class="spanDes">描述：哥哥哥哥哥哥个哥哥钉钉v哈哈哈广告歌哥哥哥戈尔工545苟富贵苟富贵</span>
        </div>
    </div>
    <div class="divTips">
        <div class="divTipsImg"></div>
        <div class="divTipsTitle">月卡</div>
        <div class="divPrice">
            <span class="spanPrice">30元</span>
        </div>
    </div>
    <div class="divTips">
        <div class="divTipsImg"></div>
        <div class="divTipsTitle">60结晶</div>
        <div class="divPrice">
            <span class="spanPrice">6元</span>
        </div>
    </div>
    <div class="divTips">
        <div class="divTipsImg"></div>
        <div class="divTipsTitle">300结晶</div>
        <div class="divPrice">
            <span class="spanPrice">30元</span>
        </div>
    </div>
    <div class="divTips">
        <div class="divTipsImg"></div>
        <div class="divTipsTitle">980结晶</div>
        <div class="divPrice">
            <span class="spanPrice">98元</span>
        </div>
    </div>
    <div class="divTips">
        <div class="divTipsImg"></div>
        <div class="divTipsTitle">1980结晶</div>
        <div class="divPrice">
            <span class="spanPrice">198元</span>
        </div>
    </div>
    <div class="divTips">
        <div class="divTipsImg"></div>
        <div class="divTipsTitle">3280结晶</div>
        <div class="divPrice">
            <span class="spanPrice">328元</span>
        </div>
    </div>
    <div class="divTips">
        <div class="divTipsImg"></div>
        <div class="divTipsTitle">6480结晶</div>
        <div class="divPrice">
            <span class="spanPrice">648元</span>
        </div>
    </div>

</div>




<div id="divFooter">
    &nbsp;&nbsp;&nbsp;Copyright 2021©  &nbsp; @姫様の夢 &nbsp;&nbsp;&nbsp;
</div>
</body>

</html>

