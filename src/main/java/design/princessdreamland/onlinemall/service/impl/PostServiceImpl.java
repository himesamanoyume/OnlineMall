package design.princessdreamland.onlinemall.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import design.princessdreamland.onlinemall.entity.Permi;
import design.princessdreamland.onlinemall.entity.Post;
import design.princessdreamland.onlinemall.mapper.PostMapper;
import design.princessdreamland.onlinemall.service.PostService;
//import javafx.geometry.Pos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Service
public class PostServiceImpl extends ServiceImpl<PostMapper, Post> implements PostService {

    @Autowired
    private HttpSession session;

    @Override
    public IPage<Post> queryPage(Page<Post> page, Post post){
        return baseMapper.queryPage(page,post);
    }

    @Override
    public IPage<Post> searchIndexPage(String keyword, String currentPage,Integer size){
        Post post = new Post();
        post.setStatus(1);

        if (StrUtil.isNotEmpty(keyword)){
            post.setTitle(keyword);
        }

        Page<Post> page = new Page<>();
        if (StrUtil.isNotEmpty(currentPage)){
            page.setCurrent(new Integer(currentPage));
        }

        page.setSize(size);

        return baseMapper.queryIndexPage(page,post);
    }

    @Override
    public IPage<Post> searchConsolePage(String type,String keyword, String currentPage,Integer size){
        Post post = new Post();

        if (StrUtil.isNotEmpty(keyword)){
            post.setTitle(keyword);
        }

        Page<Post> page = new Page<>();
        if (StrUtil.isNotEmpty(type) && StrUtil.isNotEmpty(currentPage)){
            post.setTypeId(new Integer(type));
            page.setCurrent(new Integer(currentPage));
        }else if (StrUtil.isNotEmpty(currentPage)){
            page.setCurrent(new Integer(currentPage));
        }

        page.setSize(size);

        return baseMapper.queryPage(page,post);
    }

    @Override
    public IPage<Post> searchPage(String type, String keyword, String currentPage,Integer size){

        Post post = new Post();

        post.setStatus(1);
        if (StrUtil.isNotEmpty(type) && StrUtil.isNotEmpty(keyword)){
            post.setTitle(keyword);
            post.setTypeId(new Integer(type));
        }else if(StrUtil.isNotEmpty(type)){
            post.setTypeId(new Integer(type));
        }

        Page<Post> page = new Page<>();
        if (StrUtil.isNotEmpty(currentPage)){
            page.setCurrent(new Integer(currentPage));
        }

        page.setSize(size);

        return baseMapper.queryPage(page,post);
    }

    @Override
    public Post queryById(String postId){
        return baseMapper.queryById(postId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Post setStatus(String postId){
        QueryWrapper<Post> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("post_id",postId);
        Post post = this.getOne(queryWrapper);

        if (ObjectUtil.isNull(post)){
            throw new RuntimeException("???????????????????????????????????????");
        }
        if (post.getStatus()==0){
            post.setStatus(1);
        }else{
            post.setStatus(0);
        }

        this.updateById(post);
        return post;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Post addPost(Post post){
        this.save(post);
        return post;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Post editPost(Post post){

        this.updateById(post);

        return post;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Post deletePost(String postId){
        QueryWrapper<Post> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("post_id",postId);
        Post post = this.getOne(queryWrapper);
        if (ObjectUtil.isNull(post)){
            throw new RuntimeException("???????????????????????????????????????");
        }

        this.updateById(post);
        this.removeById(postId);

        return post;
    }

}
