package design.princessdreamland.onlinemall.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.ObjectUtils;
import design.princessdreamland.onlinemall.annotation.RequestLog;
import design.princessdreamland.onlinemall.entity.Permi;
import design.princessdreamland.onlinemall.entity.PostImg;
import design.princessdreamland.onlinemall.service.PostImgService;
import design.princessdreamland.onlinemall.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@ResponseBody
@RequestMapping("/")
public class PostImgController {

    @Autowired
    private PostImgService postImgService;

    @GetMapping("/queryList")
    public List<PostImg> queryList(){
        PostImg postImg = new PostImg();
        return postImgService.queryList(postImg);
    }

    @PostMapping("/queryPage")
    public IPage<PostImg> queryPage(PostImg postImg){
        return postImgService.queryPage(postImg.getPage(),postImg, postImg.getKeyword());
    }

    @PostMapping("/searchImg")
    @RequestLog(action = "调用搜索图片")
    public List<PostImg> searchPage(String keyword){
        if (StrUtil.isEmpty(keyword)){
            throw new RuntimeException("关键字为空");
        }
        IPage<PostImg> postImgPage = postImgService.searchPage(keyword);

        return postImgPage.getRecords();
    }



}
