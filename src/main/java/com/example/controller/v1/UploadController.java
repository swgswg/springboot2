package com.example.controller.v1;

import com.example.common.Result;
import com.example.controller.BaseController;
import com.example.service.upload.UploadFactory;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author song
 */
@RestController
@RequestMapping("/v1")
public class UploadController extends BaseController {
    private final String disk = "E:\\install\\IntelliJ-IDEA\\Code\\springboot2\\src\\main\\resources\\static\\";

    @PostMapping("/upload")
    public Result upload(@RequestParam("image") MultipartFile file) {
        String path = UploadFactory.upload("image", file, disk);
        return this.success(path);
    }
}
