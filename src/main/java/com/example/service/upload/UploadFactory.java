package com.example.service.upload;

import com.example.constant.ErrorCode;
import com.example.exception.work.FileUploadException;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author song
 */
public class UploadFactory {
    public static BaseUpload uploadFactory(String type, MultipartFile file, String disk) {
        switch (type) {
            case "image":
                return new ImageUpload(file, disk);
            default:
                throw new FileUploadException(ErrorCode.FILE_UPLOAD_TYPE_NOT_ALLOWED);
        }
    }


    public static String upload(String type, MultipartFile file, String disk) {
        BaseUpload upload = uploadFactory(type, file, disk);
        upload.move();
        return upload.getNewFilename();
    }
}
