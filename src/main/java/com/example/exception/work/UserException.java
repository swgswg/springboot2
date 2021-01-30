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
public class UserException extends ApiException {
    ErrorCode errorCode = ErrorCode.USER_ERROR;

    public UserException(String message) {
        super(message);
    }

    public UserException(ErrorCode errorCode) {
        this.errorCode = errorCode;
    }

    public UserException(ErrorCode errorCode, String message) {
       super(errorCode, message);
    }
}
