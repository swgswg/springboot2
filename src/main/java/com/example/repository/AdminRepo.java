package com.example.repository;

import com.example.model.admin.Admin;
import com.example.validation.work.admin.EditValidate;
import com.example.validation.work.admin.IndexValidate;
import com.example.validation.work.admin.SignUpValidate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


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
    @Transactional(rollbackFor = Exception.class)
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
     * 通过条件查询
     * @param data
     * @return
     */
    List<Admin> selectByWhere(IndexValidate data);

    /**
     * 通过条件查询
     * 分页
     * @param data
     * @return
     */
    Object selectByWherePage(IndexValidate data);

    /**
     * 通过主键查找
     * @param id
     * @return
     */
    Admin selectByPk(long id);

    /**
     * 修改
     * @param data
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    boolean edit(EditValidate data);

    /**
     * 启用
     * @param id
     * @return
     */
    boolean open(Long id);

    /**
     * 禁用
     * @param id
     * @return
     */
    boolean close(Long id);

    /**
     * 添加
     * @param admin
     * @return
     */
    Long create(Admin admin);

    /**
     * 修改
     * @param adminModel
     * @return
     */
    boolean update(Admin adminModel);

}
