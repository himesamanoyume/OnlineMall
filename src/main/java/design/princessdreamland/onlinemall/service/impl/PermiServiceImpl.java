package design.princessdreamland.onlinemall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import design.princessdreamland.onlinemall.entity.Permi;
import design.princessdreamland.onlinemall.mapper.PermiMapper;
import design.princessdreamland.onlinemall.service.PermiService;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class PermiServiceImpl extends ServiceImpl<PermiMapper, Permi> implements PermiService {

//    @Autowired
//    private HttpSession session;

    @Override
    public List<Permi> queryList(Permi permi){
        return baseMapper.queryList(permi);
    }

    @Override
    public IPage<Permi> queryPage(Page<Permi> page, Permi permi){
        return baseMapper.queryPage(page,permi);
    }

    @Override
    public Permi login(Permi permi, HttpSession session) throws Exception{

        QueryWrapper<Permi> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("password",permi.getPassword());

        Permi loginUser = this.getOne(queryWrapper);
        if (loginUser == null){
            throw new Exception("密码有误");
        }
        session.setAttribute("permi",loginUser);
        return loginUser;
    }
}
