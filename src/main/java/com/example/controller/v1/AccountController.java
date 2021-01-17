package com.example.controller.v1;

import com.example.common.Result;
import com.example.controller.BaseController;
import com.example.repository.AccountRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * @author song
 */
@RestController
@RequestMapping("/v1/account")
public class AccountController extends BaseController {
    @Autowired
    AccountRepo accountRepo;

    @PostMapping("/all")
    public Result findAll() {
        return this.success(accountRepo.findAll());
    }
}
