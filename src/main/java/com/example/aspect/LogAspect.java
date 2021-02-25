package com.example.aspect;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 操作日志切面
 * @author song
 */
@Slf4j
@Aspect
@Component
public class LogAspect {
    /**
     * 切入点签名
     */
    @Pointcut("@annotation(com.example.annotation.LogAnnotation)")
    private void cut() {
    }


    /**
     * 前置通知
     */
    @Before("cut()")
    public void beforeCall() {
        log.info("====前置通知start");

        log.info("====前置通知end");
    }


    /**
     * 环绕通知
     * @param joinPoint
     * @return
     * @throws Throwable
     */
    @Around(value = "cut()")
    public Object aroundCall(ProceedingJoinPoint joinPoint) throws Throwable {
        log.info("====环绕通知start");

        // 注解所切的方法所在类的全类名
        String typeName = joinPoint.getTarget().getClass().getName();
        log.info("目标对象:[{}]", typeName);

        // 注解所切的方法名
        String methodName = joinPoint.getSignature().getName();
        log.info("所切方法名:[{}]", methodName);

        StringBuilder sb = new StringBuilder();
        // 获取参数
        Object[] arguments = joinPoint.getArgs();
        for (Object argument : arguments) {
            if (argument instanceof HttpServletRequest) {
                String string = ((HttpServletRequest) argument).getQueryString();
                sb.append(string);
            } else {
                sb.append(argument.toString());
            }
        }
        log.info("所切方法入参：[{}]", sb.toString());

        // 统计方法执行时间
        long start = System.currentTimeMillis();

        //执行目标方法，并获得对应方法的返回值
        Object result = joinPoint.proceed();
        log.info("返回结果:[{}]", result);

        long end = System.currentTimeMillis();
        log.info("====执行方法共用时：[{}]", (end - start));

        log.info("====环绕通知之结束");
        return result;
    }


    /**
     * 后置通知
     */
    @After("cut()")
    public void AfterCall() {
        log.info("====后置通知start");

        log.info("====后置通知end");
    }


    /**
     * 最终通知
     */
    @AfterReturning("cut()")
    public void AfterReturningCall() {
        log.info("====最终通知start");

        log.info("====最终通知end");
    }


    /**
     * 异常通知
     * @param ex
     */
    @AfterThrowing(value = "cut()", throwing = "ex")
    public void afterThrowing(Throwable ex) {
        throw new RuntimeException(ex);
    }

}
