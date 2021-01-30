package com.example.exception;

import com.example.constant.ErrorCode;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpStatus;

/**
 * @author song
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class HttpException extends RuntimeException {
    private HttpStatus httpStatus = HttpStatus.OK;

    public HttpException(String message) {
        super(message);
    }

    public HttpException(HttpStatus httpStatus) {
        this.httpStatus = httpStatus;
    }

    public HttpException(HttpStatus httpStatus, String message) {
        super(message);
        this.httpStatus = httpStatus;
    }
}
