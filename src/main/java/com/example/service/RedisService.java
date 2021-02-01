package com.example.service;

import com.example.exception.work.RedisException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.RedisSystemException;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.data.redis.core.ValueOperations;

/**
 * @author song
 */
@Component
public class RedisService {
    @Autowired
    StringRedisTemplate redisTemplate;

    private ValueOperations<String, String> string() {
        return redisTemplate.opsForValue();
    }

    public boolean set(String key, String value) {
        try {
            this.string().set(key, value);
            return true;
        } catch (RedisSystemException e) {
            throw new RedisException(e.getMessage());
        }
    }


    public String get(String key) {
        try {
            return this.string().get(key);
        } catch (RedisSystemException e) {
            throw new RedisException(e.getMessage());
        }
    }

}
