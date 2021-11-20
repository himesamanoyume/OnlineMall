<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>编辑个人信息</title>

	<style type="text/css">

		*{

			box-sizing: border-box;
		}

		html, body {
			width: 100%;
			height: 100%;
		}
		.input_item {
			display: flex;
			align-items: center;
			margin-bottom: 15px;
			justify-content: center;
		}

		.input_item input {
			width: 250px;
			height: 30px;
			line-height: 30px;
		}

		.input_label {
			width: 120px;
			text-align: right;
		}

		.preview_img {
			width:180px;
			height:180px;
			object-fit:cover;

		}

		.del_img {
			position:absolute;
			top:0;
			right:0;
			color:red;
			font-size:30px;
			font-weight:bold;
			cursor: pointer;
			line-height: 32px;
			display: none;
		}

		.img_box {
			width:180px;
			height:180px;
			position: relative;
			margin:10px;
		}

	</style>
	<style>
		@import "/css/MyIndexCSS.css";
		@import "/css/divSpace.css";
		@import "/css/divTips.css";
	</style>

	<script src="/js/jquery-3.5.1.min.js" type="text/javascript"></script>
	<script src="/js/Funcs.js" type="text/javascript"></script>

	<script type="text/javascript">
		window.onload=function(){

			$('#submit2').click(function(){
				var password = $('input[name=password]').val();
				var confirmPassword = $('input[name=confirmPassword]').val();

				password = password.trim();
				confirmPassword = confirmPassword.trim();

				if(password == ''){
					alert("密码不能为空");
					return;
				}
				if (password.length < 6){
					alert("密码强度不够");
					return;
				}
				if(confirmPassword == ''){
					alert("确认密码不能为空");
					return;
				}

				$.post('/user/savePass', {
					userId:${user.userId},
					password:password
				}, function(res){
					if(res && res.userId){
						alert('更新密码成功，请重新登陆')
						$.post('/user/logout',{
						},function (res){
							if (res){
								location.href = "/"
							}
						})
					}
				}).fail(function(res){
					alert(res.responseJSON.message)
				})

			})

			$('#submit').click(function(){
				var name = $('input[name=name]').val();
				var address = $('input[name=address]').val();

				name = name.trim();
				address = address.trim();

				if(name == ''){
					alert("昵称不能为空");
					return;
				}

				if(address == ''){
					alert("地址不能为空");
					return;
				}

				$.post('/user/saveInfo', {
					userId:${user.userId},
					name:name,
					address:address
				}, function(res){
					if(res && res.userId){
						alert('更新信息成功')
						location.href = "/view/editUser"
					}
				}).fail(function(res){
					alert(res.responseJSON.message)
				})

			})

			$('body').on('mouseover', '.img_box', function(){
				$(this).find('.del_img').css('display', 'block')
			})
			$('body').on('mouseleave', '.img_box', function(){
				$(this).find('.del_img').css('display', 'none')
			})

			$('body').on('click', '.del_img', function(){
				$(this).parent().remove()
			})
			LoginInfoFunc();
		}


	</script>

</head>
<body>
<c:set var="urlWhere" value="null"/>
<div id="top">
	<%@include file="component/top.jsp" %>

</div>

<div id="title">

	修改个人信息

</div>
<div style="width:100%;">



	<div style="width:1180px;min-height:100%;margin:0 auto;padding:60px 10px;">

		<div class="input_item">
			<div class="input_label">昵称：</div>
			<input class="topItem" name="name" type="text" value="${sessionScope.user.name}" />
		</div>

		<div class="input_item">
			<div class="input_label">地址：</div>
			<input class="topItem" name="address" type="text" value="${sessionScope.user.address}" />
		</div>


		<div class="input_item">
			<div class="input_label">新密码：</div>
			<input class="topItem" name="password" type="password" value="" placeholder="新密码不少于6位"/>
		</div>

		<div class="input_item">
			<div class="input_label">确认密码：</div>
			<input class="topItem" name="confirmPassword" type="password" value="" placeholder="请确认密码"/>
		</div>
		<div class="input_item">
			<button id="submit"  class="topItem">保存昵称和地址</button>
			<button id="submit2"  class="topItem">修改密码</button>
		</div>


	</div>

</div>

<%@include file="./component/divFooter.jsp" %>
</body>
</html>




