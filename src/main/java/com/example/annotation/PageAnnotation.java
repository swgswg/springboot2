package com.example.annotation;


import java.lang.annotation.*;

/**
 * @author song
 */
@Target({ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface PageAnnotation {
}
