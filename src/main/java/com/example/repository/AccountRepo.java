package com.example.repository;

import com.example.model.account.Account;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author song
 */
@Component
public interface AccountRepo {
    List<Account> findAll();
}
