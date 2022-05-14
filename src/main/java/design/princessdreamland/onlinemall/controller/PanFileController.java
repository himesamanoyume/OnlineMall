package design.princessdreamland.onlinemall.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import design.princessdreamland.onlinemall.annotation.RequestLog;
import design.princessdreamland.onlinemall.entity.PanFile;
import design.princessdreamland.onlinemall.service.PanFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@ResponseBody
@RequestMapping("/panFile")
public class PanFileController {

    @Autowired
    private PanFileService fileService;

    @GetMapping("/queryList")
    public List<PanFile> queryList(){
        PanFile file = new PanFile();
        return fileService.queryList(file);
    }

    @PostMapping("/queryPage")
    public IPage<PanFile> queryPage(PanFile file){
        return fileService.queryPage(file.getPage(),file, file.getFileName());
    }

    @PostMapping("/searchImg")
    @RequestLog(action = "调用搜索图片")
    public List<PanFile> searchPage(String keyword){
        if (StrUtil.isEmpty(keyword)){
            throw new RuntimeException("关键字为空");
        }
        IPage<PanFile> filePage = fileService.searchPage(keyword);

        return filePage.getRecords();
    }



}
