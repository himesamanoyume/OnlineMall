<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DuangDuang</title>

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
	height: 122px;
	border-right: 1px solid #CCC; 
}

.row {
	display: flex;
	align-items: center;
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

<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/common.js"></script>

<script type="text/javascript">

function statusDic(status){
	if(status == 1){
		return "待发货"
	}else if(status == 2){
		return "已发货"
	}else if(status == 3){
		return "已收货"
	}
}

function queryData(current){
	var status = $('#searchStatus').val()
	var bookName = $('#keyword').val().trim()
	
	var userType = $('body').attr('data-userType')
	
	$.post('/order/queryUserOrderPage', {
		status: status,
		'book.name': bookName,
		'page.current': current,
		'page.size': 10,
	},function(res){
		if(res && res.records){
			$('#tableBody').empty()
			var index = 0;
			for(var item of res.records){
				index++;
				var ele = '<div class="row" data-ordId="' + item.ordId + '" >' 
				+ '<div class="cell" style="width:50px;">' + index + '</div>'
				+ '<div class="cell" style="width:150px;">'
				+ '	<img src="' + item.book.imgSrc +'" style="width:80px;height:80px;object-fit:cover;" />'
				+ '	<div>' + item.book.name + '</div>'
				+ '</div>'
				+ '<div class="cell" style="width:120px;">' + item.seller.account + '</div>'
				+ '<div class="cell" style="width:80px;">' + item.price.toFixed(2) + '</div>'
				+ '<div class="cell" style="width:80px;">' + item.amount + '</div>'
				+ '<div class="cell" style="width:80px;">' + item.total.toFixed(2) + '</div>'
				+ '<div class="cell" style="flex:1;">' + (item.address ? item.address : '')  + '</div>'
				+ '<div class="cell" style="width:120px;">' +  (item.waybill ? item.waybill : '') + '</div>'
				+ '<div class="cell" style="width:80px;">' +  statusDic(item.status) + '</div>'
				+ '<div class="cell" style="width:150px;display: flex;">';
				//+ '	<button style="height:26px;line-height: 26px;">确认收货</button>'
				
				if(userType==0){
					if(item.status == 2){
						ele += '	<button class="receiveButton" style="height:26px;line-height: 26px;">确认收货</button>'
					}	
				}
				
				if(userType==1){
					if(item.status == 1){
						ele += '	<button class="shipButton" style="height:26px;line-height: 26px;">发货</button>'
					}
				}
				
				ele = ele
				+ '</div>'
				+ '</div>';
				
				$('#tableBody').append($(ele))
			}
			
			
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
		
		
	}).fail(function(res){
		alert(res.responseJSON.message)
	})
	
	
}



$(document).ready(function(){
	queryData(1)
	
	$('#searchButton').click(function(){
		queryData(1)
	})
	
	$('#prePage').click(function(){
		var current = parseInt($('#currentPage').text()) - 1
		queryData(current)
	})
	
	$('#nextPage').click(function(){
		var current = parseInt($('#currentPage').text()) + 1
		queryData(current)
	})
		
	$('body').on('click', '.shipButton', function(){
		var ordId = $(this).parent().parent().attr('data-ordId')
		
		$.post('/order/queryById', {
			ordId: ordId,
		},function(res){
			
			if(res && res.ordId){
				$('.orderId').eq(0).text(res.ordId)
				$('.bookName').eq(0).text(res.book.name)
				$('.bookAmount').eq(0).text(res.amount)
				$('.address').eq(0).text(res.address)
				
				$('.mask').css('display', 'block')
				$('#shipBox').css('display', 'block')
				$('#receiveBox').css('display', 'none')
			}
			
		}).fail(function(res){
			alert(res.responseJSON.message)
		})
		
		
			
	})
	
	
	$('body').on('click', '.receiveButton', function(){
		var ordId = $(this).parent().parent().attr('data-ordId')
		
		$.post('/order/queryById', {
			ordId: ordId,
		},function(res){
			
			if(res && res.ordId){
				$('.orderId').eq(1).text(res.ordId)
				$('.bookName').eq(1).text(res.book.name)
				$('.bookAmount').eq(1).text(res.amount)
				$('.address').eq(1).text(res.address)
				
				$('.mask').css('display', 'block')
				$('#shipBox').css('display', 'none')
				$('#recevieBox').css('display', 'block')
			}
			
		}).fail(function(res){
			alert(res.responseJSON.message)
		})
		
		
			
	})
	
	$('#black_mask').click(function(){
		$('.mask').css('display', 'none')
	})
	
	$('#cancelShipButton').click(function(){
		$('.mask').css('display', 'none')
	})
	
	
	$('#shipButton').click(function(){
		var ordId = $('.orderId').eq(0).text()
		var waybill = $('#waybill').val().trim()
		
		if(waybill ==  ''){
			aler('运单号不能为空')
			return
		}
		
		$.post('/order/ship', {
			ordId: ordId,
			waybill: waybill,
		}, function(res){
			if(res && res.ordId){
				alert('发货成功')
				
				$('.mask').css('display', 'none')
				$('#waybill').val('')
				var current = parseInt($('#currentPage').text())
				queryData(current)
				
			}else{
				alert('发货失败')
			}
			
		}).fail(function(res){
			alert(res.responseJSON.message)
		})
	
	})
	
	
	$('#cancelReceiveButton').click(function(){
		$('.mask').css('display', 'none')
	})
	
	
	$('#receiveButton').click(function(){
		var ordId = $('.orderId').eq(1).text()
		
		$.post('/order/receive', {
			ordId: ordId,
		}, function(res){
			if(res && res.ordId){
				alert('收货成功')
				
				$('.mask').css('display', 'none')
				var current = parseInt($('#currentPage').text())
				queryData(current)
				
			}else{
				alert('收货失败')
			}
			
		}).fail(function(res){
			alert(res.responseJSON.message)
		})
	
	})
	
})
	
	
</script>

</head>
<body data-userType="${sessionScope.user.type}">
<div style="width:100%;height:100%;">
	
	<%@ include file="./component/title.jsp" %>
	
	<div style="width: 100%;height:50px;position: fixed;top:60px;z-index: 1;zoom:1;overflow: hidden;">
		<div style="width:1180px;height:50px;margin: 0 auto;display: flex;align-items: center;background-color:#DDD;">
			<select id="searchStatus" style="margin-left:20px;width:70px;height:30px;font-size: 16px;">
				<option value="">全部</option>
				<option value="1">待发货</option>
				<option value="2">已发货</option>
				<option value="3">已收货</option>
			</select>
			
			<div style="margin-left: 15px;">商品名称：</div>
			<input id="keyword" type="text" style="height:30px;line-height:30px;width:300px" />
			
			<button id="searchButton" style="width:50px;height:30px;margin-left:15px;">搜索</button>
			
		</div>
	</div>
	
	
	<div style="width:1180px;min-height:100%;margin:0 auto;padding:110px 10px;background-color: #DDD;">
	
		<div style="width:100%;height:35px;line-height: 35px;background-color: #006666;display: flex;color:white;text-align: center;"> 
			<div class="cell" style="width:50px;">序号</div>
			<div class="cell" style="width:150px;">商品</div>
			<div class="cell" style="width:120px;">卖家账号</div>
			<div class="cell" style="width:80px;">单价</div>
			<div class="cell" style="width:80px;">数量</div>
			<div class="cell" style="width:80px;">总金额</div>
			<div class="cell" style="flex:1;">收货地址</div>
			<div class="cell" style="width:120px;">运单号</div>
			<div class="cell" style="width:80px;">订单状态</div>
			<div class="cell" style="width:150px;">操作</div>
		</div>
		
		<div id="tableBody" style="width:100%;line-height: 32px;text-align: center;">
			<div class="row">
				<div class="cell" style="width:50px;">1</div>
				<div class="cell" style="width:150px;">
					<img src="/img/redStar.jpg" style="width:80px;height:80px;object-fit:cover;" />
					<div>红星照耀中国</div>
				</div>
				<div class="cell" style="width:120px;">卖家账号</div>
				<div class="cell" style="width:80px;">单价</div>
				<div class="cell" style="width:80px;">数量</div>
				<div class="cell" style="width:80px;">总金额</div>
				<div class="cell" style="flex:1;">收货地址</div>
				<div class="cell" style="width:120px;">运单号</div>
				<div class="cell" style="width:80px;">订单状态</div>
				<div class="cell" style="width:150px;display: flex;">
					<button style="height:26px;line-height: 26px;">确认收货</button>
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
			<div id="black_mask" style="width:100%;height:100%;position: absolute;top:1;left:0;background-color: black;opacity: 0.3;z-index: 1000"></div>
			
			<div id="shipBox" style="width:500px;height:280px;background-color: white;z-index: 1001;padding: 10px;">
				<div style="margin:10px auto;text-align: center;font-size: 20px;font-weight: bold;">发货</div>
				<div style="width:90%;margin:0 auto;height:1px;background-color: #999;" ></div>
			
				<div style="width:100%;display: flex;margin-top:10px;">
					<div class="item_label">订单ID：</div>
					<div class="orderId"></div>
				</div>
				
				<div style="width:100%;display: flex;margin-top:10px;">
					<div class="item_label">商品名称：</div>
					<div class="bookName"></div>
				</div>
				
				<div style="width:100%;display: flex;margin-top:10px;">
					<div class="item_label">商品数量：</div>
					<div class="bookAmount"></div>
				</div>
				
				<div style="width:100%;display: flex;margin-top:10px;">
					<div class="item_label">收货地址：</div>
					<div class="address"></div>
				</div>
				
				<div style="width:100%;display: flex;margin-top:10px;">
					<div class="item_label">运单号：</div>
					<input id="waybill" type="text" style="width:150px;height:30px;line-height: 30px;" />
				</div>
				
				<div style="width:100%;display: flex;margin-top:18px;justify-content: center;">
					<button id="cancelShipButton" style="width:80px;height:26px;line-height: 26px;">取消</button>
					<button id="shipButton" style="width:80px;height:26px;line-height: 26px;margin-left:25px;">确认发货</button>
				</div>
			
			</div>
			
			
			
			<div id="receiveBox" style="width:500px;height:280px;background-color: white;z-index: 1001;padding: 10px;">
				<div style="margin:10px auto;text-align: center;font-size: 20px;font-weight: bold;">收货</div>
				<div style="width:90%;margin:0 auto;height:1px;background-color: #999;" ></div>
			
				<div style="width:100%;display: flex;margin-top:10px;">
					<div class="item_label">订单ID：</div>
					<div class="orderId"></div>
				</div>
				
				<div style="width:100%;display: flex;margin-top:10px;">
					<div class="item_label">商品名称：</div>
					<div class="bookName"></div>
				</div>
				
				<div style="width:100%;display: flex;margin-top:10px;">
					<div class="item_label">商品数量：</div>
					<div class="bookAmount"></div>
				</div>
				
				<div style="width:100%;display: flex;margin-top:10px;">
					<div class="item_label">收货地址：</div>
					<div class="address"></div>
				</div>
				
				
				<div style="width:100%;display: flex;margin-top:18px;justify-content: center;">
					<button id="cancelReceiveButton" style="width:80px;height:26px;line-height: 26px;">取消</button>
					<button id="receiveButton" style="width:80px;height:26px;line-height: 26px;margin-left:25px;">确认收货</button>
				</div>
			
			</div>
		
		
		</div>
	</div>


</div>
</body>
</html>




