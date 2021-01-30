package com.example.controller;

import com.example.common.Result;
import com.example.constant.ErrorCode;
import org.springframework.web.bind.annotation.RestController;

import java.util.Objects;

/**
 * @author song
 */
public class BaseController {
    protected Result success(Object data) {
        return Result.success(data);
    }

    protected Result success(Object data, String message) {
        return Result.success(data, message);
    }

    protected Result fail(ErrorCode code) {
        return Result.fail(code);
    }
}
