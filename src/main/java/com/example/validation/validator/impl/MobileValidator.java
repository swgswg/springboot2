package com.example.validation.validator.impl;

import com.example.validation.validator.Mobile;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * @author song
 */
public class MobileValidator implements ConstraintValidator<Mobile, String> {
    @Override
    public boolean isValid(String value, ConstraintValidatorContext constraintValidatorContext) {
        if (value == null) {
            return true;
        }
        String regex = "^1(3|4|5|7|8)\\d{9}$";
        return value.matches(regex);
    }

}
