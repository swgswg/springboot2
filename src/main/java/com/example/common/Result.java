package com.example.common;

import com.example.constant.ErrorCode;
import lombok.Data;
import lombok.ToString;
import org.apache.commons.lang.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

import java.io.Serializable;

@Data
@ToString
@Component
public class Result implements Serializable {

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
     * @param data
     * @return
     */
    public static Result success(Object data) {
        return result(ErrorCode.SUCCESS, data);
    }

    /**
     * 请求成功
     * @param data
     * @return
     */
    public static Result success(Object data, String message) {
        return result(ErrorCode.SUCCESS, message, data);
    }


    /**
     * 请求失败
     * @param errorCode
     * @return
     */
    public static Result fail(ErrorCode errorCode) {
        return result(errorCode);
    }

    public static Result fail(ErrorCode errorCode, String message) {
        return result(errorCode, message);
    }


    /**
     * @param errorCode
     * @return
     */
    public static Result result(ErrorCode errorCode) {
        return result(errorCode, "", null);
    }


    /**
     * @param errorCode
     * @param data
     * @return
     */
    public static Result result(ErrorCode errorCode, Object data) {
        return result(errorCode, "", data);
    }


    /**
     * @param errorCode
     * @param message
     * @return
     */
    public static Result result(ErrorCode errorCode, String message) {
        return result(errorCode, message, null);
    }

    /**
     * @param errorCode
     * @param message
     * @return
     */
    public static Result result(ErrorCode errorCode, String message, Object data) {
        if (StringUtils.isBlank(message)) {
            message = errorCode.getDesc();
        }
        return result(errorCode.getCode(), message, data);
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
        return result(httpStatus.value(), message, null);
    }


    /**
     * 返回值定义
     * @param state
     * @param message
     * @param data
     * @return
     */
    public static Result result(int state, String message, Object data) {
        Result result = new Result();
        result.setState(state);
        result.setMessage(message);
        result.setData(data);
        return result;
    }

}
