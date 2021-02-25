package com.example.middleware;

import com.example.service.JwtService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * @author song
 */
@Component
public class TokenMiddleware extends BaseMiddleware {
    @Autowired
    JwtService jwtService;

    @Override
    public List<String> router() {
        List<String> routers = new ArrayList<>();
        routers.add("/api/v1/admin/logout");
        routers.add("/api/v1/admin/signUp");
        return routers;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        // 校验token
        String token = request.getHeader("token");
        jwtService.decode(token);
        return true;
    }

}
