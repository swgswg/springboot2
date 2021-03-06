package com.example.exception.work;

import com.example.constant.ErrorCode;
import com.example.exception.ApiException;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author song
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class JwtException extends ApiException {
    ErrorCode errorCode = ErrorCode.ILLEGAL_TOKEN;

    public JwtException(String message) {
        super(message);
    }

    public JwtException(ErrorCode errorCode) {
        this.errorCode = errorCode;
    }

    public JwtException(ErrorCode errorCode, String message) {
        super(errorCode, message);
    }
}
