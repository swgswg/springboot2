package com.example.constant;


/**
 * @author song
 */

public enum ErrorCode {
    // 成功 失败
    SUCCESS(1000, "请求成功"),
    FAIL(1001, "请求失败"),

    // 10  开头为 通用错误
    ILLEGAL_ARGUMENT(100002, "无效的请求参数"),
    ILLEGAL_TOKEN(100003, "令牌不合法"),
    NOT_READABLE(100004, "缺少请求体"),
    INVALID_FORMAT(100005, "请求参数不合法"),
    HTTP_CLIENT_ERROR(100006, "HTTP客户端错误"),
    HTTP_MEDIA_TYPE_NOT_SUPPORTED(100007, "HTTP请求类型不支持"),
    REDIS_ERROR(100008, "redis错误"),

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

    // 11开头为文件上传错误
    FILE_UPLOAD_ERROR(110000, "文件上传错误"),
    FILE_UPLOAD_SUFFIX_NOT_ALLOWED(110001, "上传文件类型不支持"),
    FILE_UPLOAD_SIZE_NOT_ALLOWED(110002, "上传文件过大"),
    FILE_UPLOAD_TYPE_NOT_ALLOWED(110003, "上传类型不支持"),

    // 12 开头为用户错误
    USER_ERROR(120000, "用户错误"),
    USER_SELECT_ERROR(120001, "查询用户错误"),
    USER_INSERT_ERROR(120002, "添加用户错误"),
    USER_UPDATE_ERROR(120003, "修改用户错误"),
    USER_DELETE_ERROR(120004, "删除用户错误"),

    // 13开头为菜单错误
    MENU_ERROR(130000, "菜单错误"),
    MENU_SELECT_ERROR(130001, "查询菜单错误"),
    MENU_INSERT_ERROR(130002, "添加菜单错误"),
    MENU_UPDATE_ERROR(130003, "修改菜单错误"),
    MENU_DELETE_ERROR(130004, "删除菜单错误"),

    // 14开头为管理员错误
    ADMIN_ERROR(140000, "管理员错误"),
    ADMIN_NOT_EXIST(140001, "管理员不存在"),
    ADMIN_NAME_OR_PWD_ERROR(140002, "用户名或密码错误"),
    ADMIN_CLOSED(140002, "管理员已禁用"),
    ADMIN_CREATED_ERROR(140003, "添加失败"),
    ADMIN_UPDATED_ERROR(140003, "修改失败"),
    ;

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
