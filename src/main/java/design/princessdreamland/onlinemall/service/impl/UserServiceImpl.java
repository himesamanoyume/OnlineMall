package design.princessdreamland.onlinemall.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import design.princessdreamland.onlinemall.entity.User;
import design.princessdreamland.onlinemall.mapper.UserMapper;
import design.princessdreamland.onlinemall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Autowired
    private HttpSession session;

    @Override
    public List<User> queryList(User user) {
        return baseMapper.queryList(user);
    }

    @Override
    public IPage<User> queryPage(Page<User> page, User user) {
        return baseMapper.queryPage(page, user);
    }

    @Override
    public User createUser(User user) throws Exception{
        QueryWrapper<User> queryWrapper = new QueryWrapper<User>();
        queryWrapper.eq("account",user.getAccount());
        List<User> existsUserList = list(queryWrapper);
        if (CollUtil.isNotEmpty(existsUserList)){
            throw new Exception("账号已被注册");
        }
        this.save(user);
        return user;
    }

    @Override
    public User login(User user, HttpSession session) throws Exception{
        user.setPassword(SecureUtil.md5(user.getPassword()));

        QueryWrapper<User> queryWrapper = new QueryWrapper<User>();
        queryWrapper.eq("account",user.getAccount());
        queryWrapper.eq("password",user.getPassword());

        User loginUser = this.getOne(queryWrapper);
        if (loginUser == null){
            throw new Exception("账号或者密码有误");
        }
        session.setAttribute("user",loginUser);
        return loginUser;
    }

    @Override
    public User charge(Integer userId, BigDecimal chargeAmount, String adminPassword) {

        User user = this.getById(userId);
        if(ObjectUtil.isNull(user)) {
            throw new RuntimeException("用户不存在");
        }

        User admin = (User)session.getAttribute("user");
        admin = this.getById(admin.getUserId());

        if(!admin.getPassword().equals(SecureUtil.md5(adminPassword))) {
            throw new RuntimeException("管理员的密码不正确");
        }

        user.setBalance(user.getBalance().add(chargeAmount).setScale(2));
        user.setUpdateTime(new Date());
        user.setUpdateUserId(admin.getUserId());

        this.updateById(user);

        return user;
    }
}
