package com.example.aspect;

import com.example.common.util.ConverterUtil;
import com.example.common.util.PrintUtil;
import com.example.model.Page;
import com.example.model.PageResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import java.util.List;


/**
 * @author song
 */
@Aspect
@Component
public class PageAspect {
    /**
     * 切入点签名
     */
    @Pointcut("@annotation(com.example.annotation.PageAnnotation)")
//    @Pointcut("execution(* com.example.repository.impl.*.*(..))")
    private void page() {}


    /**
     * 环绕通知
     * @param joinPoint
     * @return
     * @throws Throwable
     */
    @Around(value = "page()")
    public Object aroundCall(ProceedingJoinPoint joinPoint) throws Throwable {
        int pageNum = 1;
        int pageSize = 10;
        // 获取参数
        Object[] arguments = joinPoint.getArgs();
        for (Object argument : arguments) {
            PrintUtil.print(argument);
            Page page = ConverterUtil.convert(argument, Page.class);
            if (page != null) {
                pageNum = page.getPage();
                pageSize = page.getPageSize();
                break;
            }
        }

        // 服务实现类通过调用分页插件完成最终的分页查询，关键代码是 PageHelper.startPage(pageNum, pageSize)，将前台分页查询参数传入并拦截MyBtis执行实现分页效果。
        PageHelper.startPage(pageNum, pageSize);

        //执行目标方法，并获得对应方法的返回值
        Object data = joinPoint.proceed();

        return PageResult.getPageResult(new PageInfo((List) data));
    }
}
