package design.princessdreamland.onlinemall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import design.princessdreamland.onlinemall.entity.Misc;
import design.princessdreamland.onlinemall.mapper.MiscMapper;
import design.princessdreamland.onlinemall.service.MiscService;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class MiscServiceImpl extends ServiceImpl<MiscMapper, Misc> implements MiscService {

//    @Autowired
//    private HttpSession session;

    @Override
    public List<Misc> queryList(Misc misc){
        return baseMapper.queryList(misc);
    }

    @Override
    public IPage<Misc> queryPage(Page<Misc> page, Misc misc){
        return baseMapper.queryPage(page,misc);
    }

    @Override
    public Misc queryById(String miscId){
        return baseMapper.queryById(miscId);
    }

}
