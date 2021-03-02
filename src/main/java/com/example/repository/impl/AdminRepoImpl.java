package com.example.repository.impl;

import com.example.annotation.PageAnnotation;
import com.example.common.util.ListUtil;
import com.example.common.util.PrintUtil;
import com.example.common.util.ConverterUtil;
import com.example.constant.ErrorCode;
import com.example.exception.work.AdminException;
import com.example.mapper.AdminMapper;
import com.example.model.admin.Admin;
import com.example.model.admin.AdminStatusEnum;
import com.example.model.adminrole.AdminRole;
import com.example.repository.AdminRepo;
import com.example.repository.AdminRoleRepo;
import com.example.validation.work.admin.EditValidate;
import com.example.validation.work.admin.IndexValidate;
import com.example.validation.work.admin.SignUpValidate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * @author song
 */
@Service
public class AdminRepoImpl implements AdminRepo {
    @Autowired
    AdminMapper adminMapper;

    @Autowired
    AdminRoleRepo adminRoleRepo;

    @Override
    public Admin login(String adminName, String password) {
        Admin admin = this.getAdminByName(adminName, true);
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
        Long id = this.create(admin);

        // 存在角色ids传参时, 添加管理员角色关联
        List<Long> paramRoleIds = signUpValidate.getRoleIds();
        adminRoleRepo.batchCreateByAdminRoleIds(id, paramRoleIds);

        return true;
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


    /**
     * @param adminName
     * @return
     */
    private boolean isAdminNameExist(String adminName) {
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

    /**
     * 通过主键查找
     * @param id
     * @return
     */
    @Override
    public Admin selectByPk(long id) {
        return adminMapper.selectByPk(id);
    }


    @Override
    public List<Admin> selectByWhere(IndexValidate data) {
        return adminMapper.selectByWhere(ConverterUtil.convert(data, Admin.class));
    }


    /**
     * 分页条件查询
     * @param data
     * @return
     */
    @Override
    @PageAnnotation
    public Object selectByWherePage(IndexValidate data) {
        return this.selectByWhere(data);
    }

    @Override
    public boolean edit(EditValidate data) {
        Admin admin = ConverterUtil.convert(data, Admin.class);
        boolean res = this.update(admin);

        // 存在角色ids传参时, 修改管理员关联角色
        if (res && (admin.getRoleIds() != null) && (admin.getRoleIds().size() > 0)) {
            List<Long> paramRoleIds = admin.getRoleIds();
            adminRoleRepo.createOrUpdateRole(admin.getId(), paramRoleIds);
        }

        return true;
    }

    /**
     * 启用
     *
     * @param id
     * @return
     */
    @Override
    public boolean open(Long id) {
        return this.status(id, AdminStatusEnum.OPEN.getValue());
    }

    /**
     * 禁用
     *
     * @param id
     * @return
     */
    @Override
    public boolean close(Long id) {
        return this.status(id, AdminStatusEnum.CLOSE.getValue());
    }


    private boolean status(Long id, int status) {
        if (id == null || id <= 0) {
            throw new AdminException("参数缺失status");
        }
        Admin admin = new Admin();
        admin.setId(id);
        admin.setStatus(status);
        return this.update(admin);
    }


    /**
     * 添加
     * @param admin
     * @return
     */
    @Override
    public Long create(Admin admin) {
        if (admin == null) {
            throw new AdminException("缺少参数create");
        }

        // 判断用户名是否存在
        if (this.isAdminNameExist(admin.getAdminName())) {
            throw new AdminException(ErrorCode.ADMIN_NAME_EXISTED);
        }

        // 设置密码
        String password = admin.getPassword();
        if (password== null) {
            password = Admin.DEFAULT_PASSWORD;
        }
        admin.setPassword(Admin.passwordEncrypt(password));

        admin.setCreateTime(new Date());
        Long id = adminMapper.create(admin);
        if (id == null || id < 0) {
            throw new AdminException(ErrorCode.ADMIN_CREATED_ERROR);
        }

        return id;
    }

    /**
     * 修改
     * @param admin
     * @return
     */
    @Override
    public boolean update(Admin admin) {
        if (admin == null || admin.getId() == null || admin.getId() <= 0) {
            throw new AdminException("缺少参数update");
        }
        Admin adminData = this.selectByPk(admin.getId());

        if (admin.getAdminName() != null && !adminData.getAdminName().equals(admin.getAdminName())) {
            // 判断用户名是否存在
            if (this.isAdminNameExist(admin.getAdminName())) {
                throw new AdminException(ErrorCode.ADMIN_NAME_EXISTED);
            }
        }

        if (admin.getPassword() != null) {
            admin.setPassword(Admin.passwordEncrypt(admin.getPassword()));
        }

        admin.setUpdateTime(new Date());

        boolean res = adminMapper.update(admin);
        if (!res) {
            throw new AdminException(ErrorCode.ADMIN_UPDATED_ERROR);
        }

        return true;
    }

}
