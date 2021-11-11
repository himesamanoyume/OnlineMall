<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增图书</title>

<style type="text/css">

*{
	margin:0;
	padding: 0;
	box-sizing: border-box;
}

html, body {
	width: 100%;
	height: 100%;
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

.input_item {
	display: flex;
	align-items: center;
	margin-bottom: 15px;
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

<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/common.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	$('#submit').click(function(){
		var name = $('#name').val()
		var price = $('#price').val()
		var author = $('#author').val()
		var amount = $('#amount').val()
		var txt = $('#txt').val()
		var publisher = $('#publisher').val()
		var publishDate = $('#publishDate').val()
		var stock = $('#stock').val()
		
		name = name.trim()
		price = parseFloat(price).toFixed(2)
		author = author.trim()
		amount = parseInt(amount)
		txt = txt.trim()
		publisher = publisher.trim()
		publishDate = publishDate.trim()
		stock = parseInt(stock)
		
		if(!name){
			alert('书名不能为空')
			return
		}
		if(price<=0){
			alert('价格必须为正数')
			return
		}
		
		var imgList = $('.preview_img')
		var srcList = []
		for(var i=0; i<imgList.length; i++){
			srcList.push(imgList.eq(i).attr('src'))
		}
		
		$.post('/book/editBook', {
			bookId: ${book.bookId},
			name: name,
			price: price,
			author: author,
			amount: amount,
			txt: txt,
			publisher: publisher,
			publishDate: publishDate,
			stock: stock,
			srcList: srcList,
		}, function(res){
			if(res && res.bookId){
				alert('新增图书成功')
			}
		}).fail(function(res){
			alert(res.responseJSON.message)
		})
	
	})
	
	
	$('#file').change(function(){
		
		console.log($(this)[0].files)
		
		var file = $(this)[0].files[0];
		var data = new FormData()
		
		data.append("file", file)
		
		$.ajax({
			url: '/uploadFile',
			data: data,
			type: 'POST',
			processData: false,
			contentType: false,
			success: function(res){
				var img = $(
						'<div class="img_box">' +
						'<img class="preview_img" src="' + res +'" />' +
						'<div class="del_img">x</div>' +
						'</div>'
				)
				
				$('#show_box').append(img)
			}
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
	
})
	
	
</script>

</head>
<body>
<div style="width:100%;height:100%;">
	
	<%@ include file="./component/title.jsp" %>
	
	<div style="width:1180px;min-height:100%;margin:0 auto;padding:60px 10px;
		background-color: #DDD;">
		
		<div style="font-size: 22px;font-weight: bold;margin-bottom: 30px;">编辑图书</div>
		
		<div class="input_item">
			<div class="input_label">书名：</div>
			<input id="name" type="text" value="${book.name}" />
		</div>
		
		<div class="input_item">
			<div class="input_label">价格：</div>
			<input id="price" type="number" value="${book.price}" />
		</div>
	
		<div class="input_item">
			<div class="input_label">作者：</div>
			<input id="author" type="text" value="${book.author}" />
		</div>
		
		<div class="input_item">
			<div class="input_label">总页数：</div>
			<input id="amount" type="number" value="${book.amount}" />
		</div>
		
		<div class="input_item">
			<div class="input_label">简介：</div>
			<textarea id="txt" style="width:250px;min-height: 100px;">${book.txt}</textarea>
		</div>
		
		<div class="input_item">
			<div class="input_label">出版社：</div>
			<input id="publisher" type="text" value="${book.publisher}" />
		</div>
		
		<div class="input_item">
			<div class="input_label">出版日期：</div>
			<input id="publishDate" type="date" value="${book.publishDate}" />
		</div>
		
		<div class="input_item">
			<div class="input_label">库存数量：</div>
			<input id="stock" type="text" value="${book.stock}" />
		</div>
		
		<div class="input_item">
			<div class="input_label">图片：</div>
			<input id="file" type="file" accept="image/*" />
		</div>
		
		<div id="show_box" style="width:100%;display: flex;align-content: flex-start;">
			<c:forEach items="${book.srcList}" var="item">
			<div class="img_box">
				<img class="preview_img" src="${item.imgSrc}" />
				<div class="del_img">x</div>
			</div>
			</c:forEach>
			
		</div>
		
	
		<button id="submit" style="margin-left: 130px;width:70px;height:26px;line-height: 26px;margin-top:30px;">保存</button>
	</div>

</div>
</body>
</html>




