package design.princessdreamland.onlinemall.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;

import design.princessdreamland.onlinemall.entity.Book;

import java.util.List;

public interface BookService extends IService<Book> {

    List<Book> queryList(Book book);

    IPage<Book> queryPage(Page<Book> page,Book book);

    IPage<Book> searchPage(String type,String keyword,String currentPage);

    IPage<Book> searchPage(String type, String keyword, String currentPage,Integer sellerId,String status);

    Book createBook(Book book,Integer sellerId);
}
