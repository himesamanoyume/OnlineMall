package design.princessdreamland.onlinemall.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import design.princessdreamland.onlinemall.entity.User;

import java.util.List;

public interface UserService extends IService<User> {
    List<User> queryList(User user);

    IPage<User> queryPage(Page<User> page, User user);
}
