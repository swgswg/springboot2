package com.example.repository.impl;

import com.example.constant.ErrorCode;
import com.example.exception.work.AdminException;
import com.example.mapper.AdminMapper;
import com.example.model.admin.Admin;
import com.example.model.admin.AdminStatusEnum;
import com.example.repository.AdminRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;


/**
 * @author song
 */
@Service
public class AdminRepoImpl implements AdminRepo {
    @Autowired
    AdminMapper adminMapper;

    @Override
    public Admin login(String adminName, String password) {
        Admin admin = this.getAdminByName(adminName, true);
        if (!Admin.passwordEncrypt(password).equals(admin.getPassword())) {
            throw new AdminException(ErrorCode.ADMIN_NAME_OR_PWD_ERROR);
        }

        if (!admin.getStatus().equals(AdminStatusEnum.OPEN.getValue())) {
            throw new AdminException(ErrorCode.ADMIN_CLOSED);
        }

        return admin;
    }

    /**
     * 根据名称获取管理员
     * @return
     */
    @Override
    public Admin getAdminByName(String adminName, boolean isThrowException) {
        Admin admin = adminMapper.getAdminByName(adminName);
        if (admin == null && isThrowException) {
            throw new AdminException(ErrorCode.ADMIN_NOT_EXIST);
        }
        return admin;
    }

    /**
     * 修改登录信息
     * @param id
     * @param ip
     * @return
     */
    @Override
    public boolean updateLoginInfo(long id, String ip) {
        Admin admin = new Admin();
        admin.setId(id);
        admin.setLastLoginIp(ip);
        admin.setLastLoginTime(new Date());
        return this.update(admin);
    }


    /**
     * 添加
     * @param admin
     * @return
     */
    @Override
    public boolean create(Admin admin) {
        if (admin == null) {
            throw new AdminException("缺少参数");
        }
        admin.setCreateTime(new Date());
        boolean res = adminMapper.create(admin);
        if (!res) {
            throw new AdminException(ErrorCode.ADMIN_CREATED_ERROR);
        }

        return true;
    }

    /**
     * 修改
     * @param admin
     * @return
     */
    @Override
    public boolean update(Admin admin) {
        if (admin == null) {
            throw new AdminException("缺少参数");
        }
        admin.setUpdateTime(new Date());
        boolean res = adminMapper.update(admin);
        if (!res) {
            throw new AdminException(ErrorCode.ADMIN_UPDATED_ERROR);
        }

        return true;
    }

}
