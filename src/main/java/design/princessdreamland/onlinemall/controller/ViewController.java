package design.princessdreamland.onlinemall.controller;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import design.princessdreamland.onlinemall.annotation.RequestLog;
import design.princessdreamland.onlinemall.entity.Book;
import design.princessdreamland.onlinemall.entity.User;
import design.princessdreamland.onlinemall.entity._Post;
import design.princessdreamland.onlinemall.service.BookService;
import design.princessdreamland.onlinemall.service._PostService;
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

    @Autowired
    private _PostService postService;

    @GetMapping("/index")
    @RequestLog(action="首页页面")
    public String index(String type, String keyword, Model model, String currentPage){

        IPage<Book> bookPage = bookService.searchPage(type, keyword,currentPage);

        model.addAttribute("bookList",bookPage.getRecords());
        model.addAttribute("keyword",keyword);
        model.addAttribute("currentPage",bookPage.getCurrent());
        model.addAttribute("totalPages",bookPage.getPages());

        return "/index.jsp";
    }

    @GetMapping("/_index")
    @RequestLog(action="首页页面")
    public String _index(String type,Model model, String currentPage){

        IPage<_Post> postPage = postService.searchPage(type,currentPage);
        model.addAttribute("postList",postPage.getRecords());
        model.addAttribute("currentPage",postPage.getCurrent());
        model.addAttribute("totalPages",postPage.getPages());

        return "/_jsp/_index.jsp";
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

    @GetMapping("/orderList")
    public String orderList() {
        return "/orderList.jsp";
    }

    @GetMapping("/editBook")
    public String editBook(String bookId, Model model, HttpSession session) {
        User user = (User)session.getAttribute("user");

        Book book = bookService.queryById(bookId);

        if(ObjectUtil.isNull(book)) {
            throw new RuntimeException("商品信息不存在");
        }

        if(book.getSellerId() != user.getUserId()) {
            throw new RuntimeException("没有编辑权限");
        }

        model.addAttribute("book", book);

        return "/editBook.jsp";
    }

    @GetMapping("/editUser")
    public String editUser( Model model,HttpSession session) {
        User user = (User)session.getAttribute("user");
        model.addAttribute("user",user);

        return "/editUser.jsp";
    }
}

