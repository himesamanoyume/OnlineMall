package design.princessdreamland.onlinemall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import design.princessdreamland.onlinemall.entity.Order;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface OrderMapper extends BaseMapper<Order> {

	List<Order> queryList(@Param("order") Order order);

	IPage<Order> queryPage(Page<Order> page, @Param("order") Order order);
}
