package com.example.annotation;

import java.lang.annotation.*;

/**
 * @author song
 * 作用于方法上的注解
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface AroundFunction {
}
