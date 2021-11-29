package design.princessdreamland.onlinemall.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import design.princessdreamland.onlinemall.entity.PostImg;
import design.princessdreamland.onlinemall.mapper.PostImgMapper;
import design.princessdreamland.onlinemall.service.PostImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Service
public class PostImgServiceImpl extends ServiceImpl<PostImgMapper, PostImg>
        implements PostImgService {

    @Autowired
    private HttpSession session;

    @Override
    public List<PostImg> queryList(PostImg postImg){
        return baseMapper.queryList(postImg);
    }

    @Override
    public IPage<PostImg> queryPage(Page<PostImg> page,PostImg postImg,String keyword){
        return baseMapper.queryPage(page,postImg,keyword);
    }

    @Override
    public PostImg queryById(String postImgId){
        return baseMapper.queryById(postImgId);
    }

    @Override
    public IPage<PostImg> searchPage(String keyword){
        PostImg postImg = new PostImg();
        postImg.setKeyword(keyword);

        Page<PostImg> page = new Page<>();
//        page.setCurrent(new Integer(1));
//        page.setSize(30);

        return baseMapper.queryPage(page,postImg,keyword);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public PostImg addPostImg(PostImg postImg){
        postImg.setCreateTime(new Date());
        this.save(postImg);

        return postImg;
    }

}
