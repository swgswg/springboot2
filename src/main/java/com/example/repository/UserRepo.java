package com.example.repository;

import com.example.model.user.QueryVo;
import com.example.model.user.User;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author song
 */
@Component
public interface UserRepo {
    /**
     * 获取所有
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
     * 通过ids查询
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
     * 删除
     * @param id
     * @return
     */
    Boolean delete(Long id);

    Long count();

    List<User> userAccount();
}
