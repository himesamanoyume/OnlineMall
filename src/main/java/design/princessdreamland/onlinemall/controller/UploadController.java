package design.princessdreamland.onlinemall.controller;

import design.princessdreamland.onlinemall.config.UploadPathConfig;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Controller
@ResponseBody
public class UploadController {

    @PostMapping("/uploadFile")
    public String uploadFile(MultipartFile file)  throws Exception, IOException {

//        System.out.println(file.getOriginalFilename());
//        return "file";
        String originalFileNameString = file.getOriginalFilename();
        String  typeStr = originalFileNameString.substring(originalFileNameString.lastIndexOf('.'));
        String fileName = System.currentTimeMillis() + typeStr;

        File saveFile = new File(UploadPathConfig.UPLOAD_PATH + fileName);
        file.transferTo(saveFile);

        return "/upload/" + fileName;
    }
}