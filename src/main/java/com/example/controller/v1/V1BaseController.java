package com.example.controller.v1;

import com.example.controller.BaseController;
import com.example.service.JwtService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;


/**
 * @author song
 */
public class V1BaseController extends BaseController {
    @Autowired
    JwtService jwtService;

    protected String genTokenByAdminId(long id) {
        Map<String, Long> idMap = new HashMap<>(1);
        idMap.put("id", id);
        return jwtService.encode(idMap);
    }

    protected long getAdminIdByToken(HttpServletRequest request) {
        String token = request.getHeader("token");
        return Long.parseLong(jwtService.getClaimsByKey(token, "id").toString());
    }
}
