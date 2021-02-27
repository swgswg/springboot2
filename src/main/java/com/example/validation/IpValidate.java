package com.example.validation;

import com.example.validation.validator.IP;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * @author song
 */
@Data
public class IpValidate extends BaseValidate {
    @NotNull(message = "ip必须存在")
    @IP()
    private String ip;
}
