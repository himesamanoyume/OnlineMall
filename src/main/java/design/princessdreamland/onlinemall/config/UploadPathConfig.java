package design.princessdreamland.onlinemall.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.util.ClassUtils;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.io.File;

/**
 * 配置上传文件的路径
 *
 * */

@Configuration
public class UploadPathConfig implements WebMvcConfigurer {

    //获取文件夹路径
//    public static final String UPLOAD_PATH = ClassUtils
//            .getDefaultClassLoader()
//            .getResource("")
//            .getPath() + "../Img/";

//    public static final String UPLOAD_PATH = ClassUtils
//            .getDefaultClassLoader()
//            .getResource("")
//            .getPath() + "../upload/";

    public static final String UPLOAD_PATH = "/www/wwwroot/princessdreamland.design/Img/";
    public static final String RES_PATH = "/www/wwwroot/princessdreamland.design/res/";
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/Img/**")
                .addResourceLocations("file:"+ UPLOAD_PATH);

        registry.addResourceHandler("/res/**")
                .addResourceLocations("file:"+ RES_PATH);
    }

//    @Override
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        String upload = System.getProperty("user.dir");
//        String upload_path = upload + "/Img/";
//        registry.addResourceHandler("/Img/**")
//                .addResourceLocations("file:"+ upload_path);
//    }

}
