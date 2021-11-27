package design.princessdreamland.onlinemall.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import design.princessdreamland.onlinemall.entity.Permi;
import design.princessdreamland.onlinemall.entity._Post;
import design.princessdreamland.onlinemall.mapper._PostMapper;
import design.princessdreamland.onlinemall.service._PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Service
public class _PostServiceImpl extends ServiceImpl<_PostMapper, _Post> implements _PostService {

    @Autowired
    private HttpSession session;

    @Override
    public IPage<_Post> queryPage(Page<_Post> page,_Post post){
        return baseMapper.queryPage(page,post);
    }

    @Override
    public IPage<_Post> searchIndexPage(String type, String currentPage){
        _Post post = new _Post();
        post.setStatus(1);
        Page<_Post> page = new Page<>();
        if (StrUtil.isNotEmpty(currentPage)){
            page.setCurrent(new Integer(currentPage));
        }

        page.setSize(5);

        return baseMapper.queryPage(page,post);
    }

    @Override
    public IPage<_Post> searchConsolePage(String type, String currentPage){
        _Post post = new _Post();
//        post.setStatus(1);
        Page<_Post> page = new Page<>();
        if (StrUtil.isNotEmpty(currentPage)){
            page.setCurrent(new Integer(currentPage));
        }

        page.setSize(20);

        return baseMapper.queryPage(page,post);
    }

    @Override
    public IPage<_Post> searchPage(String type,String keyword, String currentPage){
        _Post post = new _Post();
        post.setStatus(1);
        if (StrUtil.isNotEmpty(type) && StrUtil.isNotEmpty(keyword)){
            post.setTitle(keyword);
            post.setTypeId(new Integer(type));
        }else if(StrUtil.isNotEmpty(type)){
            post.setTypeId(new Integer(type));
        }

        Page<_Post> page = new Page<>();
        if (StrUtil.isNotEmpty(currentPage)){
            page.setCurrent(new Integer(currentPage));
        }

        page.setSize(10);

        return baseMapper.queryPage(page,post);
    }

    @Override
    public _Post queryById(String postId){
        return baseMapper.queryById(postId);
    }

    @Override
    public _Post setStatus(String postId){
        QueryWrapper<_Post> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("post_id",postId);
        _Post post = this.getOne(queryWrapper);

        if (ObjectUtil.isNull(post)){
            throw new RuntimeException("文章不存在或者没有操作权限");
        }
        if (post.getStatus()==0){
            post.setStatus(1);
        }else{
            post.setStatus(0);
        }

        post.setUpdateTime(new Date());
        this.updateById(post);
        return post;
    }
}
