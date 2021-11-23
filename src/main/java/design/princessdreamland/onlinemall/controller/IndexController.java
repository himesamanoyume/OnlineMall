package design.princessdreamland.onlinemall.controller;
import com.baomidou.mybatisplus.core.metadata.IPage;
import design.princessdreamland.onlinemall.entity.Book;
import design.princessdreamland.onlinemall.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Controller
public class IndexController {

    @Autowired
    private BookService bookService;

    @GetMapping("/")
    public void index(HttpServletResponse response) throws IOException {
        response.sendRedirect("/view/_index");
    }


}