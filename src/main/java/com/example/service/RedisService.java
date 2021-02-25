package com.example.service;

import com.example.service.log.Log;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.RedisSystemException;
import org.springframework.data.redis.core.*;
import org.springframework.stereotype.Component;

/**
 * @author song
 */
@Component
public class RedisService {
    @Autowired
    StringRedisTemplate redisTemplate;

    Logger log = Log.log(this.getClass());

    private ValueOperations<String, String> string() {
        return redisTemplate.opsForValue();
    }

    private HashOperations<String, String, Object> hash() {
        return redisTemplate.opsForHash();
    }

    private ListOperations<String, String> list() {
        return redisTemplate.opsForList();
    }

    private SetOperations<String, String> set() {
        return redisTemplate.opsForSet();
    }

    private ZSetOperations<String, String> zset() {
        return redisTemplate.opsForZSet();
    }

    private GeoOperations<String, String> geo() {
        return redisTemplate.opsForGeo();
    }

    public boolean set(String key, String value) {
        try {
            this.string().set(key, value);
            return true;
        } catch (RedisSystemException e) {
            this.writeLog(e);
            return false;
        }
    }

    public String get(String key) {
        try {
            return this.string().get(key);
        } catch (RedisSystemException e) {
            this.writeLog(e);
            return null;
        }
    }


    public Boolean setnx(String key, String value) {
        try {
            return this.string().setIfAbsent(key, value);
        } catch (RedisSystemException e) {
            this.writeLog(e);
            return false;
        }
    }


    public Boolean setBit(String key, long offset, boolean tag) {
        try {
            return this.string().setBit(key, offset, tag);
        } catch (RedisSystemException e) {
            this.writeLog(e);
            return false;
        }
    }


    private void writeLog(Exception e) {
        this.log.error(e.getMessage());
    }

}
