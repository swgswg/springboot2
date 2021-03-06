package com.example.model.adminrole;

import com.example.model.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import org.springframework.data.annotation.Id;
import org.springframework.stereotype.Component;

import javax.validation.constraints.Future;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;
import java.util.Date;
import java.util.List;

/**
 * @author song
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode(callSuper = true)
@Component
public class AdminRole extends BaseModel {
    @Id
    @Positive(message = "ID必须为正整数")
    @NotNull(message = "ID必须存在")
    @Min(value = 1, message = "ID必须是正整数")
    private Long id;

    @Positive(message = "管理员ID必须为正整数")
    @NotNull(message = "管理员ID必须存在")
    @Min(value = 1, message = "管理员ID必须是正整数")
    private Long adminId;

    @Positive(message = "角色ID必须为正整数")
    @NotNull(message = "角色ID必须存在")
    @Min(value = 1, message = "角色ID必须是正整数")
    private Long roleId;

    @Future(message = "创建时间不正确", groups = {Select.class, Update.class, Insert.class})
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date createTime;

    private List<Long> roleIds;
}
