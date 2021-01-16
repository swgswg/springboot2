package com.example.mapper;

import com.example.model.user.User;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author song
 */
@Component
@Repository
public interface UserMapper {
    /**
     * 通过id获取
     * @param id
     * @return
     */
    List<User> getUser(Long id);

    /**
     * 添加
     * @param user
     * @return
     */
    Boolean create(User user);

    /**
     * 修改
     * @param user
     * @return
     */
    Boolean update(User user);
}
