package com.example.mapper;

import com.example.model.account.Account;

import java.util.List;

/**
 * @author song
 */
public interface AccountMapper {
    /**
     * @return
     */
    List<Account> findAll();
}
