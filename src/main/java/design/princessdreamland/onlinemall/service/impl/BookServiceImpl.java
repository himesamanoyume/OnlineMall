package design.princessdreamland.onlinemall.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import design.princessdreamland.onlinemall.entity.Book;
import design.princessdreamland.onlinemall.mapper.BookMapper;
import design.princessdreamland.onlinemall.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class BookServiceImpl extends ServiceImpl<BookMapper, Book> implements BookService {
    @Autowired
    public BookMapper bookMapper;

    @Override
    public List<Book> queryList(Book book){
        return baseMapper.queryList(book);
    }

    @Override
    public IPage<Book> queryPage(Page<Book> page,Book book){
        return baseMapper.queryPage(page,book);
    }

    @Override
    public IPage<Book> searchPage(String type,String keyword,String currentPage){
        Book book = new Book();
        book.setStatus(2);

        if (StrUtil.isNotEmpty(type) && StrUtil.isNotEmpty(keyword)){
            if("1".equals(type)){
                book.setName(keyword);
            }else if("2".equals(type)){
                book.setPublisher(keyword);
            }else if ("3".equals(type)){
                book.setTxt(keyword);
            }
        }

        Page<Book> page = new Page<Book>();
        if (StrUtil.isNotEmpty(currentPage)){
            currentPage = "1";
        }

//        page.setCurrent(new Integer(currentPage));
//        page.setSize(4);



        return baseMapper.queryPage(page, book);
    }

    @Override
    public IPage<Book> searchPage(String type,String keyword,String currentPage,Integer sellerId,String status){
        Book book = new Book();
        book.setSellerId(sellerId);
        if (StrUtil.isNotEmpty(status)){
            book.setStatus(new Integer(status));
        }

        if (StrUtil.isNotEmpty(type) && StrUtil.isNotEmpty(keyword)){
            if ("1".equals(type)){
                book.setName(keyword);
            }else if ("2".equals(type)){
                book.setPublisher(keyword);
            }else if ("3".equals(type)){
                book.setTxt(keyword);
            }
        }

        Page<Book> page = new Page<Book>();
        if (StrUtil.isNotEmpty(currentPage)){
            currentPage = "1";
        }

//        page.setCurrent(new Integer(currentPage));
//        page.setSize(4);


        return baseMapper.queryPage(page, book);

    }

    @Override
    public Book createBook(Book book, Integer sellerId) {

        book.setSellerId(sellerId);
        book.setCreateUserId(sellerId);
        book.setCreateTime(new Date());
        this.save(book);

        return book;
    }
}
