package design.princessdreamland.onlinemall.controller;
import com.baomidou.mybatisplus.core.metadata.IPage;
import design.princessdreamland.onlinemall.annotation.RequestLog;
import design.princessdreamland.onlinemall.entity.Permi;
import design.princessdreamland.onlinemall.entity.Post;
import design.princessdreamland.onlinemall.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/")
public class IndexController {

    @Autowired
    private PostService postService;

    @GetMapping("/index")
    @RequestLog(action="首页页面")
    public String index(String type, Model model, String currentPage, HttpSession session){

        Permi permi = (Permi)session.getAttribute("permi");
        IPage<Post> postPage = postService.searchIndexPage(type,currentPage);
        model.addAttribute("postList",postPage.getRecords());
        model.addAttribute("currentPage",postPage.getCurrent());
        model.addAttribute("totalPages",postPage.getPages());

        return "/_jsp/_index.jsp";
    }

    @GetMapping("/post")
    @RequestLog(action="文章页面")
    public String post(String type, Model model,String keyword, String currentPage, HttpSession session){
        Permi permi = (Permi)session.getAttribute("permi");
        IPage<Post> postPage = postService.searchPage(type,keyword,currentPage);
        model.addAttribute("postList",postPage.getRecords());
        model.addAttribute("currentPage",postPage.getCurrent());
        model.addAttribute("totalPages",postPage.getPages());

        return "/_jsp/_post.jsp";
    }

    @GetMapping("/project")
    @RequestLog(action="项目页面")
    public String project(String type,Model model,String keyword, String currentPage, HttpSession session){
        Permi permi = (Permi)session.getAttribute("permi");
        IPage<Post> postPage = postService.searchPage(type,keyword,currentPage);
        model.addAttribute("postList",postPage.getRecords());
        model.addAttribute("currentPage",postPage.getCurrent());
        model.addAttribute("totalPages",postPage.getPages());

        return "/_jsp/_project.jsp";
    }

    @GetMapping("/note")
    @RequestLog(action="笔记页面")
    public String note(String type,Model model,String keyword, String currentPage, HttpSession session){
        Permi permi = (Permi)session.getAttribute("permi");
        IPage<Post> postPage = postService.searchPage(type,keyword,currentPage);
        model.addAttribute("postList",postPage.getRecords());
        model.addAttribute("currentPage",postPage.getCurrent());
        model.addAttribute("totalPages",postPage.getPages());

        return "/_jsp/_note.jsp";
    }

    @GetMapping("/tools")
    @RequestLog(action="工具页面")
    public String tools(String type,Model model,String keyword, String currentPage, HttpSession session){
        Permi permi = (Permi)session.getAttribute("permi");
        IPage<Post> postPage = postService.searchPage(type,keyword,currentPage);
        model.addAttribute("postList",postPage.getRecords());
        model.addAttribute("currentPage",postPage.getCurrent());
        model.addAttribute("totalPages",postPage.getPages());

        return "/_jsp/_tools.jsp";
    }

    @GetMapping("/tags")
    @RequestLog(action="项目页面")
    public String tags(String type,Model model,String keyword, String currentPage, HttpSession session){
        Permi permi = (Permi)session.getAttribute("permi");
        IPage<Post> postPage = postService.searchPage(type,keyword,currentPage);
        model.addAttribute("postList",postPage.getRecords());
        model.addAttribute("currentPage",postPage.getCurrent());
        model.addAttribute("totalPages",postPage.getPages());

        return "/_jsp/_tags.jsp";
    }

    @GetMapping("/postDetail")
    @RequestLog(action="文章详细页面")
    public String postDetail(String postId, Model model, HttpSession session){
        Post post = postService.queryById(postId);
        Permi permi = (Permi)session.getAttribute("permi");
        model.addAttribute("post",post);

        return "/_jsp/_postDetail.jsp";
    }

    @GetMapping("/resume")
    @RequestLog(action="简历页面")
    public String resume(Model model, HttpSession session){
        Permi permi = (Permi)session.getAttribute("permi");
        if (2!=permi.getType() && 1!=permi.getType()){
            throw new RuntimeException("没有访问权限");
        }

        return "/_jsp/_resume.jsp";
    }

    @GetMapping("/console")
    @RequestLog(action="后台页面")
    public String console(String type, Model model, String currentPage, HttpSession session){
        Permi permi = (Permi)session.getAttribute("permi");
        if (2!=permi.getType()){
            throw new RuntimeException("没有访问权限");
        }
        IPage<Post> postPage = postService.searchConsolePage(type,currentPage);


        model.addAttribute("postList",postPage.getRecords());
        model.addAttribute("currentPage",postPage.getCurrent());
        model.addAttribute("totalPages",postPage.getPages());

        return "/_jsp/_console.jsp";
    }

}