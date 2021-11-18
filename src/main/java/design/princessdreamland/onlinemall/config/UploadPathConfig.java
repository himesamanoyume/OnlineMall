package design.princessdreamland.onlinemall.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.util.ClassUtils;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 配置上传文件的路径
 *
 * */

@Configuration
public class UploadPathConfig implements WebMvcConfigurer {

    //获取文件夹路径
    public static final String UPLOAD_PATH = ClassUtils
            .getDefaultClassLoader()
            .getResource("")
            .getPath() + "../upload/";
//    public static final String UPLOAD_PATH = "/www/wwwroot/princessdreamland.design/upload/";

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/upload/**")
                .addResourceLocations("file:"+ UPLOAD_PATH);
    }

}
