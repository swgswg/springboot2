package com.example.controller.v1;

import com.example.annotation.PageAnnotation;
import com.example.common.Result;
import com.example.common.util.ConverterUtil;
import com.example.common.util.IpUtil;
import com.example.common.util.PrintUtil;
import com.example.model.Insert;
import com.example.model.Page;
import com.example.model.admin.Admin;
import com.example.repository.AdminRepo;
import com.example.service.JwtService;
import com.example.validation.IdMustBePositiveInteger;
import com.example.validation.work.admin.EditValidate;
import com.example.validation.work.admin.IndexValidate;
import com.example.validation.work.admin.LoginValidate;
import com.example.validation.work.admin.SignUpValidate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @author song
 */
@Validated
@RestController
@RequestMapping("/api/v1/admin")
public class AdminController extends V1BaseController {
    @Autowired
    AdminRepo adminRepo;

    @PostMapping("/login")
    public Result login(@Validated() @RequestBody LoginValidate loginValidate, HttpServletRequest request) {
        Admin admin = adminRepo.login(loginValidate.getAdminName(), loginValidate.getPassword());

        // 修改登录信息
        adminRepo.updateLoginInfo(admin.getId(), IpUtil.getClientIpAddr(request));

        // 生成token
        String token = this.genTokenByAdminId(admin.getId());

        Map<String, String> data = new HashMap<>();
        data.put("token", token);
        data.put("expire", Long.toString(jwtService.getExpired() / 1000));

        return this.success(data);
    }

    @PostMapping("/logout")
    public Result logout(HttpServletRequest request) {
        long adminId = this.getAdminIdByToken(request);
        return this.success("退出成功");
    }

    @PostMapping("/signUp")
    public Result signUp(@Validated() @RequestBody SignUpValidate signUpValidate, HttpServletRequest request) {
        signUpValidate.setCreateAdminId(this.getAdminIdByToken(request));
        return this.success("注册成功", adminRepo.signUp(signUpValidate));
    }

    @PostMapping("/page")
    public Result index(@RequestBody IndexValidate data) {
        return this.success("获取分页数据", adminRepo.selectByWherePage(data));
    }

    @PostMapping("/show")
    public Result show(@Validated() @RequestBody IdMustBePositiveInteger id) {
        return this.success("获取管理员成功", adminRepo.selectByPk(id.getId()));
    }

    @PostMapping("/edit")
    public Result edit(@Validated() @RequestBody EditValidate edit) {
        return this.success("修改成功", adminRepo.edit(edit));
    }

    @PostMapping("/open")
    public Result open(@Validated() @RequestBody IdMustBePositiveInteger id) {
        return this.success("开启成功", adminRepo.open(id.getId()));
    }

    @PostMapping("/close")
    public Result close(@Validated() @RequestBody IdMustBePositiveInteger id) {
        return this.success("禁用成功", adminRepo.close(id.getId()));
    }

}
