package com.example.aspect;

import com.example.annotation.ResponseResult;
import com.example.interceptor.ResponseResultInterceptor;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Objects;

/**
 * @author song
 */
@Aspect
@Component
public class ResponseResultAspect {
    public static final String RESPONSE_RESULT_ANNOTATION = "RESPONSE_RESULT_ANNOTATION";

    @Pointcut("@annotation(com.example.annotation.ResponseResult)")
    private void pointcut() {}

    @Around(value = "pointcut()")
    public Object aroundCall(ProceedingJoinPoint joinPoint) throws Throwable {
        HttpServletRequest request =
                ((ServletRequestAttributes) Objects
                        .requireNonNull(RequestContextHolder.getRequestAttributes()))
                        .getRequest();

        request.setAttribute(RESPONSE_RESULT_ANNOTATION, RESPONSE_RESULT_ANNOTATION);

        //执行目标方法，并获得对应方法的返回值
        return joinPoint.proceed();
    }

}
