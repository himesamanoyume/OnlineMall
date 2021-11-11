package design.princessdreamland.onlinemall.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import design.princessdreamland.onlinemall.entity.Book;
import design.princessdreamland.onlinemall.entity.User;
import design.princessdreamland.onlinemall.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/view")
public class ViewController {

    @Autowired
    private BookService bookService;

    @GetMapping("/index")
    public String index(String type, String keyword, Model model, String currentPage){

        IPage<Book> bookPage = bookService.searchPage(type, keyword,currentPage);

        model.addAttribute("bookList",bookPage.getRecords());
        model.addAttribute("keyword",keyword);
        model.addAttribute("currentPage",bookPage.getCurrent());
        model.addAttribute("totalPages",bookPage.getPages());

        return "/index.jsp";
    }

    @GetMapping("/login")
    public String login(){
        return "/login.jsp";
    }

    @GetMapping("/reg")
    public String reg(){
        return "/reg.jsp";
    }

    @GetMapping("/sellerBookList")
    public String sellerBookList(String type, String keyword, String currentPage, Model model, HttpSession session,String status){
       User user = (User)session.getAttribute("user");

        IPage<Book> bookPage = bookService.searchPage(type, keyword, currentPage,user.getUserId(),status);

        model.addAttribute("bookList",bookPage.getRecords());
        model.addAttribute("keyword",keyword);
        model.addAttribute("currentPage",bookPage.getCurrent());
        model.addAttribute("totalPages",bookPage.getPages());
        model.addAttribute("status",status);

        return "/sellerBookList.jsp";
    }

    @GetMapping("/createBook")
    public String createBook() {
        return "/createBook.jsp";
    }

    @GetMapping("/bookDetail")
    public String bookDetail(String bookId,Model model) {
        Book book = bookService.queryById(bookId);
        model.addAttribute("book",book);

        return "/bookDetail.jsp";
    }

    @GetMapping("/adminBookList")
    public String adminBookList(String type, String keyword, String currentPage, Model model, HttpSession session,String status){
        User user = (User)session.getAttribute("user");
        if(2!=user.getType()){
            throw new RuntimeException("没有访问权限");
        }
        IPage<Book> bookPage = bookService.searchPage(type, keyword, currentPage,status);

        model.addAttribute("bookList",bookPage.getRecords());
        model.addAttribute("keyword",keyword);
        model.addAttribute("currentPage",bookPage.getCurrent());
        model.addAttribute("totalPages",bookPage.getPages());
        model.addAttribute("status",status);

        return "/adminBookList.jsp";
    }

    @GetMapping("/userList")
    public String userList() {


        return "/userList.jsp";
    }
}

