package com.example.validation.validator.impl;

import com.example.validation.validator.Enumeration;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.lang.reflect.Method;


/**
 * @author song
 */
public class EnumValidator implements ConstraintValidator<Enumeration, Object> {
    private Class<? extends Enum<?>> enumClass;
    private String enumMethod;

    @Override
    public void initialize(Enumeration enumValue) {
        this.enumClass = enumValue.enumClass();
        this.enumMethod = enumValue.enumMethod();
    }


    @Override
    public boolean isValid(Object value, ConstraintValidatorContext context) {
        if (value == null) {
            return Boolean.TRUE;
        }
        if (enumClass == null) {
            return Boolean.TRUE;
        }
        Object[] objects = this.enumClass.getEnumConstants();
        try {
            Method method = this.enumClass.getMethod(this.enumMethod);
            for (Object o : objects) {
                if (value.equals(method.invoke(o))) {
                    return true;
                }
            }
            // 禁用默认提示信息
            //context.disableDefaultConstraintViolation();
            // 设置提示语
            //context.buildConstraintViolationWithTemplate("diy message").addConstraintViolation();

            return false;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
