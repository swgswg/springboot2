package com.example.model.account;

import com.example.model.BaseModel;
import com.example.model.Insert;
import com.example.model.user.User;
import lombok.*;
import org.springframework.data.annotation.Id;
import org.springframework.stereotype.Component;

import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;

/**
 * @author song
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode(callSuper = true)
@Component
public class Account extends BaseModel {
    @Id
    @NotNull(groups = {Insert.class})
    @NotEmpty(groups = {Insert.class})
    @Positive
    @Min(value = 1)
    private Long id;

    @NotNull(groups = {Insert.class})
    @NotEmpty(groups = {Insert.class})
    @Positive
    @Min(value = 1)
    private Long uid;

    @NotNull
    @NotEmpty
    @Positive
    @Min(value = 1)
    private Integer money;

    // 从表实体应该包含一个主表实体的对象引用
    @Valid
    private User user;
}
