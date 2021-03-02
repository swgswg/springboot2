package com.example.exception.work;

import com.example.constant.ErrorCode;
import com.example.exception.ApiException;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author song
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class AdminRoleException extends ApiException {
    ErrorCode errorCode = ErrorCode.ADMIN_ROLE_ERROR;

    public AdminRoleException(String message) {
        super(message);
    }

    public AdminRoleException(ErrorCode errorCode) {
        this.errorCode = errorCode;
    }

    public AdminRoleException(ErrorCode errorCode, String message) {
        super(errorCode, message);
    }
}
