package com.example.model.admin;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

/**
 * @author song
 * 状态(1开启/2关闭)
 */
@AllArgsConstructor
public enum AdminStatusEnum {
    OPEN(1, "启用"),
    CLOSE(2, "禁用"),
    ;

    @Setter
    @Getter
    private Integer value;

    @Setter
    @Getter
    private String desc;

}
