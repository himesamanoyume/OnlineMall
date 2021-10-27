package design.princessdreamland.onlinemall.service;

import com.baomidou.mybatisplus.extension.service.IService;
import design.princessdreamland.onlinemall.entity.User;

import java.util.List;

public interface UserService extends IService<User> {
    User queryById(Integer id);
}
