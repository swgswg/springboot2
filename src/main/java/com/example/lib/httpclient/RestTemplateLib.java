package com.example.lib.httpclient;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

/**
 * @author song
 */
@Data
@NoArgsConstructor
public class RestTemplateLib {
    private int connectTimeout = 5000;
    private int readTimeout = 5000;
    private Map<String, String> headers;

    public static void main(String[] args) {
        RestTemplateLib restTemplateLib = new RestTemplateLib();

        String url = "http://127.0.0.1:8081/succ";
        LinkedMultiValueMap<String, Object> paramMap = new LinkedMultiValueMap<>();
        paramMap.add("username", "zhangsan");
        paramMap.add("password", "123456");
        paramMap.add("randomStr",String.valueOf(System.currentTimeMillis()));

        Map<String, String> headers = new HashMap<>();
        headers.put("Content-Type","application/json;charset=UTF-8");
//        HttpHeaders httpHeaders = new HttpHeaders();
//        相当于headers.add("Content-Type","application/json;charset=UTF-8");
//        httpHeaders.add("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
//        httpHeaders.add("Content-Type","application/json;charset=UTF-8");

        String res = restTemplateLib.doPost(url, paramMap, headers);

        System.out.println(res);
    }

    public RestTemplate getRestTemplate() {
        return this.restTemplate(this.simpleClientHttpRequestFactory());
    }

    public RestTemplate restTemplate(ClientHttpRequestFactory factory){
        return new RestTemplate(factory);
    }

    public ClientHttpRequestFactory simpleClientHttpRequestFactory(){
        SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
        // 设置连接超时，单位毫秒
        factory.setConnectTimeout(this.connectTimeout);
        //设置读取超时
        factory.setReadTimeout(this.readTimeout);
        return factory;
    }


    public HttpHeaders httpHeaders() {
        HttpHeaders httpHeaders = new HttpHeaders();
        // httpHeaders.add("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
        // headers.add("Content-Type","application/json;charset=UTF-8");
        if ((this.headers != null) && (this.headers.size() > 0)) {
            for (Map.Entry<String, String> entry : this.headers.entrySet()) {
                httpHeaders.add(entry.getKey(), entry.getValue());
            }
        }
        return httpHeaders;
    }


    public String doGet(String url) {
        return this.doGet(url, null);
    }


    public String doGet(String url, Map<String, String> params) {
        if (params != null) {
            StringBuilder urlBuilder = new StringBuilder(url);
            urlBuilder.append("?");
            for (Map.Entry<String, ?> entry : params.entrySet()) {
                urlBuilder.append(entry.getKey()).append("=").append(entry.getValue()).append("&");
            }
            url = urlBuilder.deleteCharAt(urlBuilder.length() - 1).toString();
        }
        return this.getRestTemplate()
                .getForObject(url, String.class);
    }


    public String doPost(String url, MultiValueMap<String, Object> paramMap) {
        return this.doPost(url, paramMap, (Map<String, String>) null);
    }

    public String doPost(String url, MultiValueMap<String, Object> paramMap, Map<String, String> headers) {
        HttpHeaders httpHeaders = this.httpHeaders();
        if ((headers != null) && (headers.size() > 0)) {
            for (Map.Entry<String, String> entry : headers.entrySet()) {
                httpHeaders.add(entry.getKey(), entry.getValue());
            }
        }
        return this.doPost(url, paramMap, httpHeaders);
    }

    public String doPost(String url, MultiValueMap<String, Object> paramMap, HttpHeaders httpHeaders) {
        HttpEntity<MultiValueMap<String, Object>> httpEntity = new HttpEntity<>(paramMap, httpHeaders);
        ResponseEntity<String> exchange = this.getRestTemplate()
                .postForEntity(url, httpEntity, String.class);
        return exchange.getBody();
    }

}
