package design.princessdreamland.onlinemall.controller;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import design.princessdreamland.onlinemall.entity.Post;
import design.princessdreamland.onlinemall.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@ResponseBody
@RequestMapping("/post")
public class PostController {

    @Autowired
    private PostService postService;

    @GetMapping("/queryPostPage")
    public IPage<Post> queryPage(){
        Post post = new Post();
        Page<Post> page = new Page<>();
        page.setCurrent(1);
        page.setSize(10);

        return postService.queryPage(page, post);
    }

    @PostMapping("/setStatus")
    public Post setStatus(String postId, HttpSession session){
        Post post = (Post) session.getAttribute("post");
        return postService.setStatus(postId);
    }

    @PostMapping("/addPost")
    @ResponseBody
    public Post addPost(Post post){
        if (ObjectUtil.isNull(post)){
            throw new RuntimeException("post参数不能为空");
        }
        if (StrUtil.isEmpty(post.getTitle())){
            throw new RuntimeException("标题不能为空");
        }
        postService.addPost(post);

        return post;
    }


    @PostMapping("/editPost")
    @ResponseBody
    public Post editPost(Post post){
        if (ObjectUtil.isNull(post)){
            throw new RuntimeException("post参数不能为空");
        }
        if (StrUtil.isEmpty(post.getTitle())){
            throw new RuntimeException("标题不能为空");
        }
        postService.editPost(post);

        return post;
    }
}
