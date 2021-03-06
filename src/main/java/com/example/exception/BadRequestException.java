package com.example.exception;

import com.example.exception.HttpException;
import lombok.AllArgsConstructor;
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
public class BadRequestException extends HttpException {
    HttpStatus httpStatus = HttpStatus.BAD_REQUEST;

    public BadRequestException(String message) {
        super(message);
    }

    public BadRequestException(HttpStatus httpStatus) {
        super(httpStatus);
    }

    public BadRequestException(HttpStatus httpStatus, String message) {
        super(httpStatus, message);
    }
}
