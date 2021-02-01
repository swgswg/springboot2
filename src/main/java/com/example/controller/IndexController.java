package com.example.controller;

import com.example.common.Result;
import com.example.common.util.HttpServletRequestUtil;
import com.example.repository.UserRepo;
import com.example.service.RedisService;
import com.example.validation.IdMustBePositiveInteger;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
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

        return this.success("a", (Object) null);
    }

}
