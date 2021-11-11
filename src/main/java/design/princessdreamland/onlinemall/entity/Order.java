package design.princessdreamland.onlinemall.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 
 * @author NDZ
 * @version 2021-11-11
 */
@TableName("ord")
@Data
public class Order extends BaseEntity<Order> {
	
	@TableId(type = IdType.AUTO)
	private Integer ordId;
	
	/**
	 * 商品ID
	 */
	private Integer  bookId;
	@TableField(exist=false)
	private Book book;
	
	/**
	 * 买家ID
	 */
	private Integer buyerId;
	@TableField(exist = false)
	private User buyer;
	
	/**
	 * 卖家ID
	 */
	private Integer sellerId;
	@TableField(exist=false)
	private User seller;
	
	/**
	 * 价格
	 */
	private BigDecimal price;
	
	/**
	 * 购买数量
	 */
	private Integer amount;
	
	/**
	 * 订单总价
	 */
	private BigDecimal total;
	
	/**
	 * 订单状态
	 */
	private Integer status;
	
	/**
	 * 收货地址
	 */
	private String address;
	
	/**
	 * 运单号
	 */
	private String waybill;
	

}
