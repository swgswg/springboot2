package com.example.service.thirdPartApi.gaoDeMap;

import com.example.service.thirdPartApi.BaseApi;
import lombok.Data;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author song
 */
@Data
@Component
abstract public class GaoDeBase extends BaseApi {
    private final String key = "baab281e3fbdc64da664517a5460abc3";

    @Override
    public String getBaseUrl() {
        return "https://restapi.amap.com";
    }

    @Override
    public HttpMethod getMethod() {
        return HttpMethod.GET;
    }

    @Override
    public String getStatusField() {
        return "infocode";
    }

    @Override
    public List<String> getPassCode() {
        List<String> code =  new ArrayList<>();
        code.add("10000");
        return code;
    }

    @Override
    protected <T> Map<String, Object> param(T param) {
        Map<String, Object> p = this.param2Map(param);
        if (p == null) {
            p = new HashMap<>();
        }
        p.put("key", this.key);
        return p;
    }

}
