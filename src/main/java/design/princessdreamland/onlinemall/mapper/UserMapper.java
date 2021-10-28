package design.princessdreamland.onlinemall.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import design.princessdreamland.onlinemall.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserMapper extends BaseMapper<User> {

    @Select("select * from user where userId = #{id}")
    User queryById(Integer id);

    List<User> queryWithBooks();
}
