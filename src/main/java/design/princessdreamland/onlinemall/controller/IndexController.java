package design.princessdreamland.onlinemall.controller;
import com.baomidou.mybatisplus.core.metadata.IPage;
import design.princessdreamland.onlinemall.annotation.RequestLog;
import design.princessdreamland.onlinemall.entity.Misc;
import design.princessdreamland.onlinemall.entity.Permi;
import design.princessdreamland.onlinemall.entity.Post;
import design.princessdreamland.onlinemall.service.MiscService;
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

    @Autowired
    private MiscService miscService;

    @GetMapping("/")
    @RequestLog(action="首页页面")
    public String index(String keyword, Model model){

        IPage<Post> postPage = postService.searchIndexPage(keyword,"1",5);
        Misc misc = miscService.queryById("1");
        Misc footer = miscService.queryById("3");
        Misc head = miscService.queryById("6");
        model.addAttribute("head",head.getText());
        model.addAttribute("footer",footer.getText());
        model.addAttribute("misc",misc.getText());
        model.addAttribute("postList",postPage.getRecords());
        model.addAttribute("currentPage",postPage.getCurrent());
        model.addAttribute("totalPages",postPage.getPages());

        return "/_jsp/_index.jsp";
    }

    @GetMapping("/post")
    @RequestLog(action="文章页面")
    public String post(Model model,String keyword, String currentPage){
        Misc footer = miscService.queryById("3");
        model.addAttribute("footer",footer.getText());
        IPage<Post> postPage = postService.searchIndexPage(keyword,currentPage,8);
        Misc head = miscService.queryById("12");
        model.addAttribute("head",head.getText());
        model.addAttribute("postList",postPage.getRecords());
        model.addAttribute("currentPage",postPage.getCurrent());
        model.addAttribute("totalPages",postPage.getPages());

        return "/_jsp/_post.jsp";
    }

    @GetMapping("/dynamic")
    @RequestLog(action="项目页面")
    public String dynamic(Model model,String keyword, String currentPage){
        Misc footer = miscService.queryById("3");
        model.addAttribute("footer",footer.getText());
        IPage<Post> postPage = postService.searchPage("5",keyword,currentPage,15);
        Misc head = miscService.queryById("11");
        model.addAttribute("head",head.getText());
        model.addAttribute("postList",postPage.getRecords());
        model.addAttribute("currentPage",postPage.getCurrent());
        model.addAttribute("totalPages",postPage.getPages());

        return "/_jsp/_dynamic.jsp";
    }

    @GetMapping("/postDetail")
    @RequestLog(action="文章详细页面")
    public String postDetail(String postId, Model model){
        Post post = postService.queryById(postId);
        Misc footer = miscService.queryById("3");
        if (post.getStatus()==0){
            Misc head = miscService.queryById("7");
            model.addAttribute("head",head.getText());
            model.addAttribute("footer",footer.getText());
            return "/_jsp/_error.jsp";
        }
        Misc head = miscService.queryById("5");
        model.addAttribute("head",head.getText());
        model.addAttribute("footer",footer.getText());
        model.addAttribute("post",post);

        return "/_jsp/_postDetail.jsp";
    }

    @GetMapping("/resume")
    @RequestLog(action="简历页面")
    public String resume(HttpSession session,Model model){
        Misc footer = miscService.queryById("3");
        model.addAttribute("footer",footer.getText());
        Permi permi = (Permi)session.getAttribute("permi");
        if (2!=permi.getType() && 1!=permi.getType()){
            throw new RuntimeException("没有访问权限");
        }
        Misc head = miscService.queryById("14");
        model.addAttribute("head",head.getText());
        Misc misc = miscService.queryById("2");
        model.addAttribute("misc",misc.getText());
        return "/_jsp/_resume.jsp";
    }

    @GetMapping("/console")
    @RequestLog(action="后台页面")
    public String console(String type,String keyword, Model model, String currentPage, HttpSession session){
        Permi permi = (Permi)session.getAttribute("permi");
        Misc footer = miscService.queryById("3");
        model.addAttribute("footer",footer.getText());
        if (2!=permi.getType()){
            throw new RuntimeException("没有访问权限");
        }
        IPage<Post> postPage = postService.searchConsolePage(type,keyword,currentPage,20);
        Misc head = miscService.queryById("10");
        model.addAttribute("head",head.getText());

        model.addAttribute("postList",postPage.getRecords());
        model.addAttribute("currentPage",postPage.getCurrent());
        model.addAttribute("totalPages",postPage.getPages());

        return "/_jsp/_console.jsp";
    }

    @GetMapping("/addPost")
    @RequestLog(action="新增文章页面")
    public String addPost(HttpSession session,Model model) {
        Permi permi = (Permi)session.getAttribute("permi");
        Misc footer = miscService.queryById("3");
        model.addAttribute("footer",footer.getText());
        Misc head = miscService.queryById("8");
        model.addAttribute("head",head.getText());
        if (2!=permi.getType()){
            throw new RuntimeException("没有访问权限");
        }
        return "/_jsp/_addPost.jsp";
    }

    @GetMapping("/editPost")
    @RequestLog(action="编辑文章页面")
    public String editPost(String postId, Model model, HttpSession session){
        Permi permi = (Permi)session.getAttribute("permi");
        Misc footer = miscService.queryById("3");
        Misc head = miscService.queryById("4");
        model.addAttribute("head",head.getText());
        model.addAttribute("footer",footer.getText());
        if (2!=permi.getType()){
            throw new RuntimeException("没有访问权限");
        }
        Post post = postService.queryById(postId);

        model.addAttribute("post",post);

        return "/_jsp/_editPost.jsp";
    }
}