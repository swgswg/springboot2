package com.example.service.thirdPartApi.baiDuMap;

import com.example.service.thirdPartApi.BaseApi;
import lombok.Data;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 百度地图接口基类
 * @author song
 */
@Data
@Component
abstract public class BaiDuMapBase extends BaseApi {
    protected String ak = "aXACuntnqlWeGX6M1kTtLGvRgmLs3zpp";

    @Override
    public String getBaseUrl() {
        return "https://api.map.baidu.com";
    }

    @Override
    public HttpMethod getMethod() {
        return HttpMethod.GET;
    }

    @Override
    public String getStatusField() {
        return "status";
    }

    @Override
    public List<String> getPassCode() {
        List<String> code =  new ArrayList<>();
        code.add("0");
        code.add("1001");
        return code;
    }

    @Override
    protected <T> Map<String, Object> param(T param) {
        Map<String, Object> p = this.param2Map(param);
        if (p == null) {
            p = new HashMap<>();
        }
        p.put("ak", this.ak);
        return p;
    }

}
