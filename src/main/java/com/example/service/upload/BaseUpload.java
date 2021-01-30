package com.example.service.upload;

import com.example.common.util.StringHelper;
import com.example.constant.ErrorCode;
import com.example.exception.work.FileUploadException;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author song
 */
@Data
public class BaseUpload {
    protected MultipartFile file;
    protected String originFilename;
    protected String suffix;
    protected long fileSize;
    protected String newFilename;
    protected String disk;
    protected List<String> allowSuffix;
    protected long allowSize;

    public BaseUpload(MultipartFile file, String disk) {
        this.file = file;
        this.disk = disk;
        this.setAllowSuffix();
        this.setAllowSize();
        this.setOriginFilename();
        this.setSuffix();
        this.setFileSize();
        this.setNewFilename();
    }

    public BaseUpload(MultipartFile file, String disk, List<String> allowSuffix, long allowSize) {
        this.file = file;
        this.disk = disk;
        this.allowSuffix = allowSuffix;
        this.allowSize = allowSize;
        this.setOriginFilename();
        this.setSuffix();
        this.setFileSize();
        this.setNewFilename();
    }


    protected void setAllowSize() {
    }

    protected void setAllowSuffix() {
    }


    /**
     * 原文件名称
     */
    protected void setOriginFilename() {
        this.originFilename = file.getOriginalFilename();
    }


    /**
     * 文件后缀名
     */
    protected void setSuffix() {
        String filename = this.getOriginFilename();
        int dotIndex = filename.lastIndexOf(".");
        if (dotIndex == -1) {
             this.suffix = "";
        } else {
            this.suffix = filename.substring(dotIndex + 1);
        }
        this.checkSuffix();
    }


    /**
     * 校验后缀名
     */
    protected void checkSuffix() {
        if ((allowSuffix != null) && (allowSuffix.size() > 0)) {
            if (!allowSuffix.contains(this.suffix)) {
                throw new FileUploadException(ErrorCode.FILE_UPLOAD_SUFFIX_NOT_ALLOWED);
            }
        }
    }


    /**
     * 源文件大小
     */
    protected void setFileSize() {
        this.fileSize = this.file.getSize();
        this.checkFileSize();
    }


    /**
     * 校验文件大小
     */
    protected void checkFileSize() {
        if (allowSize > 0) {
            if (this.fileSize > allowSize) {
                throw new FileUploadException(ErrorCode.FILE_UPLOAD_SIZE_NOT_ALLOWED);
            }
        }
    }


    /**
     * 获取新文件名
     */
    protected void setNewFilename() {
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        String nowTime = df.format(new Date());
        this.newFilename = nowTime + StringHelper.getCheckCode(6) + "." + this.suffix;
    }


    /**
     * 移动文件到指定文件夹
     * @return
     */
    protected boolean move() {
        try{
            File file = new File(this.getDisk() + this.getNewFilename());
            this.file.transferTo(file);
            return true;
        } catch (IllegalStateException | IOException e) {
            throw new FileUploadException(e.getMessage());
        }
    }

}
