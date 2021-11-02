package design.princessdreamland.onlinemall.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Controller
public class IndexController {

    @GetMapping("/")
    public String index(){
        return "/index.jsp";
    }

    @GetMapping("/loginView")
    public String login(){
        return "/login.jsp";
    }

    @GetMapping("/regView")
    public String reg(){
        return "/reg.jsp";
    }

}