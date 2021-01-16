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
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class ServerErrorException extends HttpException {
    HttpStatus httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;

    public ServerErrorException(String message) {
        super(message);
    }
}
