package com.example.model.admin;

import com.example.common.digest.Md5Digest;
import com.example.model.*;
import com.example.validation.validator.Enumeration;
import com.example.validation.validator.IP;
import com.example.validation.validator.Mobile;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import org.hibernate.validator.constraints.Length;
import org.springframework.data.annotation.Id;
import org.springframework.stereotype.Component;

import javax.validation.constraints.*;
import java.util.Date;

/**
 * @author song
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode(callSuper = true)
@Component
public class Admin extends BaseModel {
    public static final String DEFAULT_PASSWORD = "123456";

    @Id
    @Positive(message = "ID必须为正整数")
    @NotNull(message = "ID必须存在", groups = {Update.class, Delete.class})
    @Min(value = 1, message = "ID必须是正整数", groups = {Select.class, Update.class, Delete.class})
    private Long id;

    @NotBlank(message = "管理员名称不能为空", groups = {Insert.class})
    @Length(max = 20, min = 5, message = "管理员名长度为5~20位")
    private String adminName;

    @NotBlank(message = "密码不能为空", groups = {Insert.class})
    @Length(max = 20, min = 5, message = "密码长度为5~20位")
    private String password;

    @Email(groups = {Select.class, Update.class, Insert.class})
    private String email;

    @Mobile(groups = {Select.class, Update.class, Insert.class})
    private String mobile;

    @Enumeration(enumClass = AdminStatusEnum.class, groups = {Select.class, Update.class, Insert.class})
    private Integer status;

    @Min(value = 1, message = "创建该后台人员的管理员ID必须是整整", groups = {Select.class, Update.class, Insert.class})
    private Long createAdminId;

    @IP(groups = {Select.class, Update.class, Insert.class})
    private String lastLoginIp;

    @Future(message = "创建时间不正确", groups = {Select.class, Update.class, Insert.class})
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date lastLoginTime;

    @Future(message = "创建时间不正确", groups = {Select.class, Update.class, Insert.class})
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date createTime;

    @Future(message = "创建时间不正确", groups = {Select.class, Update.class, Insert.class})
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date updateTime;


    /**
     * 比较密码
     * @param pwd 未加密的密码明文
     * @return
     */
    public boolean comparePassword(String pwd) {
        return this.getPassword().equals(passwordEncrypt(pwd));
    }


    /**
     * 密码加密
     * @param pwd 未加密的密码明文
     * @return
     */
    public static String passwordEncrypt(String pwd) {
        return Md5Digest.md5(pwd).toUpperCase();
    }

}
