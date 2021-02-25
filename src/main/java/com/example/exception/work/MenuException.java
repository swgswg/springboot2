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
public class MenuException extends ApiException {
    ErrorCode errorCode = ErrorCode.MENU_ERROR;

    public MenuException(String message) {
        super(message);
    }

    public MenuException(ErrorCode errorCode) {
        this.errorCode = errorCode;
    }

    public MenuException(ErrorCode errorCode, String message) {
        super(errorCode, message);
    }
}
