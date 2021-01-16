package com.example.validation.validator;


import com.example.validation.validator.impl.MobileValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;


/**
 * 手机号校验
 * @author song
 */
@Target({ ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = MobileValidator.class)
public @interface Mobile {
    /**
     * 错误提示
     */
    String message() default "手机号格式错误";

    /**
     * 分组校验
     */
    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
