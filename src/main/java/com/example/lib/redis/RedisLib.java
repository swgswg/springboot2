package com.example.lib.redis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;

/**
 * @author song
 */
public class RedisLib {
//    @Autowired
//    StringRedisTemplate redisTemplate;

    protected RedisTemplate<String, String> handle() {
        return new StringRedisTemplate();
    }

    public void set(String key, String value) {
        this.handle().opsForValue().set(key, value);
    }

    public void get(String key) {
        this.handle().opsForValue().get(key);
    }
}
