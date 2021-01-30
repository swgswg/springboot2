package com.example.model;

import lombok.Data;

import java.util.List;

/**
 * @author song
 */
@Data
public class PageResult {
    /**
     * 当前页码
     */
    private int page;

    /**
     * 每页数量
     */
    private int pageSize;

    /**
     * 记录总数
     */
    private long total;

    /**
     * 最后一页
     */
    private int lastPage;

    /**
     * 数据模型
     */
    private List<?> content;
}
