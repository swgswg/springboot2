package com.example.constant;


/**
 * @author song
 */

public enum ErrorCode {
    //10  开头为 通用错误
    SUCCESS(100000, "请求成功"),
    FAIL(100001, "请求失败"),
    ILLEGAL_ARGUMENT(100002, "无效的请求参数"),
    ILLEGAL_TOKEN(100003, "令牌不合法"),
    NOT_READABLE(100004, "缺少请求体"),
    INVALID_FORMAT(100005, "请求参数不合法"),

//    100004 => '尝试非法操作',
//    100005 => '无权限访问',
//    100006 => '授权失败（第三方应用账号登陆失败)',
//    100007 => '授权失败（服务器缓存异常）',
//    100009 => '授权失败（数据库异常)',
//    100010 => '加解密错误',
//    100011 => '访问过于频繁',
//    100012 => 'token检验未通过',
//    100013 => '速率限制错误',
//    100014 => '请求客户端错误',

    // 11 开头为用户错误
    USER_ERROR(110000, "用户错误"),
    USER_SELECT_ERROR(110001, "查询用户错误"),
    USER_INSERT_ERROR(110002, "添加用户错误"),
    USER_UPDATE_ERROR(110003, "修改用户错误"),
    USER_DELETE_ERROR(110004, "删除用户错误");

    int code;
    String desc;

    ErrorCode(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public int getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }

    @Override
    public String toString() {
        return "ErrorCode{" +
                "code=" + code +
                ", desc='" + desc + '\'' +
                '}';
    }

}
