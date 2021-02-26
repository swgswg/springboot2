package com.example.model;

import com.example.common.util.ConverterUtil;
import com.example.model.admin.Admin;
import com.example.validation.work.admin.IndexValidate;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.Data;

import java.util.List;
import java.util.concurrent.Callable;
import java.util.function.Consumer;
import java.util.function.Function;

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


    public static <T> PageResult getPageResult(PageInfo<T> pageInfo) {
        PageResult pageResult = new PageResult();
        pageResult.setPage(pageInfo.getPageNum());
        pageResult.setPageSize(pageInfo.getPageSize());
        pageResult.setTotal(pageInfo.getTotal());
        pageResult.setLastPage(pageInfo.getPages());
        pageResult.setContent(pageInfo.getList());
        return pageResult;
    }

}
