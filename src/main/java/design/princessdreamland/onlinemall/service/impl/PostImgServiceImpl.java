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

import javax.servlet.http.HttpSession;

@Service
public class PostImgServiceImpl extends ServiceImpl<PostImgMapper, PostImg>
        implements PostImgService {

    @Autowired
    private HttpSession session;

    @Override
    public IPage<PostImg> queryPage(Page<PostImg> page,PostImg postImg){
        return baseMapper.queryPage(page,postImg);
    }

    @Override
    public PostImg queryById(String postImgId){
        return baseMapper.queryById(postImgId);
    }

    @Override
    public IPage<PostImg> searchPage(String keyword,String currentPage){
        PostImg postImg = new PostImg();
        if (StrUtil.isNotEmpty(keyword)){
            postImg.setKeyword(keyword);
        }
        Page<PostImg> page = new Page<>();
        page.setCurrent(new Integer(currentPage));

        page.setSize(30);

        return baseMapper.queryPage(page,postImg);
    }

}
