package com.example.config;

import com.example.middleware.TokenMiddleware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


/**
 * @author song
 */
@Configuration
public class MiddlewareConfig implements WebMvcConfigurer {
    @Autowired
    private TokenMiddleware tokenMiddleware;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(tokenMiddleware).addPathPatterns(tokenMiddleware.router());
        WebMvcConfigurer.super.addInterceptors(registry);
    }

}
