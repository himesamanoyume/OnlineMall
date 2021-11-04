<%--
  Created by IntelliJ IDEA.
  User: 28583
  Date: 2021/11/2
  Time: 15:40:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="/js/jquery-3.5.1.min.js"></script>
    <script>
        $(document).ready(function (){
            $('#submit').click(function(){
                var account = $('input[name=account]').val();
                var password = $('input[name=password]').val();

                account = account.trim();
                password = password.trim();

                if(account == ''){
                    alert("手机号不能为空");
                    return;
                }
                if(!(/^1([3|4|5|7|8|9])\d{9}$/.test(account))){
                    alert('手机号不正确');
                    return
                }
                if(password == ''){
                    alert("密码不能为空");
                    return;
                }

                $.post('/user/login',{
                    account:account,
                    password:password
                },function(res){
                    if(res && res.userId){
                        location.href = "/view/index"
                    }else{
                        alert('登录失败')
                    }
                }).fail(function(res){
                    alert(res.responseJSON.message)
                })
            })
        })

    </script>
    <style>
        body{
            background: rgb(255,250,250);
        }
        .divLoginTip{
            width: 400px;
            height: 500px;
            justify-content: center;
            background: gray;

        }

    </style>
    <title>login</title>
</head>
<body>
<div style="width:300px;height:300px;background-color: white;z-index: 9;margin-left:50%;border-radius: 10px;padding:15px;">
    <div style="font-size:20px;font-weight:bold;width:100%;text-align: center;">登录</div>
    <div style="width:100%;height:1px;background-color: #CCC;margin:10px auto;"></div>

    <div style="width:100%;display: flex;margin-top:30px;line-height:30px;">
        <div style="width:80px;text-align:right;">
            账号：
        </div>

        <input type="text" name="account" placeholder="请输入手机号"/>
    </div>

    <div style="width:100%;display: flex; margin-top:30px;line-height:30px;">
        <div style="width:80px;text-align:right;">
            密码：
        </div>

        <input type="password" name="password" placeholder="请输入密码"/>
    </div>

    <div style="width:100%;display: flex; margin-top:30px;line-height:30px;">
        <div style="width:80px;text-align:right;"></div>
        <div style="flex:1;text-align: center;">
            <button style="width:60px;margin:0 auto;display: inline-block;" id="submit">确定</button>
        </div>
    </div>

    <div>
        <a href="/view/reg">注册</a>
    </div>

</div>

</body>
</html>
