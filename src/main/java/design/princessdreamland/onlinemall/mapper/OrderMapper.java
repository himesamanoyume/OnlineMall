package design.princessdreamland.onlinemall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import design.princessdreamland.onlinemall.entity.Order;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *@author NDZ
 *@version 2021-11-11
 */

@Mapper
public interface OrderMapper extends BaseMapper<Order> {
	/**
	 * 查询订单列表
	 * @param 
	 * @return List<Order>
	 */
	List<Order> queryList(@Param("order") Order order);
	
	/**
	 * 分页查询订单列表
	 * @param page
	 * @param order
	 * @return IPage<Order>
	 */
	IPage<Order> queryPage(Page<Order> page, @Param("order") Order order);
}
