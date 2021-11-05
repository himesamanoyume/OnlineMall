package design.princessdreamland.onlinemall.config;

import design.princessdreamland.onlinemall.interceptor.SessionInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class SessionInterceptorConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry){
        InterceptorRegistration registration = registry.addInterceptor(new SessionInterceptor());
        registration.addPathPatterns("/**");
        registration.excludePathPatterns(
                "/",
                "/favicon.ico",
                "/view/**",
                "/img/**",
                "/js/**",
                "/css/**",
                "/user/login",
                "/user/reg",
                "/error"
        );
    }
}