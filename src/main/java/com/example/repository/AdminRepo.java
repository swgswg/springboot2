package com.example.repository;

import com.example.model.admin.Admin;
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
