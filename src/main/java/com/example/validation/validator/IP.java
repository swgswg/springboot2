package com.example.validation.validator;

import com.example.validation.validator.impl.IpValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author song
 */
@Target({ ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = IpValidator.class)
public @interface IP {
    /**
     * 错误提示
     */
    String message() default "IP格式错误";

    /**
     * 分组校验
     */
    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
