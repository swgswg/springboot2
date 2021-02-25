package com.example.lib.httpclient;

import com.alibaba.fastjson.JSON;
import lombok.Data;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
import org.springframework.http.*;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author song
 */
@Component
public class RestTemplateExchange {
    private int connectTimeout = 5000;
    private int readTimeout = 5000;
    private RestTemplate baseRestTemplate;

    public RestTemplateExchange() {
        this.baseRestTemplate = this.getRestTemplate();
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

    public String sendGetForBody(String url, Map<String, String> headersMap) {
        return parseResponseEntityForBody(sendParamsMapForResponseEntity(url, HttpMethod.GET, headersMap, null));
    }

    public String sendGetParamsMapForBody(String url, Map<String, Object> paramsMap) {
        return parseResponseEntityForBody(sendParamsMapForResponseEntity(url, HttpMethod.GET, null, paramsMap));
    }

    public String sendGetParamsMapForBody(String url, Map<String, String> headersMap, Map<String, Object> paramsMap) {
        return parseResponseEntityForBody(sendParamsMapForResponseEntity(url, HttpMethod.GET, headersMap, paramsMap));
    }

    public String sendPostParamsMapJsonForBody(String url, Map<String, String> headersMap,
                                               Map<String, Object> paramsMap) {
        return sendParamsMapJsonForBody(url, HttpMethod.POST, headersMap, paramsMap);
    }

    public String sendPutParamsMapJsonForBody(String url, Map<String, String> headersMap,
                                              Map<String, Object> paramsMap) {
        return sendParamsMapJsonForBody(url, HttpMethod.PUT, headersMap, paramsMap);
    }

    public String sendDeleteParamsMapJsonForBody(String url, Map<String, String> headersMap,
                                                 Map<String, Object> paramsMap) {
        return sendParamsMapJsonForBody(url, HttpMethod.DELETE, headersMap, paramsMap);
    }

    public String sendParamsMapJsonForBody(String url, HttpMethod httpMethod, Map<String, String> headersMap,
                                           Map<String, Object> paramsMap) {
        if (MapUtils.isNotEmpty(headersMap)) {
            headersMap.put(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE);
        }
        return parseResponseEntityForBody(sendParamsMapForResponseEntity(url, httpMethod, headersMap, paramsMap));
    }

    public String sendGetParamsListForBody(String url, Map<String, String> headersMap, List<?> paramsList) {
        return parseResponseEntityForBody(sendParamsListForResponseEntity(url, HttpMethod.GET, headersMap, paramsList));
    }

    public String sendPostParamsListJsonForBody(String url, Map<String, String> headersMap, List<?> paramsList) {
        return sendParamsListJsonForBody(url, HttpMethod.POST, headersMap, paramsList);
    }

    public String sendPutParamsListJsonForBody(String url, Map<String, String> headersMap, List<?> paramsList) {
        return sendParamsListJsonForBody(url, HttpMethod.PUT, headersMap, paramsList);
    }

    public String sendDeleteParamsListJsonForBody(String url, Map<String, String> headersMap, List<?> paramsList) {
        return sendParamsListJsonForBody(url, HttpMethod.DELETE, headersMap, paramsList);
    }

    public String sendParamsListJsonForBody(String url, HttpMethod httpMethod, Map<String, String> headersMap,
                                            List<?> paramsList) {
        if (MapUtils.isNotEmpty(headersMap)) {
            headersMap.put(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE);
        }
        return parseResponseEntityForBody(sendParamsListForResponseEntity(url, httpMethod, headersMap, paramsList));
    }

    public String parseResponseEntityForBody(ResponseEntity<String> responseEntity) {
        if (responseEntity == null) {
            throw new RuntimeException("http返回空");
        }
        if (!HttpStatus.OK.equals(responseEntity.getStatusCode())) {
            throw new RuntimeException("http请求失败");
        }
        String body = responseEntity.getBody();
        return body;
    }

    public Map<String, String> sendGetForHeaders(String url, Map<String, String> headersMap,
                                                 Map<String, Object> paramsMap, List<String> headerKeyList) {
        return parseResponseEntityForHeaders(sendParamsMapForResponseEntity(url, HttpMethod.GET, headersMap, paramsMap),
                headerKeyList);
    }

    public Map<String, String> parseResponseEntityForHeaders(ResponseEntity<String> responseEntity,
                                                             List<String> headerKeyList) {
        if (responseEntity == null) {
            throw new RuntimeException("http返回空");
        }
        if (!HttpStatus.OK.equals(responseEntity.getStatusCode())) {
            throw new RuntimeException("http请求失败");
        }
        HttpHeaders headers = responseEntity.getHeaders();

        Map<String, String> headersMap = new HashMap<String, String>();
        if (CollectionUtils.isNotEmpty(headerKeyList)) {
            for (String headerKey : headerKeyList) {
                headersMap.put(headerKey,
                        CollectionUtils.isEmpty(headers.get(headerKey)) ? null : headers.get(headerKey).get(0));
            }
        }

        return headersMap;
    }

    public ResponseEntity<String> sendParamsMapForResponseEntity(String url, HttpMethod httpMethod,
                                                                 Map<String, String> headersMap, Map<String, Object> paramsMap) {
        HttpHeaders httpHeaders = null;
        if (MapUtils.isNotEmpty(headersMap)) {
            httpHeaders = new HttpHeaders();
            for (Map.Entry<String, String> entry : headersMap.entrySet()) {
                httpHeaders.add(entry.getKey(), entry.getValue());
            }
        }

        StringBuffer urlStringBuffer = new StringBuffer(url);

        HttpEntity<Object> httpEntity = null;
        if (HttpMethod.GET.equals(httpMethod)) {
            if (MapUtils.isNotEmpty(paramsMap)) {
                urlStringBuffer.append("?");
                int index = 0;
                for (Map.Entry<String, Object> entry : paramsMap.entrySet()) {
                    if (index == 0) {
                        urlStringBuffer.append(entry.getKey()).append("=").append(entry.getValue());
                    } else {
                        urlStringBuffer.append("&").append(entry.getKey()).append("=").append(entry.getValue());
                    }
                    index++;
                }
            }
            httpEntity = new HttpEntity<Object>(httpHeaders);
        } else {
            if (MapUtils.isNotEmpty(headersMap)
                    && MediaType.APPLICATION_JSON_VALUE.equals(headersMap.get(HttpHeaders.CONTENT_TYPE))) {
                httpEntity = new HttpEntity<Object>(JSON.toJSONString(paramsMap), httpHeaders);
            } else {
                httpEntity = new HttpEntity<Object>(paramsMap, httpHeaders);
            }
        }
        ResponseEntity<String> responseEntity = baseRestTemplate.exchange(urlStringBuffer.toString(), httpMethod,
                httpEntity, String.class);

        return responseEntity;
    }

    public ResponseEntity<String> sendParamsListForResponseEntity(String url, HttpMethod httpMethod,
                                                                  Map<String, String> headersMap, List<?> paramsList) {
        HttpHeaders httpHeaders = null;
        if (MapUtils.isNotEmpty(headersMap)) {
            httpHeaders = new HttpHeaders();
            for (Map.Entry<String, String> entry : headersMap.entrySet()) {
                httpHeaders.add(entry.getKey(), entry.getValue());
            }
        }

        HttpEntity<Object> httpEntity = null;
        if (MapUtils.isNotEmpty(headersMap)
                && MediaType.APPLICATION_JSON_VALUE.equals(headersMap.get(HttpHeaders.CONTENT_TYPE))) {
            httpEntity = new HttpEntity<Object>(JSON.toJSONString(paramsList), httpHeaders);
        } else {
            httpEntity = new HttpEntity<Object>(paramsList, httpHeaders);
        }
        ResponseEntity<String> responseEntity = baseRestTemplate.exchange(url, httpMethod, httpEntity, String.class);

        return responseEntity;
    }
}
