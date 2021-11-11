package design.princessdreamland.onlinemall.controller;

import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.ObjectUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import design.princessdreamland.onlinemall.entity.User;
import design.princessdreamland.onlinemall.service.UserService;
import design.princessdreamland.onlinemall.util.PhoneFormatCheckUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;


@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/queryPage")
    public IPage<User> queryPage(User user){
        Page<User> page = new Page<User>();
        return userService.queryPage(page,user);
    }

    @PostMapping("/reg")
    public User reg(User user) throws Exception{
        if (ObjectUtils.isNull(user)){
            throw new Exception("用户信息不能为空");
        }
        if (StrUtil.isEmpty(user.getAccount())){
            throw new Exception("手机号不能为空");
        }
        if (StrUtil.isEmpty(user.getPassword())){
            throw new Exception("密码不能为空");
        }
        if (user.getPassword().length()<6){
            throw new Exception("密码强度不够");
        }

        if (!PhoneFormatCheckUtils.isPhoneLegal(user.getAccount())){
            throw new Exception("手机号格式不正确");
        }

        user.setPassword(SecureUtil.md5(user.getPassword()));
        userService.createUser(user);
        return user;
    }

    @PostMapping("/logout")
    public Boolean logout(HttpSession session){
        session.removeAttribute("user");
        return true;
    }

    @PostMapping("/login")
    public User login(User user, HttpSession session) throws Exception{
        if (ObjectUtils.isNull(user)){
            throw new Exception("用户信息不能为空");
        }
        if (StrUtil.isEmpty(user.getAccount())){
            throw new Exception("手机号不能为空");
        }
        if (StrUtil.isEmpty(user.getPassword())){
            throw new Exception("密码不能为空");
        }
        if (!PhoneFormatCheckUtils.isPhoneLegal(user.getAccount())){
            throw new Exception("手机号格式不正确");
        }
        return userService.login(user,session);
    }
}
