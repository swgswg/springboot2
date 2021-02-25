package com.example.advice;

import com.example.annotation.ResponseResult;
import com.example.aspect.ResponseResultAspect;
import com.example.common.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

import javax.servlet.http.HttpServletRequest;

/**
 * @author song
 */
@Slf4j
//@ControllerAdvice
public class ResponseResultAdvice implements ResponseBodyAdvice<Object> {
    public static final String RESPONSE_RESULT_ANNOTATION = ResponseResultAspect.RESPONSE_RESULT_ANNOTATION;

    @Override
    public boolean supports(MethodParameter methodParameter, Class<? extends HttpMessageConverter<?>> aClass) {
        ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = sra.getRequest();

        // 判断请求 是否有包装标记
        String responseResult = (String) request.getAttribute(RESPONSE_RESULT_ANNOTATION);
        return responseResult != null && responseResult.equals(RESPONSE_RESULT_ANNOTATION);
    }

    @Override
    public Object beforeBodyWrite(Object body, MethodParameter returnType, MediaType mediaType, Class<? extends HttpMessageConverter<?>> aClass, ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse) {
        // 包装返回体
        return Result.success(body);
    }
}
