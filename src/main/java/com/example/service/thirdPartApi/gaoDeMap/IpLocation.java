package com.example.service.thirdPartApi.gaoDeMap;

import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

/**
 * @author song
 */
@Component
public class IpLocation extends GaoDeBase {
    @Override
    public String getUri() {
        return "/v3/ip";
    }

    @Override
    protected <T> Map<String, Object> param2Map(T param) {
        Map<String, Object> p = new HashMap<>();
        p.put("ip", param);
        return p;
    }

    @Override
    public Object getDataByResult(Map<?, ?> result) {
        String province = (String) result.get("province");
        String city = (String) result.get("city");

        Map<String, String> data = new HashMap<>();
        data.put("province", province);
        data.put("city", city);

        return data;
    }
}
