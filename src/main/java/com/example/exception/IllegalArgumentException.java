package com.example.exception;

import com.example.constant.ErrorCode;
import com.example.exception.ApiException;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author song
 * 参数不合法
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class IllegalArgumentException extends ApiException {
    ErrorCode errorCode = ErrorCode.ILLEGAL_ARGUMENT;
    public IllegalArgumentException(String message) {
        super(message);
    }
}
