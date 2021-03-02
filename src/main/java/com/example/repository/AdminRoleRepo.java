package com.example.repository;

import com.example.model.adminrole.AdminRole;
import com.example.validation.work.admin.SignUpValidate;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author song
 */
@Component
public interface AdminRoleRepo {
    /**
     * 查找管理员关联的角色Id
     * @param adminId
     * @return
     */
    List<Long> selectRoleIdsByAdminId(Long adminId);

    /**
     * 通过条件查询
     * @param adminRole
     * @return
     */
    List<AdminRole> selectByWhere(AdminRole adminRole);

    /**
     * 添加
     * @param adminRole
     * @return
     */
    boolean create(AdminRole adminRole);

    /**
     * 批量添加
     * @param adminRoles
     * @return
     */
    boolean batchCreate(List<AdminRole> adminRoles);

    boolean deleteByAdminIdRoleIds(AdminRole adminRole);

    boolean deleteByAdminIdRoleIds(Long adminId, List<Long> delRoleIds);

    boolean createOrUpdateRole(Long adminId, List<Long> roleIds);

    boolean batchCreateByAdminRoleIds(Long adminId, List<Long> roleIds);
}
