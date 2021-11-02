package design.princessdreamland.onlinemall.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import design.princessdreamland.onlinemall.entity.User;
import design.princessdreamland.onlinemall.mapper.UserMapper;
import design.princessdreamland.onlinemall.service.UserService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

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
    public User login(User user) throws Exception{
        user.setPassword(SecureUtil.md5(user.getPassword()));

        QueryWrapper<User> queryWrapper = new QueryWrapper<User>();
        queryWrapper.eq("account",user.getAccount());
        queryWrapper.eq("password",user.getPassword());

        User loginUser = this.getOne(queryWrapper);
        if (loginUser == null){
            throw new Exception("账号或者密码有误");
        }

        return loginUser;
    }

}
