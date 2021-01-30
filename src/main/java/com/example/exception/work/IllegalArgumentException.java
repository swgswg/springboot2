package com.example.exception.work;

import com.example.constant.ErrorCode;
import com.example.exception.ApiException;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpStatus;

/**
 * @author song
 * 参数不合法
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class IllegalArgumentException extends ApiException {
    ErrorCode errorCode = ErrorCode.ILLEGAL_ARGUMENT;

    public IllegalArgumentException(String message) {
        super(message);
    }

    public IllegalArgumentException(ErrorCode errorCode) {
        super(errorCode);
    }

    public IllegalArgumentException(ErrorCode errorCode, String message) {
        super(errorCode, message);
    }
}
