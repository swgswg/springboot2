package com.example.validation.validator;

import com.example.validation.validator.impl.ConfirmValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author song
 */
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = ConfirmValidator.class)
public @interface Confirm {
    /**
     * 错误提示
     */
    String message() default "二次确认不匹配";


    /**
     * 需要验证的第一字段的字段名
     * @return 第一字段的字段名
     */
    String first();


    /**
     * 需要验证的第二字段的字段名
     * @return 第一字段的字段名
     */
    String second();


    /**
     * 分组校验
     */
    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
