package com.example.model;

import lombok.Data;

/**
 * 分页请求数据
 * @author song
 */
@Data
public class Page {
    /**
     * 当前页码
     */
    private int page;

    /**
     * 每页数量
     */
    private int pageSize;
}
