package com.example.interceptor;

import com.example.annotation.ResponseResult;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;

/**
 * @author song
 * 拦截请求，是否此请求返回的值需要包装，其实就是运行的时候，解析@ResponseResult注解
 */
//@Component
public class ResponseResultInterceptor implements HandlerInterceptor {

    public static final String RESPONSE_RESULT_ANNOTATION = "RESPONSE_RESULT_ANNOTATION";

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 请求的方法
        if (handler instanceof HandlerMethod) {
            final HandlerMethod handlerMethod = (HandlerMethod)handler;
            final Class<?> clazz = handlerMethod.getBeanType();
            final Method method = handlerMethod.getMethod();

            System.out.println(method.isAnnotationPresent(ResponseResult.class));
            System.out.println(clazz.isAnnotationPresent(ResponseResult.class));
            // 方法上是否有注解
            if (method.isAnnotationPresent(ResponseResult.class)) {
                // 设置此请求的返回体, 需要包装, 往下传递, 在ResponseBodyAdvice接口进行按断
                request.setAttribute(RESPONSE_RESULT_ANNOTATION, method.getAnnotation(ResponseResult.class));
            } else if (clazz.isAnnotationPresent(ResponseResult.class)) {
                // 判断是否在类对象上面加了注解
                request.setAttribute(RESPONSE_RESULT_ANNOTATION, clazz.getAnnotation(ResponseResult.class));
            }
        }

        return true;
    }

}
