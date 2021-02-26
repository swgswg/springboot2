package com.example.repository;

import com.example.model.Page;
import com.example.model.PageResult;
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
     * 分页查询接口
     * 这里统一封装了分页请求和结果，避免直接引入具体框架的分页对象, 如MyBatis或JPA的分页对象
     * 从而避免因为替换ORM框架而导致服务层、控制层的分页接口也需要变动的情况，替换ORM框架也不会
     * 影响服务层以上的分页接口，起到了解耦的作用
     * @param page 自定义，统一分页查询请求
     * @return PageResult 自定义，统一分页查询结果
     */
    PageResult findPage(Page page);

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
