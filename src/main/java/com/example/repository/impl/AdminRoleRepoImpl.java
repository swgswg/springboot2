package com.example.repository.impl;

import com.example.common.util.ListUtil;
import com.example.exception.work.AdminRoleException;
import com.example.mapper.AdminRoleMapper;
import com.example.model.adminrole.AdminRole;
import com.example.repository.AdminRoleRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author song
 */
@Service
public class AdminRoleRepoImpl implements AdminRoleRepo {
    @Autowired
    AdminRoleMapper adminRoleMapper;

    /**
     * 查找管理员关联的角色Id
     *
     * @param adminId
     * @return
     */
    @Override
    public List<Long> selectRoleIdsByAdminId(Long adminId) {
        return adminRoleMapper.selectRoleIdsByAdminId(adminId);
    }

    /**
     * 通过条件查询
     * @param adminRole
     * @return
     */
    @Override
    public List<AdminRole> selectByWhere(AdminRole adminRole) {
        return adminRoleMapper.selectByWhere(adminRole);
    }

    /**
     * 添加
     *
     * @param adminRole
     * @return
     */
    @Override
    public boolean create(AdminRole adminRole) {
        return adminRoleMapper.create(adminRole);
    }

    /**
     * 批量添加
     *
     * @param adminRoles
     * @return
     */
    @Override
    public boolean batchCreate(List<AdminRole> adminRoles) {
        return adminRoleMapper.batchCreate(adminRoles);
    }

    @Override
    public boolean deleteByAdminIdRoleIds(AdminRole adminRole) {
        return adminRoleMapper.deleteByAdminIdRoleIds(adminRole);
    }

    @Override
    public boolean createOrUpdateRole(Long adminId, List<Long> roleIds) {
        if (roleIds == null) {
            return true;
        }

        roleIds = ListUtil.unique(roleIds);
        List<Long> alreadyRoleIds = this.selectRoleIdsByAdminId(adminId);

        // 库中存在, 用户不存在的要删除
        List<Long> delRoleIds = ListUtil.diff(alreadyRoleIds, roleIds);
        this.deleteByAdminIdRoleIds(adminId, delRoleIds);

        // 用户存在, 库中不存在时
        List<Long> addRoleIds = ListUtil.diff(roleIds, alreadyRoleIds);
        this.batchCreateByAdminRoleIds(adminId, addRoleIds);

        return true;
    }


    /**
     * @param adminId
     * @param delRoleIds
     */
    @Override
    public boolean deleteByAdminIdRoleIds(Long adminId, List<Long> delRoleIds) {
        if (adminId == null || adminId <= 0) {
            throw new AdminRoleException("参数缺失create");
        }

        if (delRoleIds.size() <= 0) {
            return true;
        }

        AdminRole adminRole = new AdminRole();
        adminRole.setAdminId(adminId);
        adminRole.setRoleIds(delRoleIds);
        return this.deleteByAdminIdRoleIds(adminRole);
    }


    /**
     * @param adminId
     * @param addRoleIds
     */
    @Override
    public boolean batchCreateByAdminRoleIds(Long adminId, List<Long> addRoleIds) {
        if (adminId == null || adminId <= 0) {
            throw new AdminRoleException("参数缺失create");
        }

        if (addRoleIds.size() <= 0) {
            return true;
        }

        List<AdminRole> adminRoleList = new ArrayList<>();
        Date now = new Date();
        for (Long roleId: addRoleIds) {
            AdminRole adminRole2 = new AdminRole();
            adminRole2.setAdminId(adminId);
            adminRole2.setRoleId(roleId);
            adminRole2.setCreateTime(now);

            adminRoleList.add(adminRole2);
        }
        return this.batchCreate(adminRoleList);
    }

}
