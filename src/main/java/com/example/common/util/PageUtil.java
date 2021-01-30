package com.example.common.util;

import com.example.model.PageResult;
import com.github.pagehelper.PageInfo;

/**
 * @author song
 */
public class PageUtil {
    /**
     * 将分页信息封装到统一的接口
     * @param pageInfo
     * @return
     */
    public static PageResult getPageResult(PageInfo<?> pageInfo) {
        PageResult pageResult = new PageResult();
        pageResult.setPage(pageInfo.getPageNum());
        pageResult.setPageSize(pageInfo.getPageSize());
        pageResult.setTotal(pageInfo.getTotal());
        pageResult.setLastPage(pageInfo.getPages());
        pageResult.setContent(pageInfo.getList());
        return pageResult;
    }
}
