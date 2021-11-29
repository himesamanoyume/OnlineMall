package design.princessdreamland.onlinemall.controller;

import design.princessdreamland.onlinemall.config.UploadPathConfig;
import design.princessdreamland.onlinemall.entity.PostImg;
import design.princessdreamland.onlinemall.service.PostImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Controller
@ResponseBody
public class UploadController {

    @Autowired
    private PostImgService postImgService;

    @PostMapping("/uploadFile")
    public String uploadFile(MultipartFile file)  throws Exception, IOException {

//        System.out.println(file.getOriginalFilename());
//        return "file";
        String originalFileNameString = file.getOriginalFilename();
        String typeStr = originalFileNameString.substring(originalFileNameString.lastIndexOf('.'));
        String fileName = System.currentTimeMillis() + typeStr;
//
        File saveFile = new File(UploadPathConfig.UPLOAD_PATH + fileName);
        file.transferTo(saveFile);
//
        return "/upload/" + fileName;
    }

    @PostMapping("/uploadImg")
    public String uploadImg(MultipartFile file,String keyword,String name) throws Exception,IOException{

//        System.out.println(keyword +" "+name);
//        return "file";


        String originalFileNameString = file.getOriginalFilename();
        String typeStr = originalFileNameString.substring(originalFileNameString.lastIndexOf('.'));
//        String typeStr = ".png";


        File directory = new File(UploadPathConfig.UPLOAD_PATH);
        if (!directory.exists()){
            directory.mkdir();
        }
        File keywordDirectory = new File(directory+"/"+keyword);
        if (!keywordDirectory.exists()){
            keywordDirectory.mkdir();
        }
        String fileName = name + typeStr;
        File saveFile = new File( keywordDirectory +"/"+ fileName);
        file.transferTo(saveFile);
        PostImg postImg = new PostImg();
        postImg.setKeyword(keyword);
        postImg.setName(fileName);

        postImgService.addPostImg(postImg);

        return fileName;
    }
}