package com.example.validation;

import com.example.exception.work.IllegalArgumentException;
import lombok.Data;
import org.apache.commons.collections.CollectionUtils;

import javax.validation.*;
import javax.validation.groups.Default;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;


/**
 * 参数校验基类
 * @author song
 */
@Data
public class BaseValidation {
//    @Null：   元素为 null
//    @NotNull ：   元素不为 null
//    @AssertTrue ：    元素为 true
//    @AssertFalse  ：  元素为 false
//    @Min(value)  ：  数字的值大于等于指定的最小值
//    @Max(value)  ：  个数字的值小于等于指定的最大值
//    @DecimalMin(value) ：大数值大于等于指定的最小值
//    @DecimalMax(value)：  大数值小于等于指定的最大值
//    @Size(max=, min=) ： 元素的大小在指定的范围内
//    @Digits (integer, fraction)  ：  元素是一个数字，其值必须在可接受的范围内
//    @Past：  一个过去的日期
//    @Future  ：   一个将来的日期
//    @Pattern(regex=,flag=) ：指定的正则表达式
//    @URL：必须是一个URL
//    @Email：必须是email格式
//    @NotBlank: 字符串不能为空
//    @NotEmpty：集合不能为空
//    @Length: 长度必须在指定范围内
//    @Valid :对实体类进行校验


    /**
     * @param obj 校验参数
     */
    public static void validate(@Valid Object obj) {
        Set<ConstraintViolation<@Valid Object>> validateSet = Validation.buildDefaultValidatorFactory()
                .getValidator()
                .validate(obj, Default.class);

        Map<String,StringBuffer> errorMap = null;
        if (!CollectionUtils.isEmpty(validateSet)) {
            errorMap = new HashMap<String,StringBuffer>();
            String property = null;
            for(ConstraintViolation<Object> cv : validateSet){
                //这里循环获取错误信息，可以自定义格式
                property = cv.getPropertyPath().toString();
                if(errorMap.get(property) != null){
                    errorMap.get(property).append("," + cv.getMessage());
                }else{
                    StringBuffer sb = new StringBuffer();
                    sb.append(cv.getMessage());
                    errorMap.put(property, sb);
                }
            }

//            String messages = validateSet.stream()
//                    .map(ConstraintViolation::getMessage)
//                    .reduce((m1, m2) -> m1 + "；" + m2)
//                    .orElse("参数输入有误！");
            throw new IllegalArgumentException(errorMap.toString());
        }
    }

}
