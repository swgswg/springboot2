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
public class FileUploadException extends ApiException {
    ErrorCode errorCode = ErrorCode.FILE_UPLOAD_ERROR;

    public FileUploadException(String message) {
        super(message);
    }

    public FileUploadException(ErrorCode errorCode) {
        this.errorCode = errorCode;
    }

    public FileUploadException(ErrorCode errorCode, String message) {
        super(errorCode, message);
    }

}
