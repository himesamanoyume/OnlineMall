package design.princessdreamland.onlinemall.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import design.princessdreamland.onlinemall.entity.Book;
import design.princessdreamland.onlinemall.entity.User;
import design.princessdreamland.onlinemall.mapper.UserMapper;
import design.princessdreamland.onlinemall.service.BookService;
import design.princessdreamland.onlinemall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private BookService bookService;

    @Override
    public User queryById(Integer id){
        return userMapper.queryById(id);
    }

    @Override
    public List<User> queryWithBooks(){
        List<User> userList = list();

        if(CollUtil.isNotEmpty(userList)){
            for(User item : userList){
                QueryWrapper<Book> queryWrapper = new QueryWrapper<Book>();
                queryWrapper.eq("seller_id",item.getUser_id());
                List<Book> bookList = bookService.list(queryWrapper);
                item.setBookList(bookList);
            }
        }
        return userList;
    };
}
