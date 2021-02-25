package com.example.controller;

import com.example.common.Result;
import com.example.constant.ErrorCode;
import com.example.service.JwtService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import java.util.Objects;

/**
 * @author song
 */
public class BaseController {
    protected Result success() {
        return this.success("请求成功", null);
    }


    protected Result success(String message) {
        return this.success(message, null);
    }


    protected Result success(Object data) {
        return this.success("请求成功", data);
    }


    protected Result success(String message, Object data) {
        return Result.success(message, data);
    }

    protected Result fail(ErrorCode code) {
        return Result.fail(code);
    }
}
