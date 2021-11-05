package design.princessdreamland.onlinemall.controller;
import com.baomidou.mybatisplus.core.metadata.IPage;
import design.princessdreamland.onlinemall.entity.Book;
import design.princessdreamland.onlinemall.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @Autowired
    private BookService bookService;

    @GetMapping("/")
    public String index(String type, String keyword, String currentPage, Model model){

        IPage<Book> bookPage = bookService.searchPage(type,keyword,currentPage);
        model.addAttribute("bookList",bookPage.getRecords());
        model.addAttribute("currentPage",bookPage.getCurrent());
        model.addAttribute("totalPage",bookPage.getPages());
        model.addAttribute("keyword",keyword);

        return "/index.jsp";
    }
//
//    @GetMapping("/loginView")
//    public String login(){
//        return "/login.jsp";
//    }
//
//    @GetMapping("/regView")
//    public String reg(){
//        return "/reg.jsp";
//    }

}