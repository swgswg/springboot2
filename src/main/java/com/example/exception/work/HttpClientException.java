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
public class HttpClientException extends ApiException {
    ErrorCode errorCode = ErrorCode.HTTP_CLIENT_ERROR;

    public HttpClientException(String message) {
        super(message);
    }

    public HttpClientException(ErrorCode errorCode) {
        this.errorCode = errorCode;
    }

    public HttpClientException(ErrorCode errorCode, String message) {
        super(errorCode, message);
    }
}
