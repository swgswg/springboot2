package com.example.service.thirdPartApi;

import com.example.common.util.JSONParser;
import com.example.lib.httpclient.RestTemplateExchange;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpMethod;

import java.util.List;
import java.util.Map;

/**
 * @author song
 */
@Data
@Slf4j
abstract public class BaseApi {
    protected String name;
    protected String baseUrl;
    protected String uri;
    protected HttpMethod method;
    protected Map<String, String> headers;

    protected String statusField;
    protected String msgField;
    protected List<String> passCode;

    public <T> Object third(T param) {
        // 请求开始时间
        long startTime = System.currentTimeMillis();
        String res = null;
        try {
            res = this.send(this.url(), this.param(param));
            System.out.println(res);
        } catch (Exception e) {
            return null;
        }
        // 请求结束时间
        long endTime = System.currentTimeMillis();

        Map<Object, Object> result = JSONParser.Json2Map(res);
        if (!this.isPass(result)) {
            log.info("result结果不通过" + result.toString());
            return null;
        }

        return this.getDataByResult(result);
    }

    protected String url() {
        return this.getBaseUrl() + this.getUri();
    }

    abstract protected <T> Map<String, Object> param(T param);
    abstract protected <T> Map<String, Object> param2Map(T param);

    protected String send(String url, Map<String, ?> params) {
        return (new RestTemplateExchange()).sendParamsMapJsonForBody(url, this.getMethod(), this.headers, (Map<String, Object>)params);
    }

    protected boolean isPass(Map<?, ?> result) {
        return this.getPassCode().contains(result.get(this.getStatusField()).toString());
    }

    abstract public Object getDataByResult(Map<?, ?> result);
}
