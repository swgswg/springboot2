package com.example.controller;

import com.example.annotation.ResponseResult;
import com.example.common.Result;
import com.example.common.util.HttpServletRequestUtil;
import com.example.common.util.PrintUtil;
import com.example.model.adminrole.AdminRole;
import com.example.repository.AdminRoleRepo;
import com.example.repository.UserRepo;
import com.example.service.RedisService;
import com.example.service.thirdPartApi.gaoDeMap.IpLocation;
import com.example.validation.IdMustBePositiveInteger;
import com.example.validation.IpValidate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author song
 */
@Validated
@RequestMapping("/")
@RestController
public class IndexController extends BaseController {
    @Autowired
    UserRepo userRepo;

    @Autowired
    RedisService redis;

    @Autowired
    AdminRoleRepo adminRoleRepo;

    @RequestMapping(value = "/index")
    public Result index() {
        return this.success("11111");
    }

    @RequestMapping(value = "/suc")
//    @LogAnnotation(description = "获取所有用户信息", clazz = User.class)
    public Result suc(HttpServletRequest request) {
//        HttpServletRequestUtil.getParam(request);
//        System.out.println(HttpServletRequestUtil.postParam(request));
        Map<String, Object> map = HttpServletRequestUtil.postJsonParam(request);
        for(Map.Entry<String, Object> entry : map.entrySet()){
            String mapKey = entry.getKey();
            Object mapValue = entry.getValue();
            System.out.println(mapKey+":"+mapValue);
        }
        return this.success("success");
    }


    @RequestMapping(value = "/succ")
    public Result succ(@RequestBody Map<String, Object> params) {
        System.out.println(params.get("c"));
        return this.success(params);
    }


    @RequestMapping(value = "/valid")
    public Result verifyValid(@Valid @RequestBody IdMustBePositiveInteger id) {
        return this.success(id);
    }

    @RequestMapping(value = "/rdsset")
    public Result rdsSet() {
        redis.set("a", "1111");
        return this.success("redis set");
    }

    @RequestMapping(value = "/rdsget")
    public Result rdsGet() {
        return this.success(redis.get("list-test-key3"));
    }


    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping(value = "/log")
    public Result log() {
        logger.debug("debug 日志");
        logger.info("info 日志");
        logger.warn("warn 日志");
        logger.error("error 日志");

        return this.success("a", MDC.get("traceId"));
    }

    @RequestMapping(value = "responseResult")
    @ResponseResult
    public Map<String, String> responseResult() {
        Map<String, String> map = new HashMap<>();
        map.put("a", "1111");
        map.put("b", "2222");
        map.put("c", "3333");
        return map;
    }


    @RequestMapping(value = "crypt")
    @ResponseResult
    public Result crypt() throws NoSuchAlgorithmException {
        String content = "123456";
        MessageDigest sha = MessageDigest.getInstance("SHA1");
        byte[] sha_byte = sha.digest(content.getBytes());
        StringBuilder hexValue = new StringBuilder();
        for (byte b : sha_byte) {
            //将其中的每个字节转成十六进制字符串：byte类型的数据最高位是符号位，通过和0xff进行与操作，转换为int类型的正整数。
            String toHexString = Integer.toHexString(b & 0xff);
            hexValue.append(toHexString.length() == 1 ? "0" + toHexString : toHexString);
        }
        return this.success("加解密", hexValue.toString());
    }

    @PostMapping("/ip")
    public Result ip(@Valid @RequestBody IpValidate ip) {
        Map<String, Object> param = new HashMap<>();
        return this.success("获取IP地址", (new IpLocation().third(ip.getIp())));
    }

    @PostMapping("/admin-role")
    public Result adminRole(HttpServletRequest request) {
        List<AdminRole> roleIds = adminRoleRepo.selectByWhere(null);
        PrintUtil.print(roleIds);
        return this.success("admin-role", roleIds);
    }

}
