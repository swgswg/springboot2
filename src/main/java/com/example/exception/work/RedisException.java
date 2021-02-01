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
public class RedisException extends ApiException {
    ErrorCode errorCode = ErrorCode.REDIS_ERROR;

    public RedisException(String message) {
        super(message);
    }

    public RedisException(ErrorCode errorCode) {
        this.errorCode = errorCode;
    }

    public RedisException(ErrorCode errorCode, String message) {
        super(errorCode, message);
    }
}
