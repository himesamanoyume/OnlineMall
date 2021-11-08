package design.princessdreamland.onlinemall.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import design.princessdreamland.onlinemall.entity.Book;
import design.princessdreamland.onlinemall.entity.BookImg;
import design.princessdreamland.onlinemall.mapper.BookImgMapper;
import design.princessdreamland.onlinemall.mapper.BookMapper;
import design.princessdreamland.onlinemall.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class BookServiceImpl extends ServiceImpl<BookMapper, Book> implements BookService {
    @Autowired
    public BookMapper bookMapper;

    @Autowired
    public BookImgMapper bookImgMapper;

    @Autowired
    private BookImgServiceImpl bookImgServiceImpl;

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
        book.setStatus(3);

        if (StrUtil.isNotEmpty(type) && StrUtil.isNotEmpty(keyword)){
            if("1".equals(type)){
                book.setName(keyword);
            }else if("2".equals(type)){
                book.setAuthor(keyword);
            }else if ("3".equals(type)){
                book.setTxt(keyword);
            }
        }

        Page<Book> page = new Page<Book>();
        if (StrUtil.isNotEmpty(currentPage)){
            page.setCurrent(new Integer(currentPage));
//            currentPage = "1";
        }

//        page.setSize(3);
        page.setSize(8);


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
                book.setAuthor(keyword);
            }else if ("3".equals(type)){
                book.setTxt(keyword);
            }
        }

        Page<Book> page = new Page<Book>();
        if (StrUtil.isNotEmpty(currentPage)){
            page.setCurrent(new Integer(currentPage));
//            currentPage = "1";
        }

//        page.setSize(3);
        page.setSize(8);


        return baseMapper.queryPage(page, book);

    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Book createBook(Book book, Integer sellerId) {

        book.setSellerId(sellerId);
        book.setCreateUserId(sellerId);
        book.setCreateTime(new Date());
        this.save(book);

        if (CollUtil.isNotEmpty(book.getSrcList())) {
            for (String src : book.getSrcList()) {
                BookImg bookImg = new BookImg();
                bookImg.setBookId(book.getBookId());
                bookImg.setImgSrc(src);
                bookImgServiceImpl.save(bookImg);
            }
        }

        return book;
    }

    @Override
    public Book queryById(String bookId) {
        return baseMapper.queryById(bookId);
    }
}
