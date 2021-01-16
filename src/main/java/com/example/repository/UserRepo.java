package com.example.repository;

import com.example.model.user.User;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author song
 */
@Component
public interface UserRepo {
    /**
     * 通过id获取
     * @param id
     * @return
     */
    public List<User> getUser(Long id);

    /**
     * 添加
     * @param user
     * @return
     */
    public Boolean create(User user);


    /**
     * 修改
     * @param user
     * @return
     */
    public Boolean update(User user);
}
