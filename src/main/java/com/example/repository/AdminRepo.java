package com.example.repository;

import com.example.model.PageResult;
import com.example.model.admin.Admin;
import com.example.validation.work.admin.IndexValidate;
import com.example.validation.work.admin.SignUpValidate;
import org.springframework.stereotype.Component;


/**
 * @author song
 */
@Component
public interface AdminRepo {
    /**
     * 登录
     * @param adminName
     * @param password
     * @return
     */
    Admin login(String adminName, String password);

    /**
     * 注册
     * @param signUpValidate
     * @return
     */
    boolean signUp(SignUpValidate signUpValidate);


    /**
     * 根据名称获取管理员
     * @param adminName
     * @param isThrowException
     * @return
     */
    Admin getAdminByName(String adminName, boolean isThrowException);


    /**
     * 修改登录信息
     * @param id
     * @param ip
     * @return
     */
    boolean updateLoginInfo(long id, String ip);

    /**
     * 分页查询
     * @param data
     * @return
     */
    PageResult selectPage(IndexValidate data);

    /**
     * 通过主键查找
     * @param id
     * @return
     */
    Admin selectByPk(long id);

    /**
     * 添加
     * @param adminModel
     * @return
     */
    boolean create(Admin adminModel);

    /**
     * 修改
     * @param adminModel
     * @return
     */
    boolean update(Admin adminModel);
}
