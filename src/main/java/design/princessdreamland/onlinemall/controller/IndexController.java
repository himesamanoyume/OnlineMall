package design.princessdreamland.onlinemall.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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