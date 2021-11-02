package design.princessdreamland.onlinemall.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import design.princessdreamland.onlinemall.entity.Book;
import design.princessdreamland.onlinemall.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class BookController {

    @Autowired
    private BookService bookService;

    @GetMapping("/queryBookList")
    @ResponseBody
    public List<Book> queryList(){
        Book book = new Book();
        return bookService.queryList(book);
    }

    @GetMapping("/queryBookPage")
    @ResponseBody
    public IPage<Book> queryPage(){
        Book book = new Book();

        Page<Book> page = new Page<Book>();
        page.setCurrent(1);
        page.setSize(10);

        return bookService.queryPage(page, book);
    }
}
