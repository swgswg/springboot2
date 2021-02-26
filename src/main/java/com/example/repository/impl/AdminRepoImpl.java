package com.example.repository.impl;

import com.example.annotation.PageAnnotation;
import com.example.common.util.PrintUtil;
import com.example.common.util.ConverterUtil;
import com.example.constant.ErrorCode;
import com.example.exception.work.AdminException;
import com.example.mapper.AdminMapper;
import com.example.model.PageResult;
import com.example.model.admin.Admin;
import com.example.model.admin.AdminStatusEnum;
import com.example.repository.AdminRepo;
import com.example.validation.work.admin.IndexValidate;
import com.example.validation.work.admin.SignUpValidate;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


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
        PrintUtil.print(admin.getPassword(), password, Admin.passwordEncrypt(password));
        if (!admin.comparePassword(password)) {
            throw new AdminException(ErrorCode.ADMIN_NAME_OR_PWD_ERROR);
        }

        if (!admin.getStatus().equals(AdminStatusEnum.OPEN.getValue())) {
            throw new AdminException(ErrorCode.ADMIN_CLOSED);
        }

        return admin;
    }

    /**
     * 注册
     * @param signUpValidate
     * @return
     */
    @Override
    public boolean signUp(SignUpValidate signUpValidate) {
        Admin admin = ConverterUtil.convert(signUpValidate, Admin.class);
        admin.setStatus(AdminStatusEnum.OPEN.getValue());
        return this.create(admin);
    }

    /**
     * 根据名称获取管理员
     * @return
     */
    @Override
    public Admin getAdminByName(String adminName, boolean isThrowException) {
        if (adminName == null) {
            throw new AdminException("缺少名称参数");
        }
        Admin admin = adminMapper.getAdminByName(adminName);
        if (admin == null && isThrowException) {
            throw new AdminException(ErrorCode.ADMIN_NOT_EXIST);
        }
        return admin;
    }


    public boolean isAdminNameExist(String adminName) {
        // 用户名不存在
        if (this.getAdminByName(adminName, false) == null) {
            return false;
        }

        // 用户名存在
        return true;
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

    @Override
    public PageResult selectPage(IndexValidate data) {
        return PageResult.getPageResult(this.getPageInfo(data));
    }

    /**
     * 通过主键查找
     * @param id
     * @return
     */
    @Override
    public Admin selectByPk(long id) {
        return adminMapper.selectByPk(id);
    }


    /**
     * 调用分页插件完成分页
     * @param data
     * @return
     */
    @PageAnnotation
    private PageInfo<Admin> getPageInfo(IndexValidate data) {
        List<Admin> admins = adminMapper.selectPage(ConverterUtil.convert(data, Admin.class));
        return new PageInfo<>(admins);
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

        // 判断用户名是否存在
        if (this.isAdminNameExist(admin.getAdminName())) {
            throw new AdminException(ErrorCode.ADMIN_NAME_EXISTED);
        }
        admin.setCreateTime(new Date());
        if (admin.getPassword() == null) {
            admin.setPassword(Admin.DEFAULT_PASSWORD);
        }
        admin.setPassword(Admin.passwordEncrypt(admin.getPassword()));
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
