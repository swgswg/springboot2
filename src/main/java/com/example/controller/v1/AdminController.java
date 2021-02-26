package com.example.controller.v1;

import com.example.common.Result;
import com.example.common.util.ConverterUtil;
import com.example.common.util.IpUtil;
import com.example.model.Insert;
import com.example.model.Page;
import com.example.model.admin.Admin;
import com.example.repository.AdminRepo;
import com.example.service.JwtService;
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

    @Autowired
    JwtService jwtService;

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
        adminRepo.signUp(signUpValidate);
        return this.success("注册成功");
    }


    @PostMapping("/page")
    public Result index(@RequestBody IndexValidate data) {
        return this.success(adminRepo.selectPage(data));
    }


    private String genTokenByAdminId(long id) {
        Map<String, Long> idMap = new HashMap<>(1);
        idMap.put("id", id);
        return jwtService.encode(idMap);
    }

    private long getAdminIdByToken(HttpServletRequest request) {
        String token = request.getHeader("token");
        return Long.parseLong(jwtService.getClaimsByKey(token, "id").toString());
    }

}
