package design.princessdreamland.onlinemall.mapper;


import design.princessdreamland.onlinemall.entity.Book;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;


@Mapper
public interface BookMapper extends BaseMapper<Book> {

    List<Book> queryList(@Param("book") Book book);

    IPage<Book> queryPage(Page<Book> page, @Param("book")Book book);
}
