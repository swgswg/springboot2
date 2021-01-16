package com.example.controller.v1;

import com.example.common.Result;
import com.example.controller.BaseController;
import com.example.model.Insert;
import com.example.model.Update;
import com.example.model.user.User;
import com.example.repository.UserRepo;
import com.example.validation.IdMustBePositiveInteger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * @author song
 */
@RestController
@RequestMapping("/v1/user")
@Validated
public class UserController extends BaseController {
    @Autowired
    UserRepo userRepo;

    @PostMapping("/get")
    public Result getUser(@Validated @RequestBody IdMustBePositiveInteger id) {
        return this.success(userRepo.getUser(id.getId()));
    }

    @PostMapping("/add")
    public Result add(@Validated({Insert.class}) @RequestBody User user) {
        return this.success(userRepo.create(user), "插入成功");
    }

    @PostMapping("/edit")
    public Result edit(@Validated({Update.class}) @RequestBody User user) {
        return this.success(userRepo.update(user), "修改成功");
    }

}
