package design.princessdreamland.onlinemall.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import design.princessdreamland.onlinemall.entity.Order;

import java.util.List;

/**
 *@author NDZ
 *@version 2021-11-11
 */

public interface OrderService extends IService<Order> {
	
	/**
	 * 查询订单列表
	 * @param 
	 * @return List<Order>
	 */
	List<Order> queryList(Order order);
	
	/**
	 * 分页查询订单列表
	 * @param page
	 * @param order
	 * @return IPage<Order>
	 */
	IPage<Order> queryPage(Page<Order> page, Order order);
	
	/**
	 * 生成订单
	 * @param order
	 * @return
	 */
	Order createOrder(Order order);
	
	/**
	 * 分页查询用户订单列表
	 * @param page
	 * @param order
	 * @return IPage<Order>
	 */
	IPage<Order> queryUserOrderPage(Page<Order> page, Order order);
	
	/**
	 * 发货
	 * @param order
	 * @return
	 */
	Order ship(Order order);
	
	/**
	 * 收货
	 * @param order
	 * @return
	 */
	Order receive(Order order);
	
}
