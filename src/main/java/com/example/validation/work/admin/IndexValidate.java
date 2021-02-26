package com.example.validation.work.admin;

import com.example.model.Delete;
import com.example.model.Insert;
import com.example.model.Select;
import com.example.model.Update;
import com.example.model.admin.AdminStatusEnum;
import com.example.validation.BaseValidation;
import com.example.validation.validator.Enumeration;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.validator.constraints.Length;
import org.springframework.stereotype.Component;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Positive;

/**
 * @author song
 */
@Data
@Component
@EqualsAndHashCode(callSuper = true)
public class IndexValidate extends BaseValidation {
    @Positive(message = "页码必须为正整数")
    @Min(value = 1, message = "页码必须是正整数")
    private int page;

    @Positive(message = "每页数量必须为正整数")
    @Min(value = 1, message = "每页数量必须是正整数")
    private int pageSize;

    @NotBlank(message = "管理员名称不能为空", groups = {Insert.class})
    @Length(max = 20, min = 5, message = "管理员名长度为5~20位")
    private String adminName;

    @Enumeration(enumClass = AdminStatusEnum.class)
    private Integer status;
}
