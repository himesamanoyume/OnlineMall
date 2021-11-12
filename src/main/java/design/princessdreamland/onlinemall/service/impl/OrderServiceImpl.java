package design.princessdreamland.onlinemall.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import design.princessdreamland.onlinemall.entity.Book;
import design.princessdreamland.onlinemall.entity.Order;
import design.princessdreamland.onlinemall.entity.User;
import design.princessdreamland.onlinemall.mapper.OrderMapper;
import design.princessdreamland.onlinemall.service.BookService;
import design.princessdreamland.onlinemall.service.OrderService;
import design.princessdreamland.onlinemall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order>
	implements OrderService {
	
	@Autowired
	private HttpSession session;
	@Autowired
	private UserService userService;
	@Autowired
	private BookService bookService;

	@Override
	public List<Order> queryList(Order order) {
		return baseMapper.queryList(order);
	}

	@Override
	public IPage<Order> queryPage(Page<Order> page, Order order) {
		return baseMapper.queryPage(page, order);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Order createOrder(Order order) {
		if(ObjectUtil.isNull(order.getBookId())) {
			throw new RuntimeException("商品ID不能为空");
		}
		if(ObjectUtil.isNull(order.getAmount()) || order.getAmount() <= 0) {
			throw new RuntimeException("购买数量必须大于0");
		}
		
		User buyer = (User)session.getAttribute("user");
		if(ObjectUtil.isNull(buyer)) {
			throw new RuntimeException("请先登录");
		}
		buyer = userService.getById(buyer.getUserId());
		if(ObjectUtil.isNull(buyer)) {
			throw new RuntimeException("用户不存在");
		}
		
		Book book = bookService.getById(order.getBookId());
		if(ObjectUtil.isNull(book)) {
			throw new RuntimeException("商品不存在");
		}
		if(order.getAmount() > book.getStock()) {
			throw new RuntimeException("库存不足");
		}
		
		
		Order newOrder = new Order();
		newOrder.setBookId(book.getBookId()); 
		newOrder.setBuyerId(buyer.getUserId());
		newOrder.setSellerId(book.getSellerId());
		newOrder.setPrice(book.getPrice());
		newOrder.setAmount(order.getAmount());
		newOrder.setTotal(newOrder.getPrice().multiply(new BigDecimal(order.getAmount())).setScale(2));
		newOrder.setStatus(1);
		newOrder.setAddress(buyer.getAddress());
		
		newOrder.setCreateUserId(buyer.getUserId());
		newOrder.setCreateTime(new Date());
		
		if(newOrder.getTotal().compareTo(buyer.getBalance()) > 0) {
			throw new RuntimeException("用户余额不足");
		}
		
		this.save(newOrder);
		
		buyer.setBalance(buyer.getBalance().subtract(newOrder.getTotal()).setScale(2));
		buyer.setUpdateUserId(buyer.getUserId());
		buyer.setUpdateTime(new Date());
		userService.updateById(buyer);
		
		book.setStock(book.getStock() - order.getAmount());
		book.setUpdateTime(new Date());
		bookService.updateById(book);
		
		return newOrder;
	}

	@Override
	public IPage<Order> queryUserOrderPage(Page<Order> page, Order order) {
		User user = (User)session.getAttribute("user");
		
		if( 0 == user.getType()) {
			order.setBuyerId(user.getUserId());
		}else if(1 == user.getType()) {
			order.setSellerId(user.getUserId());
		}
		
		return baseMapper.queryPage(page, order);
	}

	@Override
	public Order ship(Order order) {
		if(ObjectUtil.isNull(order.getOrdId())) {
			throw new RuntimeException("订单ID不能为空");
		}
		if(StrUtil.isEmpty(order.getWaybill())) {
			throw new RuntimeException("运单号不能为空");
		}
		
		User user = (User)session.getAttribute("user");
	
		QueryWrapper<Order> queryWrapper = new QueryWrapper<Order>();
		queryWrapper.eq("ord_id", order.getOrdId());
		queryWrapper.eq("seller_id", user.getUserId());
		queryWrapper.eq("status", 1);
		Order dbOrder = this.getOne(queryWrapper);
		
		if(ObjectUtil.isNull(dbOrder)) {
			throw new RuntimeException("订单信息不存在");
		}
		
		dbOrder.setWaybill(order.getWaybill());
		dbOrder.setStatus(2);
		dbOrder.setUpdateUserId(user.getUserId());
		dbOrder.setUpdateTime(new Date());
		
		this.updateById(dbOrder);
		
		return dbOrder;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Order receive(Order order) {
		if(ObjectUtil.isNull(order.getOrdId())) {
			throw new RuntimeException("订单ID不能为空");
		}
		
		User user = (User)session.getAttribute("user");
		
		QueryWrapper<Order> queryWrapper = new QueryWrapper<Order>();
		queryWrapper.eq("ord_id", order.getOrdId());
		queryWrapper.eq("buyer_id", user.getUserId());
		queryWrapper.eq("status", 2);
		Order dbOrder = this.getOne(queryWrapper);
		
		if(ObjectUtil.isNull(dbOrder)) {
			throw new RuntimeException("订单信息不存在");
		}
		
		dbOrder.setStatus(3);
		dbOrder.setUpdateUserId(user.getUserId());
		dbOrder.setUpdateTime(new Date());
		
		this.updateById(dbOrder);
		
		
		User seller = userService.getById(dbOrder.getSellerId());
		seller.setBalance(seller.getBalance().add(dbOrder.getTotal()).setScale(2));
		seller.setUpdateUserId(user.getUserId());
		seller.setUpdateTime(new Date());
		
		userService.updateById(seller);
		
		return dbOrder;
	}
	
	
	
}
