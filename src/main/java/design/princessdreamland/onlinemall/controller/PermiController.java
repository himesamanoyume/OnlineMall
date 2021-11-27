package design.princessdreamland.onlinemall.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.ObjectUtils;
import design.princessdreamland.onlinemall.annotation.RequestLog;
import design.princessdreamland.onlinemall.entity.Permi;
import design.princessdreamland.onlinemall.entity._Post;
import design.princessdreamland.onlinemall.service.PermiService;
import design.princessdreamland.onlinemall.service._PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@ResponseBody
@RequestMapping("/permi")
public class PermiController {

    @Autowired
    private PermiService permiService;

    @Autowired
    private _PostService postService;

    @PostMapping("/queryPage")
    public IPage<Permi> queryPage(Permi permi){
        return permiService.queryPage(permi.getPage(),permi);
    }

    @PostMapping("/login")
    public Permi login(Permi permi, HttpSession session) throws Exception{
        if (ObjectUtils.isNull(permi)){
            throw new Exception("权限信息不能为空");
        }
        if (StrUtil.isEmpty(permi.getPassword())){
            throw new Exception("密码不能为空");
        }
        return permiService.login(permi,session);
    }


}
