package com.example.validation.work.admin;

import com.example.validation.BaseValidate;
import lombok.Data;
import org.hibernate.validator.constraints.Length;
import org.springframework.stereotype.Component;

import javax.validation.constraints.NotBlank;

/**
 * @author song
 */
@Data
@Component
public class LoginValidate extends BaseValidate {
    @NotBlank(message = "管理员名称不能为空")
    @Length(max = 20, min = 5, message = "管理员名长度为5~20位")
    private String adminName;

    @NotBlank(message = "密码不能为空")
    @Length(max = 20, min = 5, message = "密码长度为5~20位")
    private String password;
}
