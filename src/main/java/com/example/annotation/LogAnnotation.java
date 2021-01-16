package com.example.annotation;


import java.lang.annotation.*;

/**
 * 操作日志自定义注解
 * @author song
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface LogAnnotation {
    /**
     * 记录操作描述
     */
    String description() default "";

    /**
     * 增删改的数据的类型
     */
    Class<?> clazz();
}
