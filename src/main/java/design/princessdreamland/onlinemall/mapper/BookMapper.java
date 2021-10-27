package design.princessdreamland.onlinemall.mapper;


import design.princessdreamland.onlinemall.entity.Book;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BookMapper extends BaseMapper<Book> {
    List<Book> queryList(Book book);

    Integer insertBook(Book book);
}
