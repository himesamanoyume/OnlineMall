package design.princessdreamland.onlinemall.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import design.princessdreamland.onlinemall.entity.User;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;

public interface UserService extends IService<User> {
    List<User> queryList(User user);

    IPage<User> queryPage(Page<User> page, User user);

    /**
     * 新增一个用户
     * @param user
     * @return
     */
    User createUser(User user) throws Exception;

    User saveInfo(User user) throws Exception;

    User savePass(User user) throws Exception;

    User login(User user, HttpSession session) throws Exception;

    User charge(Integer userId, BigDecimal chargeAmount, String adminPassword);

}
