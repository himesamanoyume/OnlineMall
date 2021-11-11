package design.princessdreamland.onlinemall.aspect;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.json.JSONUtil;
import design.princessdreamland.onlinemall.annotation.RequestLog;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;

@Aspect
@Component
@Slf4j
public class RequestLogAspect {
	
	@Autowired
	private HttpSession session;

	@Pointcut("@annotation(design.princessdreamland.onlinemall.annotation.RequestLog)")
	public void logCut() {}
	
	@AfterReturning(value="logCut()", returning="res")
	public void doAfterReturning(JoinPoint joinpoint, Object res) {
		MethodSignature signature = (MethodSignature)joinpoint.getSignature();
		Method method = signature.getMethod();
		String methodName = method.getDeclaringClass().getSimpleName() + "." + method.getName();
		
		Annotation annotation = method.getAnnotation(RequestLog.class);
		String action = "";
		if(ObjectUtil.isNotNull(annotation)) {
			action = ((RequestLog)annotation).action();
		}
		
		
		log.info("方法调用: {}, 操作类型: {}, 入参: {}, 返回值: {}", methodName, action
				, JSONUtil.toJsonStr(joinpoint.getArgs()), JSONUtil.toJsonStr(res));
	}
	

}
