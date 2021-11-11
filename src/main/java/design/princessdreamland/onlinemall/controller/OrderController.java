package design.princessdreamland.onlinemall.controller;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import design.princessdreamland.onlinemall.entity.Order;
import design.princessdreamland.onlinemall.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 订单控制器
 * @author NDZ
 * @version 2021-11-11
 */

@RestController
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;

	@PostMapping("/queryOrderPage")
	public IPage<Order> queryPage(Order order){
		return orderService.queryPage(order.getPage(), order);
	}
	
	@PostMapping("/queryOrderList")
	public List<Order> queryList(Order order){
		return orderService.queryList(order);
	}
	
	@PostMapping("/createOrder")
	public Order createOrder(Order order) {
		return orderService.createOrder(order);
	}
	
	@PostMapping("/queryUserOrderPage")
	public IPage<Order> queryUserOrderPage(Order order){
		return orderService.queryUserOrderPage(order.getPage(), order);
	}
	
	@PostMapping("/queryById")
	public Order queryById(Order order) {
		List<Order> orderList = orderService.queryList(order);
		if(CollUtil.isEmpty(orderList)) {
			return null;
		}else {
			return orderList.get(0);
		}
	}
	
	@PostMapping("/ship")
	public Order ship(Order order) {
		return orderService.ship(order);
	}
	
	@PostMapping("/receive")
	public Order receive(Order order) {
		return orderService.receive(order);
	}
	
}
