package com.example.validation.work.admin;

import com.example.model.admin.AdminStatusEnum;
import com.example.validation.BaseValidate;
import com.example.validation.validator.Confirm;
import com.example.validation.validator.Enumeration;
import com.example.validation.validator.Mobile;
import org.hibernate.validator.constraints.Length;
import org.springframework.data.annotation.Id;

import javax.validation.constraints.*;
import java.util.List;

/**
 * @author song
 */
@Confirm(first = "password", second = "repassword")
public class EditValidate extends BaseValidate {
    @Id
    @NotBlank(message = "ID必须存在")
    @Positive(message = "ID必须为正整数")
    @Min(value = 1, message = "ID必须是正整数")
    private Long id;

    @NotBlank(message = "密码不能为空")
    @Length(max = 20, min = 5, message = "密码长度为5~20位")
    private String password;

    @NotBlank(message = "重复密码不能为空")
    @Length(max = 20, min = 5, message = "重复密码长度为5~20位")
    private String repassword;

    @Email()
    private String email;

    @Mobile()
    private String mobile;

    @Enumeration(enumClass = AdminStatusEnum.class)
    private Integer status;

    private List<Long> roleIds;
}
