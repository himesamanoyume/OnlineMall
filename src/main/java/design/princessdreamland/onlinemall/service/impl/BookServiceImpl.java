package design.princessdreamland.onlinemall.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import design.princessdreamland.onlinemall.entity.Book;
import design.princessdreamland.onlinemall.mapper.BookMapper;
import design.princessdreamland.onlinemall.service.BookService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl extends ServiceImpl<BookMapper, Book> implements BookService {
    @Override
    public List<Book> queryList(Book book){
        return baseMapper.queryList(book);
    }

    @Override
    public IPage<Book> queryPage(Page<Book> page,Book book){
        return baseMapper.queryPage(page,book);
    }
}
