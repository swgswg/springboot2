package com.example.validation;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.stereotype.Component;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

/**
 * @author song
 */
@Data
@Component
@EqualsAndHashCode(callSuper = true)
public class IdMustBePositiveInteger extends BaseValidation {
    @NotNull(message = "id必须存在")
    @Min(value = 1, message = "id必须是正整数")
    private Long id;
}
