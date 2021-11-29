package design.princessdreamland.onlinemall.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.ObjectUtils;
import design.princessdreamland.onlinemall.entity.PostImg;
import design.princessdreamland.onlinemall.service.PostImgService;
import design.princessdreamland.onlinemall.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@ResponseBody
@RequestMapping("/postImg")
public class PostImgController {

    @Autowired
    private PostImgService postImgService;

    @PostMapping("/queryPage")
    public IPage<PostImg> queryPage(PostImg postImg){
        return postImgService.queryPage(postImg.getPage(),postImg);
    }



}
