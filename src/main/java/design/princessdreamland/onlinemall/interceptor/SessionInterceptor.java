package design.princessdreamland.onlinemall.interceptor;

import com.baomidou.mybatisplus.core.toolkit.ObjectUtils;
import design.princessdreamland.onlinemall.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        if (ObjectUtils.isNull(user)||ObjectUtils.isNull(user.getUserId())){

            response.sendError(900,"未登录");
            return false;
        }
        return true;
    }
}
