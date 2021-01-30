package com.example.model.user;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.example.model.*;
import com.example.model.account.Account;
import com.example.validation.validator.Enumeration;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.*;
import org.springframework.data.annotation.Id;
import org.springframework.stereotype.Component;

import javax.validation.constraints.*;

import org.hibernate.validator.constraints.Length;



/**
 * @author song
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode(callSuper = true)
@Component
public class User extends BaseModel {
    @Id
    @Positive(message = "ID必须为正整数")
    @NotNull(message = "ID必须存在", groups = {Update.class, Delete.class})
    @Min(value = 1, message = "ID必须是正整数", groups = {Select.class, Update.class, Delete.class})
    private Long id;

    @NotBlank(message = "用户名称不能为空", groups = {Insert.class})
    @Length(max = 50, min = 5, message = "用户名长度为5~50位")
    private String username;

    @Length(max=125, message = "头像最大长度为125位")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String avatar;

    @Enumeration(enumClass = UserStatusEnum.class)
    private Integer status;
    // 参数param为枚举的name值 @Enumeration(clazz = Role.class, method = "name", message = "role参数错误")
    // 参数param为枚举的value值(默认) @Enumeration(clazz = Role.class, method = "getValue", message = "role参数错误")
    // 参数param为枚举的desc值 @Enumeration(clazz = Role.class, method = "getDesc", message = "role参数错误")

    @Email
    private String email;

    @NotEmpty(message = "密码不能为空", groups = {Insert.class})
    @Length(min = 6, max = 20, message = "密码长度为6~20位")
    private String password;

    @Future(message = "创建时间不正确")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date created;

    @Future(message = "登录时间不正确")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date lastLogin;

    private List<Account> accounts;
}
