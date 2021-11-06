package design.princessdreamland.onlinemall.controller;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.ObjectUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import design.princessdreamland.onlinemall.entity.Book;
import design.princessdreamland.onlinemall.entity.User;
import design.princessdreamland.onlinemall.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/book")
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

    @PostMapping("/createBook")
    @ResponseBody
    public Book createBook(Book book, HttpSession session) {

        if (ObjectUtil.isNull(book)) {
            throw new RuntimeException("参数不能为空");
        }
        if (StrUtil.isEmpty(book.getName())) {
            throw new RuntimeException("参数不能为空");
        }
        if (ObjectUtil.isNull(book.getPrice())) {
            throw new RuntimeException("价格不能为空");
        }

        User user =(User)session.getAttribute("user");
        bookService.createBook(book, user.getUserId());


        return book;
    }
}
