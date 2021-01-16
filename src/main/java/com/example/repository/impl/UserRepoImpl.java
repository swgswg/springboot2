package com.example.repository.impl;

import com.example.common.util.DateTimeUtil;
import com.example.constant.ErrorCode;
import com.example.exception.work.UserException;
import com.example.mapper.UserMapper;
import com.example.model.user.User;
import com.example.model.user.UserStatusEnum;
import com.example.repository.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.crypto.Data;
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
     * 通过id获取
     * @param id
     * @return
     */
    @Override
    public List<User> getUser(Long id) {
        try {
            return userMapper.getUser(id);
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
    public Boolean create(User user) {
        try {
            user.setCreated(new Date());
            return userMapper.create(user);
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

}
