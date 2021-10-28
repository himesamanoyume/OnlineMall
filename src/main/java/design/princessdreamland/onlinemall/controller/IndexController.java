package design.princessdreamland.onlinemall.controller;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import design.princessdreamland.onlinemall.entity.Book;
import design.princessdreamland.onlinemall.mapper.BookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class IndexController {

//    @Autowired
//    private PhoneService phoneService;
//    private BookService bookService;

    @Autowired
    private BookMapper bookMapper;

    @GetMapping("/")
    public String index(Model model){

        Book book = new Book();
//        book.setBookId(2);
//        book.setBookIds(Arrays.asList(1,2));
        Page<Book> page = new Page<Book>();
        page.setCurrent(1);
        page.setSize(2);
        IPage<Book> bookPage = bookMapper.queryPage(page,book);
        model.addAttribute("bookList",bookPage.getRecords());


//        List<Phone> phoneList = phoneService.list();
//        model.addAttribute("phoneList",phoneList);
        model.addAttribute("name","OnlineMall");
        return "/index.jsp";
    }

    @GetMapping("/insertBook")
    @ResponseBody
    public Integer insertBook(){
        Book book = new Book();
        book.setName("好书");
        book.setAmount(2000);
        book.setAuthor("烂裤裆");
        book.setPrice(new BigDecimal(19.00));
        book.setTxt("烂中之王");

        return bookMapper.insertBook(book);
    }

    @GetMapping("/queryBook")
    @ResponseBody
    public IPage<Book> queryBook(){
        Book book = new Book();

        Page<Book> page = new Page<Book>();
        page.setCurrent(1);
        page.setSize(3);
        IPage<Book> bookPage = bookMapper.queryPage(page,book);

        return bookPage;
    }


}