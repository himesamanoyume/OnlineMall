package design.princessdreamland.onlinemall.controller;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.sun.org.apache.xpath.internal.operations.Mod;
import design.princessdreamland.onlinemall.annotation.RequestLog;
import design.princessdreamland.onlinemall.entity.Book;
import design.princessdreamland.onlinemall.entity._Post;
import design.princessdreamland.onlinemall.service.BookService;
import design.princessdreamland.onlinemall.service._PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Controller
@RequestMapping("/")
public class IndexController {

    @Autowired
    private _PostService postService;

    @GetMapping("/index")
    @RequestLog(action="首页页面")
    public String _index(String type,Model model, String currentPage){

        IPage<_Post> postPage = postService.searchIndexPage(type,currentPage);
        model.addAttribute("postList",postPage.getRecords());
        model.addAttribute("currentPage",postPage.getCurrent());
        model.addAttribute("totalPages",postPage.getPages());

        return "/_jsp/_index.jsp";
    }

    @GetMapping("/post")
    @RequestLog(action="文章页面")
    public String post(String type, Model model,String keyword, String currentPage){

        IPage<_Post> postPage = postService.searchPage(type,keyword,currentPage);
        model.addAttribute("postList",postPage.getRecords());
        model.addAttribute("currentPage",postPage.getCurrent());
        model.addAttribute("totalPages",postPage.getPages());

        return "/_jsp/_post.jsp";
    }

    @GetMapping("/project")
    @RequestLog(action="项目页面")
    public String project(String type,Model model,String keyword, String currentPage){

        IPage<_Post> postPage = postService.searchPage(type,keyword,currentPage);
        model.addAttribute("postList",postPage.getRecords());
        model.addAttribute("currentPage",postPage.getCurrent());
        model.addAttribute("totalPages",postPage.getPages());

        return "/_jsp/_project.jsp";
    }

    @GetMapping("/note")
    @RequestLog(action="笔记页面")
    public String note(String type,Model model,String keyword, String currentPage){

        IPage<_Post> postPage = postService.searchPage(type,keyword,currentPage);
        model.addAttribute("postList",postPage.getRecords());
        model.addAttribute("currentPage",postPage.getCurrent());
        model.addAttribute("totalPages",postPage.getPages());

        return "/_jsp/_note.jsp";
    }

    @GetMapping("/tools")
    @RequestLog(action="工具页面")
    public String tools(String type,Model model,String keyword, String currentPage){

        IPage<_Post> postPage = postService.searchPage(type,keyword,currentPage);
        model.addAttribute("postList",postPage.getRecords());
        model.addAttribute("currentPage",postPage.getCurrent());
        model.addAttribute("totalPages",postPage.getPages());

        return "/_jsp/_tools.jsp";
    }

    @GetMapping("/tags")
    @RequestLog(action="项目页面")
    public String tags(String type,Model model,String keyword, String currentPage){

        IPage<_Post> postPage = postService.searchPage(type,keyword,currentPage);
        model.addAttribute("postList",postPage.getRecords());
        model.addAttribute("currentPage",postPage.getCurrent());
        model.addAttribute("totalPages",postPage.getPages());

        return "/_jsp/_tags.jsp";
    }

    @GetMapping("/postDetail")
    @RequestLog(action="文章详细页面")
    public String postDetail(String postId, Model model){
        _Post post = postService.queryById(postId);
        model.addAttribute("post",post);

        return "/_jsp/_postDetail.jsp";
    }

}