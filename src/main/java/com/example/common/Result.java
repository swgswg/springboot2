package com.example.common;

import com.example.constant.ErrorCode;
import lombok.Data;
import lombok.ToString;
import org.apache.commons.lang.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

import java.io.Serializable;

/**
 * @author song
 */
@Data
@ToString
@Component
public class Result implements Serializable {

    /**
     * 状态
     */
    private boolean status;

    /**
     * 自定义错误码
     */
    private int state;

    /**
     * 说明
     */
    private String message;

    /**
     * 数据
     */
    private Object data;


    /**
     * 请求成功
     * @param message
     * @return
     */
    public static Result success(String message) {
        return result(true,  ErrorCode.SUCCESS, message, null);
    }


    /**
     * 请求成功
     * @param data
     * @return
     */
    public static Result success(Object data) {
        return result(true, ErrorCode.SUCCESS, data);
    }

    /**
     * 请求成功
     * @param data
     * @return
     */
    public static Result success(String message, Object data) {
        return result(true, ErrorCode.SUCCESS, message, data);
    }


    /**
     * 请求失败
     * @param errorCode
     * @return
     */
    public static Result fail(ErrorCode errorCode) {
        return result(false, errorCode);
    }

    public static Result fail(ErrorCode errorCode, String message) {
        return result(false, errorCode, message);
    }


    /**
     * @param errorCode
     * @return
     */
    public static Result result(boolean status, ErrorCode errorCode) {
        return result(status, errorCode, "", null);
    }


    /**
     * @param errorCode
     * @param data
     * @return
     */
    public static Result result(boolean status, ErrorCode errorCode, Object data) {
        return result(status, errorCode, "", data);
    }


    /**
     * @param errorCode
     * @param message
     * @return
     */
    public static Result result(boolean status, ErrorCode errorCode, String message) {
        return result(status, errorCode, message, null);
    }

    /**
     * @param errorCode
     * @param message
     * @return
     */
    public static Result result(boolean status, ErrorCode errorCode, String message, Object data) {
        if (StringUtils.isBlank(message)) {
            message = errorCode.getDesc();
        }
        return result(status, errorCode.getCode(), message, data);
    }

    /**
     * http错误
     * @param httpStatus
     * @return
     */
    public static Result result(HttpStatus httpStatus) {
        return result(httpStatus, "");
    }

    /**
     * http错误
     * @param httpStatus
     * @return
     */
    public static Result result(HttpStatus httpStatus, String message) {
        if (StringUtils.isBlank(message)) {
            message = httpStatus.getReasonPhrase();
        }
        return result(false ,httpStatus.value(), message, null);
    }


    /**
     * 返回值定义
     * @param state
     * @param message
     * @param data
     * @return
     */
    public static Result result(boolean status, int state, String message, Object data) {
        Result result = new Result();
        result.setStatus(status);
        result.setState(state);
        result.setMessage(message);
        result.setData(data);
        return result;
    }

}
