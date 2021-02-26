package com.example.mapper;

import com.example.model.admin.Admin;
import org.springframework.stereotype.Component;

import java.util.List;


/**
 * @author song
 */
@Component
public interface AdminMapper {
    /**
     * 分页查询
     * @return
     */
    List<Admin> selectPage(Admin admin);

    /**
     * 根据名称获取管理员
     * @param adminName
     * @return
     */
     Admin getAdminByName(String adminName);

     boolean create(Admin adminModel);

     boolean update(Admin adminModel);
}
