package com.example.repository.impl;

import com.example.constant.ErrorCode;
import com.example.exception.work.UserException;
import com.example.mapper.UserMapper;
import com.example.model.user.QueryVo;
import com.example.model.user.User;
import com.example.repository.UserRepo;
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
