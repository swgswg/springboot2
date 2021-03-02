package com.example.validation.work.admin;

import com.example.validation.BaseValidate;
import com.example.validation.validator.Confirm;
import com.example.validation.validator.Mobile;
import lombok.Data;
import org.hibernate.validator.constraints.Length;
import org.springframework.stereotype.Component;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.List;

/**
 * @author song
 */
@Data
@Component
@Confirm(first = "password", second = "repassword")
public class SignUpValidate extends BaseValidate {
    @NotBlank(message = "管理员名称不能为空")
    @Length(max = 20, min = 5, message = "管理员名长度为5~20位")
    private String adminName;

    @NotBlank(message = "密码不能为空")
    @Length(max = 20, min = 5, message = "密码长度为5~20位")
    private String password;

    @NotBlank(message = "重复密码不能为空")
    @Length(max = 20, min = 5, message = "重复密码长度为5~20位")
    private String repassword;

    @Email
    private String email;

    @Mobile
    private String mobile;

    private Long createAdminId;

    private List<Long> roleIds;
}
