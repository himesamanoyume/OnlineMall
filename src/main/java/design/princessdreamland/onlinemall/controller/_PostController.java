package design.princessdreamland.onlinemall.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import design.princessdreamland.onlinemall.entity._Post;
import design.princessdreamland.onlinemall.service._PostService;
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
public class _PostController {

    @Autowired
    private _PostService postService;

    @GetMapping("/queryPostPage")
    public IPage<_Post> queryPage(){
        _Post post = new _Post();
        Page<_Post> page = new Page<>();
        page.setCurrent(1);
        page.setSize(10);

        return postService.queryPage(page, post);
    }

    @PostMapping("/setStatus")
    public _Post setStatus(String postId, HttpSession session){
        _Post post = (_Post) session.getAttribute("post");
        return postService.setStatus(postId);
    }
}
