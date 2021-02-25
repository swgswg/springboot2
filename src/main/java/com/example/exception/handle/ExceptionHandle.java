package com.example.exception.handle;

import com.example.common.Result;
import com.example.common.util.StringHelper;
import com.example.constant.ErrorCode;
import com.example.exception.ApiException;
import com.example.exception.BadRequestException;
import com.example.exception.ServerErrorException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.exc.InvalidFormatException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import java.util.*;

/**
 * @author song
 */
@Slf4j
@RestControllerAdvice
public class ExceptionHandle {
    @Value("${debug}")
    private static final boolean IS_DEBUG = false;

    /**
     * api接口错误
     * @param e
     * @return
     */
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    @ExceptionHandler(value = ApiException.class)
    public Result apiExceptionHandle(ApiException e) {
        return Result.fail(e.getErrorCode(), e.getMessage());
    }

    /**
     * 忽略参数异常处理器
     * @param e 忽略参数异常
     * @return ResponseResult
     */
    @ResponseBody
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(MissingServletRequestParameterException.class)
    public Result parameterMissingExceptionHandler(MissingServletRequestParameterException e) {
        return Result.fail(ErrorCode.ILLEGAL_ARGUMENT, "请求参数 " + e.getParameterName() + " 不能为空");
    }


    /**
     * 缺少请求体异常处理器
     * @param e 缺少请求体异常
     * @return ResponseResult
     */
    @ResponseBody
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(HttpMessageNotReadableException.class)
    public Result parameterBodyMissingExceptionHandler(HttpMessageNotReadableException e) {
        return Result.fail(ErrorCode.NOT_READABLE, "请求参数异常");
    }


    /**
     * @param e
     * @return
     */
    @ResponseBody
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(InvalidFormatException.class)
    public Result invalidFormatExceptionHandler(InvalidFormatException e){
        String errors = "";
        List<JsonMappingException.Reference> path = e.getPath();
        for(JsonMappingException.Reference reference : path){
            errors += "参数名："+reference.getFieldName()+" 输入不合法，需要的是 "+e.getTargetType().getName() + " 类型，"+"提交的值是："+e.getValue().toString();
        }
        return Result.fail(ErrorCode.INVALID_FORMAT, errors);
    }


    /**
     * 捕获方法参数校验异常
     * @param e
     * @return
     */
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(ConstraintViolationException.class)
    public Result constraintViolationExceptionHandler(ConstraintViolationException e){
        Set<ConstraintViolation<?>> message = e.getConstraintViolations();
        HashMap<String, Object> map = new HashMap<>();
        message.stream().forEach(msg -> {
            String path = msg.getPropertyPath().toString();
            String field = path.substring(path.indexOf(".")+1);
            map.put(field, msg.getMessageTemplate());
        });
        return Result.fail(ErrorCode.ILLEGAL_ARGUMENT, map.toString());
    }


    /**
     * 参数验证异常
     * @param e
     * @return
     */
    @ResponseBody
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public Result parameterExceptionHandler(MethodArgumentNotValidException e) {
        BindingResult bindingResult  = e.getBindingResult();
        // 判断异常中是否有错误信息，如果存在就使用异常中的消息，否则使用默认消息
        if (bindingResult.hasErrors()) {
            List<ObjectError> errors = bindingResult.getAllErrors();
            StringBuilder message = new StringBuilder();
            if (!errors.isEmpty()) {
                for (ObjectError error: errors) {
                    if (error instanceof FieldError) {
                        System.out.println(error.getClass().getName());
                        FieldError fieldError = (FieldError) error;
                        message.append(fieldError.getField()).append(error.getDefaultMessage());
                    } else if (error != null) {
                        message.append(error.getDefaultMessage());
                    }
                    message.append(",");
                }
                return Result.fail(ErrorCode.ILLEGAL_ARGUMENT, StringHelper.trimEnd(message.toString(), ","));
            }
        }
        return Result.fail(ErrorCode.ILLEGAL_ARGUMENT);
    }

    /**
     * 请求类型不支持
     * @param e
     * @return
     */
    @ResponseBody
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(HttpMediaTypeNotSupportedException.class)
    public Result httpMediaTypeNotSupportedExceptionHandler(HttpMediaTypeNotSupportedException e) {
        return Result.fail(ErrorCode.HTTP_MEDIA_TYPE_NOT_SUPPORTED, e.getMessage());
    }


    /**
     * 400错误
     * @param e
     * @return
     */
    @ResponseBody
    @ResponseStatus(value = HttpStatus.BAD_REQUEST)
    @ExceptionHandler(value = BadRequestException.class)
    public Result badRequestExceptionHandle(BadRequestException e) {
        log.error("httpStatus异常: " + e.getHttpStatus());
        return Result.result(e.getHttpStatus());
    }


    /**
     * 500错误
     * @param e
     * @return
     */
    @ResponseBody
    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(value = ServerErrorException.class)
    public Result serverErrorExceptionHandle(ServerErrorException e) {
        log.error("httpStatus异常: " + e.getHttpStatus());
        return Result.result(e.getHttpStatus());
    }


    /**
     * 运行时异常
     * @param e
     * @return
     */
    @ResponseBody
    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(value = RuntimeException.class)
    public Result runTimeExceptionHandle(RuntimeException e) {
        log.error("运行时异常: " + e.getMessage(), e);
        return Result.result(HttpStatus.INTERNAL_SERVER_ERROR, this.getMessage(e));
    }


    /**
     * 未知异常--未捕获到的异常
     * @param e
     * @return
     */
    @ResponseBody
    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(value = Exception.class)
    public Result exceptionHandle(Exception e) {
        if (e instanceof HttpMessageNotReadableException) {
            return Result.result(HttpStatus.BAD_REQUEST, e.getMessage().substring(0, e.getMessage().indexOf(":")));
        }
        log.error("未知异常: " + e.getMessage(), e);
        return Result.result(HttpStatus.INTERNAL_SERVER_ERROR, this.getMessage(e));
    }


    private String getMessage(Exception e) {
        String msg = "服务器错误";
        if (IS_DEBUG) {
            msg = e.getMessage();
        }
        return msg;
    }

}
