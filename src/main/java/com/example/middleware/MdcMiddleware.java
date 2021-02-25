package com.example.middleware;

import com.example.common.util.DateTimeUtil;
import org.slf4j.MDC;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * @author song
 * @link https://my.oschina.net/u/4431886/blog/4487950
 */
@Component
public class MdcMiddleware extends BaseMiddleware {
    /**
     * 日志跟踪标识
     */
    public static final String TRACE_ID = "traceId";

    /**
     * 需要拦截的路由
     *
     * @return
     */
    @Override
    public List<String> router() {
        List<String> routers = new ArrayList<>();
        routers.add("/**");
        return routers;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String traceId = request.getHeader(TRACE_ID);
        if (traceId == null || traceId.isEmpty()) {
            traceId = UUID.randomUUID().toString();
        }
        MDC.put(TRACE_ID, traceId);
        return true;
    }


    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        //调用结束后删除
        MDC.remove(TRACE_ID);
    }

}
