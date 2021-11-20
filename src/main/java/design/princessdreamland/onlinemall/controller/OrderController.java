/*
 * @Author: your name
 * @Date: 2021-11-12 11:30:26
 * @LastEditTime: 2021-11-20 16:36:20
 * @LastEditors: your name
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: \OnlineMall\src\main\java\design\princessdreamland\onlinemall\controller\OrderController.java
 */
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
