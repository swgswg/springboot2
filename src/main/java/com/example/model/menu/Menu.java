package com.example.model.menu;

import com.example.model.*;
import com.example.model.user.UserStatusEnum;
import com.example.validation.validator.Enumeration;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import org.hibernate.validator.constraints.Length;
import org.springframework.data.annotation.Id;
import org.springframework.stereotype.Component;

import javax.validation.constraints.*;
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
public class Menu extends BaseModel {
    @Id
    @Positive(message = "ID必须为正整数")
    @NotNull(message = "ID必须存在", groups = {Update.class, Delete.class})
    @Min(value = 1, message = "ID必须是正整数", groups = {Select.class, Update.class, Delete.class})
    private int id;

    @Positive(message = "父ID必须为正整数")
    @NotNull(message = "父ID必须存在", groups = {Update.class, Delete.class})
    @Min(value = 0, message = "父ID必须是正整数", groups = {Select.class, Update.class, Delete.class})
    private int parentId;

    @NotBlank(message = "菜单名称不能为空", groups = {Insert.class})
    @Length(max = 50, min = 5, message = "菜单名称长度为5~50位")
    private String menuName;

    @NotBlank(message = "菜单地址不能为空", groups = {Insert.class})
    @Length(max = 100, min = 5, message = "菜单地址长度为5~100位")
    private String url;

    @Enumeration(enumClass = MenuTypeEnum.class)
    private int type;

    @NotBlank(message = "授权权限不能为空", groups = {Insert.class})
    @Length(max = 20, min = 1, message = "授权权限长度为1~20位")
    private String auth;

    @NotBlank(message = "菜单icon不能为空", groups = {Insert.class})
    @Length(max = 20, min = 1, message = "菜单icon长度为1~20位")
    private String icon;

    @Positive(message = "排序必须为正整数")
    @NotNull(message = "排序必须存在", groups = {Update.class, Delete.class})
    @Min(value = 0, message = "排序必须是正整数", groups = {Select.class, Update.class, Delete.class})
    private int sort;

    @Future(message = "创建时间不正确")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date createTime;

    @Future(message = "修改时间不正确")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private Date updateTime;

    /**
     * 子菜单
     */
    private List<Menu> children;
}
