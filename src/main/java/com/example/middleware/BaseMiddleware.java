package com.example.middleware;

import org.springframework.web.servlet.HandlerInterceptor;

import java.util.List;

/**
 * @author song
 */
abstract public class BaseMiddleware implements HandlerInterceptor {
    /**
     * 需要拦截的路由
     * @return
     */
    abstract public List<String> router();
}
