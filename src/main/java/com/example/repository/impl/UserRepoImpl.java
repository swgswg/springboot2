package com.example.repository.impl;

import com.example.common.util.PageUtil;
import com.example.constant.ErrorCode;
import com.example.exception.work.UserException;
import com.example.mapper.UserMapper;
import com.example.model.Page;
import com.example.model.PageResult;
import com.example.model.user.QueryVo;
import com.example.model.user.User;
import com.example.repository.UserRepo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author song
 */
@Service
public class UserRepoImpl implements UserRepo {
    @Autowired
    UserMapper userMapper;

    /**
     * 获取所有
     *
     * @param user
     * @return
     */
    @Override
    public List<User> all(User user) {
        try {
            return userMapper.all(user);
        } catch (Exception e) {
            throw new UserException(ErrorCode.USER_SELECT_ERROR);
        }
    }

    /**
     * 分页查询接口
     * 这里统一封装了分页请求和结果，避免直接引入具体框架的分页对象, 如MyBatis或JPA的分页对象
     * 从而避免因为替换ORM框架而导致服务层、控制层的分页接口也需要变动的情况，替换ORM框架也不会
     * 影响服务层以上的分页接口，起到了解耦的作用
     *
     * @param page 自定义，统一分页查询请求
     * @return PageResult 自定义，统一分页查询结果
     */
    @Override
    public PageResult findPage(Page page) {
        return PageUtil.getPageResult(this.getPageInfo(page));
    }

    /**
     * 调用分页插件完成分页
     * @param page
     * @return
     */
    private PageInfo<User> getPageInfo(Page page) {
        int pageNum = page.getPage();
        int pageSize = page.getPageSize();
        PageHelper.startPage(pageNum, pageSize);
        List<User> users = userMapper.selectPage();
        return new PageInfo<User>(users);
    }

    /**
     * 通过id获取
     * @param id
     * @return
     */
    @Override
    public User getUser(Long id) {
        try {
            return userMapper.getUser(id);
        } catch (Exception e) {
            throw new UserException(ErrorCode.USER_SELECT_ERROR);
        }
    }

    /**
     * 通过ids查询
     *
     * @param queryVo
     * @return
     */
    @Override
    public List<User> getByIds(QueryVo queryVo) {
        try {
            return userMapper.getByIds(queryVo);
        } catch (Exception e) {
            throw new UserException(ErrorCode.USER_SELECT_ERROR);
        }
    }


    /**
     * 添加
     * @param user
     * @return
     */
    @Override
    public Long create(User user) {
        try {
            user.setCreated(new Date());
            userMapper.create(user);
            return user.getId();
        } catch (Exception e) {
            throw new UserException(ErrorCode.USER_INSERT_ERROR, e.getMessage());
        }
    }


    /**
     * 修改
     * @param user
     * @return
     */
    @Override
    public Boolean update(User user) {
        try {
            return userMapper.update(user);
        } catch (Exception e) {
            throw new UserException(ErrorCode.USER_UPDATE_ERROR, e.getMessage());
        }
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @Override
    public Boolean delete(Long id) {
        try {
            return userMapper.delete(id);
        } catch (Exception e) {
            throw new UserException(ErrorCode.USER_DELETE_ERROR, e.getMessage());
        }
    }

    @Override
    public Long count() {
        try {
            return userMapper.count();
        } catch (Exception e) {
            throw new UserException(ErrorCode.USER_SELECT_ERROR, e.getMessage());
        }
    }

    @Override
    public List<User> userAccount() {
        try {
            return userMapper.userAccount();
        } catch (Exception e) {
            throw new UserException(ErrorCode.USER_SELECT_ERROR, e.getMessage());
        }
    }

}
