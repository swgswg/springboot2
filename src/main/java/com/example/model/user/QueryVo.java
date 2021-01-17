package com.example.model.user;

import lombok.Data;

import javax.validation.Valid;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;

@Data
public class QueryVo {
    @Valid
    private User user;

    @NotNull(message = "ID集合不能为空")
    @NotEmpty(message = "ID集合不能为空")
    private List<Integer> ids;

}
