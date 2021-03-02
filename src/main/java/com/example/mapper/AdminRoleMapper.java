package com.example.mapper;

import com.example.model.adminrole.AdminRole;
import com.example.validation.work.admin.SignUpValidate;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author song
 */
@Component
public interface AdminRoleMapper {
    /**
     * 通过条件查询
     * @param adminRole
     * @return
     */
    List<AdminRole> selectByWhere(AdminRole adminRole);


    /**
     * 获取管理员所有角色ids
     * @param adminId
     * @return
     */
    List<Long> selectRoleIdsByAdminId(Long adminId);

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
}
