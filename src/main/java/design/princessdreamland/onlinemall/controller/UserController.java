package design.princessdreamland.onlinemall.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import design.princessdreamland.onlinemall.entity.Book;
import design.princessdreamland.onlinemall.entity.User;
import design.princessdreamland.onlinemall.mapper.UserMapper;
import design.princessdreamland.onlinemall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/queryUserList")
    @ResponseBody
    public List<User> queryList(){
        User user = new User();
        return userService.queryList(user);
    }

    @GetMapping("/queryUserPage")
    @ResponseBody
    public IPage<User> queryPage(){
        User user = new User();

        Page<User> page = new Page<User>();
        page.setCurrent(1);
        page.setSize(10);

        return userService.queryPage(page, user);
    }
}
