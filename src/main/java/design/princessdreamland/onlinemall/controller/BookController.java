package design.princessdreamland.onlinemall.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.ObjectUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import design.princessdreamland.onlinemall.entity.Book;
import design.princessdreamland.onlinemall.entity.BookImg;
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
@ResponseBody
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;

    @GetMapping("/queryBookList")
    public List<Book> queryList(){
        Book book = new Book();
        return bookService.queryList(book);
    }

    @GetMapping("/queryBookPage")
    public IPage<Book> queryPage(){
        Book book = new Book();

        Page<Book> page = new Page<Book>();
        page.setCurrent(1);
        page.setSize(10);

        return bookService.queryPage(page, book);
    }

    @PostMapping("/createBook")
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

    @PostMapping("/commitBook")
    public Book commitBook(String bookId,HttpSession session){
        User user = (User)session.getAttribute("user");
        return bookService.commitBook(bookId,user.getUserId());
    }

    @PostMapping("/shelveBook")
    public Book shelveBook(String bookId,HttpSession session){
        User user = (User)session.getAttribute("user");
        return bookService.shelveBook(bookId,user.getUserId());
    }

    @PostMapping("/shelvesBook")
    public Book shelvesBook(String bookId,HttpSession session){
        User user = (User)session.getAttribute("user");
        return bookService.shelvesBook(bookId,user.getUserId());
    }

    @PostMapping("/checkBook")
    public Book checkOkBook(String bookId,String status,HttpSession session){
        User user = (User)session.getAttribute("user");
        if (2!=user.getType()){
            throw new RuntimeException("没有操作权限");
        }
        return bookService.checkBook(bookId,status);
    }

}
