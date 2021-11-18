package design.princessdreamland.onlinemall.controller;

import cn.hutool.core.util.ObjectUtil;
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
import java.math.BigDecimal;


@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/queryPage")
    public IPage<User> queryPage(User user){
        return userService.queryPage(user.getPage(),user);
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

    @PostMapping("/saveInfo")
    @ResponseBody
    public User saveInfo(User user) throws Exception{
        if (ObjectUtils.isNull(user.getName())){
            throw new Exception("用户名不能为空");
        }
        userService.saveInfo(user);
        return user;
    }

    @PostMapping("/savePass")
    @ResponseBody
    public User savePass(User user) throws Exception{
        if (StrUtil.isEmpty(user.getPassword())){
            throw new Exception("密码不能为空");
        }
        if (user.getPassword().length()<6){
            throw new Exception("密码强度不够");
        }
        user.setPassword(SecureUtil.md5(user.getPassword()));
        userService.savePass(user);
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

    @PostMapping("/queryById")
    public User queryById(String userId, HttpSession session) {
        User user = (User)session.getAttribute("user");
        if(ObjectUtil.isNull(user) || 2 != user.getType()) {
            throw new RuntimeException("没有访问权限");
        }
        return userService.getById(userId);
    }

    @PostMapping("/charge")
    public User charge(Integer userId, String chargeAmount, String adminPassword, HttpSession session) {
        User user = (User)session.getAttribute("user");
        if(ObjectUtil.isNull(user) || 2 != user.getType()) {
            throw new RuntimeException("没有访问权限");
        }
        return userService.charge(userId, new BigDecimal(chargeAmount), adminPassword);
    }
}
