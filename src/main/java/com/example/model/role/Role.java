package com.example.model.role;

import com.example.model.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.hibernate.validator.constraints.Length;
import org.springframework.data.annotation.Id;
import org.springframework.stereotype.Component;

import javax.validation.constraints.*;
import java.util.Date;

/**
 * @author song
 */
@Data
@Component
public class Role extends BaseModel {
    @Id
    @Positive(message = "ID必须为正整数")
    @NotNull(message = "ID必须存在", groups = {Update.class, Delete.class})
    @Min(value = 1, message = "ID必须是正整数", groups = {Select.class, Update.class, Delete.class})
    private Long id;

    @NotBlank(message = "角色名称不能为空", groups = {Insert.class})
    @Length(max = 50, min = 1, message = "角色名称长度为1~50位")
    private String roleName;

    @Length(max = 255, min = 1, message = "备注长度为1~255位", groups = {Insert.class, Update.class})
    private String remark;

    @Future(message = "创建时间不正确", groups = {Select.class, Update.class, Insert.class})
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date createTime;

    @Future(message = "创建时间不正确", groups = {Select.class, Update.class, Insert.class})
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date updateTime;
}
