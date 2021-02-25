package com.example.mapper;

import com.example.model.admin.Admin;
import org.springframework.stereotype.Component;


/**
 * @author song
 */
@Component
public interface AdminMapper {
    /**
     * 根据名称获取管理员
     * @param adminName
     * @return
     */
     Admin getAdminByName(String adminName);

     boolean create(Admin adminModel);

     boolean update(Admin adminModel);
}
