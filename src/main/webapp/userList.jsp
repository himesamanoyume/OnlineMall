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
    <title>mall</title>
    <style>
        @import "/css/MyIndexCSS.css";
        @import "/css/divSpace.css";
        @import "/css/divTips.css";

        .mul_line_overflow {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
        }

        .menu_item {
            margin-top:5px;
            margin-bottom: 15px;
            cursor: pointer;
        }

        .top_menu {
            margin-right:25px;
            color: #333;
            cursor: pointer;
        }

        .cell {
            border-right: 1px solid #CCC;
        }

        .row {
            display: flex;
            width: 100%;
            border-bottom: 1px solid gray;
            padding: 3px 0;
        }

        .row:nth-child(odd) {
            background-color: #ccffcc;
        }

        .row:nth-child(even) {
            background-color: #99ccff;
        }

        .mask {
            width: 100%;
            height: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 999;
        }

        .item_label {
            width:160px;
            text-align: right;
        }

    </style>
    <script src="/js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script src="/js/Funcs.js" type="text/javascript"></script>
    <script src="/js/userList.js" type="text/javascript"></script>
    <script>
        function UserListQueryData(pageNumber){
            var type = $('#searchStatus').val()
            var keyword = $('#keyword').val().trim()

            var account = ""
            var name = ""

            if(type == 1){
                account = keyword
            }else{
                name = keyword
            }
            $.post('/user/queryPage',{
                account:account,
                name: name,
                'page.current': pageNumber,
                'page.size': 12,

            },function (res){
                $('#tableBody').empty();

                var index =0;
                for(var item of res.records){
                    index++
                    var ele = '<div class="row" data-userId="' + item.userId + '" >'
                        + '<div class="cell" style="width:50px;">' + index + '</div>'
                        + '<div class="cell" style="width:150px;">' + item.account + '</div>'
                        + '<div class="cell" style="width:150px;">' + (item.name ? item.name : '') + '</div>'
                        + '<div class="cell" style="width:100px;">' + typeDic(item.type) + '</div>'
                        + '<div class="cell" style="width:100px;">' + item.balance.toFixed(2) + '</div>'
                        + '<div class="cell" style="flex:1;">' + (item.address ? item.address : '') + '</div>'
                        + '<div class="cell" style="width:250px;display: flex;">'
                        + '		<button class="charge">充值</button>'
                        + '</div>'
                        + '</div>'
                    $('#tableBody').append($(ele));
                }

                $('#currentPage').text(res.current)

                if(res.current > 1){
                    $('#prePage').css('display', 'block')
                }else{
                    $('#prePage').css('display', 'none')
                }

                if(res.current < res.pages){
                    $('#nextPage').css('display', 'block')
                }else{
                    $('#nextPage').css('display', 'none')
                }
            })
        }
        function typeDic(type){
            if(type == 0){
                return "买家"
            }else if(type == 1){
                return "卖家"
            }else if(type == 2){
                return "管理员"
            }
        }
        window.onload=function(){
            LoginInfoFunc();
            PageUserListFunc();
            UserListSearchButtonFunc();
            UserListQueryData(1);
            $('body').on('click', '.charge', function(){
                var userId = $(this).parent().parent().attr('data-userId')

                $.post('/user/queryById', {
                    userId: userId,
                }, function(res){
                    if(res && res.userId){
                        $('#userAccount').text(res.account)
                        $('#userBalance').text(res.balance.toFixed(2))
                        $('.mask').attr('data-userId', res.userId)
                        $('.mask').css('display', 'block')
                    }
                })



            })

            $('#black_mask').click(function(){
                $('.mask').css('display', 'none')
            })

            $('#cancelButton').click(function(){
                $('.mask').css('display', 'none')
            })

            $('#chargeButton').click(function(){
                var userId = $('.mask').attr('data-userId')
                var chargeAmount = $('#chargeAmount').val()
                var adminPassword = $('#adminPassword').val()

                chargeAmount = parseFloat(chargeAmount).toFixed(2)

                $.post('/user/charge', {
                    userId: userId,
                    chargeAmount: chargeAmount,
                    adminPassword: adminPassword,
                }, function(res){
                    if(res && res.userId){
                        $('.mask').css('display', 'none')
                        $('#chargeAmount').val('')
                        $('#adminPassword').val('')
                        var current = parseInt($('#currentPage').text())
                        alert('充值成功')
                        UserListQueryData(current);
                    }else{
                        alert('充值失败')
                    }

                }).fail(function(res){
                    alert(res.responseJSON.message)
                })

            })
        }
    </script>
</head>
<body>
<c:set var="urlWhere" value="userList"/>
<div id="top">
    <%@include file="component/top.jsp" %>
</div>
<div id="title">

        用户列表

</div>

<div style="width:1180px;min-height:100%;margin:0 auto;padding:110px 10px;background-color: #DDD;">

    <div style="width:100%;height:35px;line-height: 35px;background-color: #006666;display: flex;color:white;text-align: center;">
        <div class="cell" style="width:50px;">序号</div>
        <div class="cell" style="width:150px;">账号</div>
        <div class="cell" style="width:150px;">姓名</div>
        <div class="cell" style="width:100px;">类别</div>
        <div class="cell" style="width:100px;">余额</div>
        <div class="cell" style="flex:1;">地址</div>
        <div class="cell" style="width:250px;">操作</div>
    </div>

    <div id="tableBody" style="width:100%;line-height: 32px;text-align: center;">
        <div class="row">
            <div class="cell" style="width:50px;">1</div>
            <div class="cell" style="width:150px;">admin</div>
            <div class="cell" style="width:150px;">admin</div>
            <div class="cell" style="width:100px;">管理员</div>
            <div class="cell" style="width:100px;">0.00</div>
            <div class="cell" style="flex:1;">柳州市</div>
            <div class="cell" style="width:250px;display: flex;">
                <button>充值</button>
            </div>
        </div>

    </div>


    <div style="width: 100%;height:40px;line-height: 40px;display: flex;align-items: center;margin-top:20px;">
        <div style="flex:1;"></div>

        <button id="prePage">上一页</button>

        <div style="margin-left:8px;">第<span id="currentPage">1</span>页</div>

        <button id="nextPage" style="margin-left:8px;">下一页</button>

    </div>

</div>

<div class="mask" style="display: none;" data-userId="">
    <div style="width:100%;height:100%;position: relative;display: flex;justify-content: center;align-items: center;">
        <div id="black_mask" style="width:100%;height:100%;position: absolute;top:1px;left:0;background-color: black;opacity: 0.3;z-index: 1000"></div>

        <div style="width:500px;height:280px;background-color: white;z-index: 1001;padding: 10px;">
            <div style="margin:10px auto;text-align: center;font-size: 20px;font-weight: bold;">充值</div>
            <div style="width:90%;margin:0 auto;height:1px;background-color: #999;" ></div>

            <div style="width:100%;display: flex;margin-top:10px;">
                <div class="item_label">当前用户账号：</div>
                <div id="userAccount"></div>
            </div>

            <div style="width:100%;display: flex;margin-top:10px;">
                <div class="item_label">当前用户余额：</div>
                <div>￥<span id="userBalance">0.00</span></div>
            </div>

            <div style="width:100%;display: flex;margin-top:10px;">
                <div class="item_label">充值金额：</div>
                <input id="chargeAmount" type="number" style="width:150px;height:30px;line-height: 30px;" />
            </div>

            <div style="width:100%;display: flex;margin-top:10px;">
                <div class="item_label">管理员密码：</div>
                <input id="adminPassword" type="password" style="width:150px;height:30px;line-height: 30px;" />
            </div>

            <div style="width:100%;display: flex;margin-top:18px;justify-content: center;">
                <button id="cancelButton" style="width:80px;height:26px;line-height: 26px;">取消</button>
                <button id="chargeButton" style="width:80px;height:26px;line-height: 26px;margin-left:25px;">确认充值</button>
            </div>

        </div>


    </div>
</div>

<%@include file="./component/divFooter.jsp" %>
</body>

</html>

