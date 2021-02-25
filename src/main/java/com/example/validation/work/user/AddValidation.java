package com.example.validation.work.user;

import com.example.model.user.User;
import com.example.validation.BaseValidation;
import lombok.Data;

import javax.validation.Valid;

/**
 * @author song
 */
@Data
public class AddValidation extends BaseValidation {
    @Valid
    private User user;
}
