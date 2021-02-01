package com.example.model.user;

import com.example.validation.validator.DateFormat;
import com.example.validation.validator.Enumeration;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;

/**
 * @author song
 */
@Data
public class QueryVo {
    @NotEmpty(message = "ID集合不能为空")
    private List<Integer> ids;

    @NotEmpty(message = "用户名不能为空")
    @Length(min = 1, max = 64)
    private String username;

    @Email(message = "邮箱格式不正确")
    private String email;

    @Enumeration(enumClass = UserStatusEnum.class)
    private int status;

    @DateFormat(format = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    @DateFormat(format = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;
}
