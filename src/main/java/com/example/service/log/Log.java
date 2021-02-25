package com.example.service.log;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author song
 */
public class Log {

    public static Logger log(String name) {
        return LoggerFactory.getLogger(name);
    }

    public static Logger log(Class<?> clazz) {
        return LoggerFactory.getLogger(clazz);
    }

}
