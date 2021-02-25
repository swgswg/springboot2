package com.example.validation.validator.impl;

import com.example.validation.validator.Confirm;
import org.springframework.beans.BeanWrapperImpl;
import java.lang.annotation.Annotation;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * @author song
 */
public class ConfirmValidator implements ConstraintValidator<Confirm, Object> {
    private String firstFieldName;
    private String secondFieldName;

    @Override
    public void initialize(Confirm constraintAnnotation) {
        this.firstFieldName = constraintAnnotation.first();
        this.secondFieldName = constraintAnnotation.second();
    }

    @Override
    public boolean isValid(Object value, ConstraintValidatorContext constraintValidatorContext) {
        BeanWrapperImpl wrapper = new BeanWrapperImpl(value);
        Object firstObj = wrapper.getPropertyValue(firstFieldName);
        Object secondObj = wrapper.getPropertyValue(secondFieldName);
        // 禁用默认提示信息
        constraintValidatorContext.disableDefaultConstraintViolation();
        // 设置提示语
        constraintValidatorContext.buildConstraintViolationWithTemplate(
                this.firstFieldName + ":" + this.secondFieldName + constraintValidatorContext.getDefaultConstraintMessageTemplate()
        ).addConstraintViolation();
        if (firstObj == null && secondObj == null) {
            return true;
        }
        if (firstObj != null) {
            return firstObj.equals(secondObj);
        }

        return false;
    }

}
