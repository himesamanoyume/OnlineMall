package design.princessdreamland.onlinemall.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
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
    @Autowired
    private UserMapper userMapper;

    @GetMapping("/queryAllUser")
    @ResponseBody
    public List<User> queryAll(){

        return userService.list();
    }

    @GetMapping("/queryOneUser")
    @ResponseBody
    public User queryOneUser(){

        return userMapper.queryById(1);
    }

    @GetMapping("/insertOneUser")
    @ResponseBody
    public User insertOneUser(){
        User user = new User();
        user.setAccount("19912341234");
        user.setPassword("654321");
        user.setName("test3");
        user.setAge(23);
        user.setSex(1);
        user.setType(0);

        userService.save(user);
        return user;
    }

    @GetMapping("/updateOneUser")
    @ResponseBody
    public User updateOneUser(){
        User user = new User();
        user.setUser_id(3);
        user.setName("test4");

        userService.updateById(user);
        return user;
    }

    @GetMapping("/deleteOneUser")
    @ResponseBody
    public Boolean deleteOneUser(){

        return userService.removeById(3);
    }

    @GetMapping("/queryUser")
    @ResponseBody
    public List<User> queryUser() {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
//        queryWrapper.eq("account","test");  //=
//        queryWrapper.lt("age",25); //<
//        queryWrapper.or();
//        queryWrapper.like("account","test"); //包含的都查出来
//        queryWrapper.likeLeft("account","2");//类似通配符
//        queryWrapper.between("age",20,24);
        queryWrapper.ne("age", 21);//!=

        return userService.list(queryWrapper);
    }

    @GetMapping("/queryWithBooks")
    @ResponseBody
    public List<User> queryWithBooks(){
        return userService.queryWithBooks();
    }

}
