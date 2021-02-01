package com.example.validation.validator.impl;

import com.example.validation.validator.DateFormat;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.text.SimpleDateFormat;

/**
 * @author song
 */
public class DateFormatValidator implements ConstraintValidator<DateFormat, String> {
    private DateFormat dateFormat;

    @Override
    public void initialize(DateFormat constraintAnnotation) {
        this.dateFormat = constraintAnnotation;
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext constraintValidatorContext) {
        // 如果 value 为空则不进行格式验证，为空验证可以使用 @NotBlank @NotNull @NotEmpty 等注解来进行控制，职责分离
        if (value == null) {
            return true;
        }
        String format = this.dateFormat.format();

        if (value.length() != format.length()) {
            return false;
        }

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);

        try {
            simpleDateFormat.parse(value);
        } catch (Exception e){
            return false;
        }
        return true;
    }
}
