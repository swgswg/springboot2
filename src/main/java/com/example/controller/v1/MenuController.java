package com.example.controller.v1;

import com.example.common.Result;
import com.example.controller.BaseController;
import com.example.repository.MenuRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author song
 */
@RestController
@RequestMapping("/api/v1/menu")
@Validated
public class MenuController extends V1BaseController {
    @Autowired
    MenuRepo menuRepo;

    @PostMapping("/index")
    public Result index() {
        return this.success(menuRepo.all2());
    }

    @PostMapping("/tree")
    public Result tree() {
        return this.success(menuRepo.menuTree2());
    }

}
