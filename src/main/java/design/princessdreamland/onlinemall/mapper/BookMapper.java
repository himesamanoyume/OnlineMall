package design.princessdreamland.onlinemall.mapper;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import design.princessdreamland.onlinemall.entity.Book;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BookMapper extends BaseMapper<Book> {
    List<Book> queryList(Book book,Integer currentPage,Integer pageSize);

    Integer insertBook(Book book);

    IPage<Book> queryPage(Page<Book> page, Book book);
}
