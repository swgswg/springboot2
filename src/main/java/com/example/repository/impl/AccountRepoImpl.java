package com.example.repository.impl;

import com.example.mapper.AccountMapper;
import com.example.model.account.Account;
import com.example.repository.AccountRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author song
 */
@Service
public class AccountRepoImpl implements AccountRepo {
    @Autowired
    AccountMapper accountMapper;

    @Override
    public List<Account> findAll() {
        return accountMapper.findAll();
    }
}
