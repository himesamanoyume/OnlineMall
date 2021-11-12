package design.princessdreamland.onlinemall.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import design.princessdreamland.onlinemall.entity.Order;

import java.util.List;

public interface OrderService extends IService<Order> {

	List<Order> queryList(Order order);

	IPage<Order> queryPage(Page<Order> page, Order order);

	Order createOrder(Order order);

	IPage<Order> queryUserOrderPage(Page<Order> page, Order order);

	Order ship(Order order);

	Order receive(Order order);
	
}
