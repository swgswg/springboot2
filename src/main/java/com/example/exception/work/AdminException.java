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
public class AdminException extends ApiException {
    ErrorCode errorCode = ErrorCode.ADMIN_ERROR;

    public AdminException(String message) {
        super(message);
    }

    public AdminException(ErrorCode errorCode) {
        this.errorCode = errorCode;
    }

    public AdminException(ErrorCode errorCode, String message) {
        super(errorCode, message);
    }
}
