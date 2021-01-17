package com.example.mapper;

import com.example.model.user.QueryVo;
import com.example.model.user.User;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author song
 */
@Component
public interface UserMapper {
    /**
     * @param user
     * @return
     */
    List<User> all(User user);


    /**
     * 通过id获取
     * @param id
     * @return
     */
    User getUser(Long id);

    /**
     * @param queryVo
     * @return
     */
    List<User> getByIds(QueryVo queryVo);

    /**
     * 添加
     * @param user
     * @return
     */
    Long create(User user);

    /**
     * 修改
     * @param user
     * @return
     */
    Boolean update(User user);

    /**
     * @param id
     * @return
     */
    Boolean delete(Long id);

    /**
     * 统计
     * @return
     */
    Long count();

    List<User> userAccount();
}
