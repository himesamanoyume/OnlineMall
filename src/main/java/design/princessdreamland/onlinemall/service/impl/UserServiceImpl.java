package design.princessdreamland.onlinemall.service.impl;

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

}
