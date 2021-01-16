package com.example.controller;

import com.example.common.Result;
import com.example.common.util.HttpServletRequestUtil;
import com.example.repository.UserRepo;
import com.example.validation.IdMustBePositiveInteger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Map;


/**
 * @author song
 */
@RestController
@RequestMapping("/")
@Validated
public class IndexController extends BaseController {
    @Autowired
    UserRepo userRepo;

    @RequestMapping(value = "/index")
    @ResponseBody
    public Result index() {
        return this.success("11111");
    }

    @RequestMapping(value = "/suc")
    @ResponseBody
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
    @ResponseBody
    public Result succ(@RequestBody Map<String, Object> params) {
        System.out.println(params.get("c"));
        return this.success(params);
    }


    @RequestMapping(value = "/valid")
    @ResponseBody
    public Result verifyValid(@Valid @RequestBody IdMustBePositiveInteger id) {
        return this.success(id);
    }

}
