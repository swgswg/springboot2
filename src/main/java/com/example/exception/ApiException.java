package com.example.exception;


import com.example.constant.ErrorCode;
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
public class ApiException extends RuntimeException {
    private ErrorCode errorCode = ErrorCode.FAIL;

    public ApiException(String message) {
        super(message);
    }

    public ApiException(ErrorCode errorCode) {
        this.errorCode = errorCode;
    }

    public ApiException(ErrorCode errorCode, String message) {
        super(message);
        this.errorCode = errorCode;
    }
}
