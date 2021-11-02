package design.princessdreamland.onlinemall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/view")
public class ViewController {

    @GetMapping("/index")
    public String index(){
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
}
