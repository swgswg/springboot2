package com.example.service.upload;

import org.springframework.web.multipart.MultipartFile;
import java.util.ArrayList;
import java.util.List;

/**
 * @author song
 */
public class ImageUpload extends BaseUpload {
    public ImageUpload(MultipartFile file, String disk) {
        super(file, disk);
    }

    public ImageUpload(MultipartFile file, String disk,List<String> allowSuffix,long allowSize) {
        super(file, disk, allowSuffix, allowSize);
    }

    @Override
    protected void setAllowSize() {
        this.allowSuffix = new ArrayList<>();
        this.allowSuffix.add("jpeg");
        this.allowSuffix.add("jpg");
        this.allowSuffix.add("png");
        this.allowSuffix.add("gif");
    }

    @Override
    protected void setAllowSuffix() {
        this.allowSize = 1024;
    }
}
