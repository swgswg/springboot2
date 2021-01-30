package com.example.lib.httpclient;

import com.example.common.util.StringHelper;
import com.example.exception.work.HttpClientException;
import lombok.ToString;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.*;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicHeader;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.util.*;

/**
 * @author song
 */
@ToString
public class HttpClient {
    private final CloseableHttpClient httpClient;
    private CloseableHttpResponse httpResponse = null;
    private String url = null;
    private String method = null;
    private HttpRequestBase httpRequest = null;
    private final Map<String, Integer> requestConfigs = new HashMap<>();
    private final Map<String, String> headers = new HashMap<>();
    private final Map<String, Object> json = new HashMap<>();
    private final Map<String, Object> form_params = new HashMap<>();

    /**
     * get方式的请求参数
     */
    private final Map<String, String> query = new HashMap<>();

    public HttpClient() {
        httpClient = HttpClients.createDefault();
    }

    /**
     * @param url 请求地址
     * @param method 请求方法
     */
    public HttpClient(String url, String method) {
        httpClient = HttpClients.createDefault();
        this.setUrl(url);
        this.setMethod(method);
    }


    /**
     * @param url
     * @return
     */
    public HttpClient setUrl(String url) {
        this.url = url;
        return this;
    }


    /**
     * @param method
     * @return
     */
    public HttpClient setMethod(String method) {
        this.method = method.toUpperCase();
        return this;
    }


    public HttpClient setRequestConfig(String key, Integer value) {
        this.requestConfigs.put(key, value);
        return this;
    }


    /**
     * 生成 RequestConfig
     * @return
     */
    private RequestConfig genRequestConfig() {
        if (this.requestConfigs.size() <= 0) {
            return null;
        }

        List<String> configList = new ArrayList<>();
        configList.add("connectTimeout");
        configList.add("connectionRequestTimeout");
        configList.add("socketTimeout");

        // 配置请求参数实例
        RequestConfig.Builder requestConfig = RequestConfig.custom();

        boolean isBuild = false;
        for (String c : configList) {
            if (this.requestConfigs.containsKey(c)) {
                String methodName = "set" + StringHelper.ucfirst(c);
                int timeout = this.requestConfigs.get(c);
                try {
                    // void.class是方法返回的类型    String.class 是方法的入参类型
                    MethodType mt = MethodType.methodType(RequestConfig.Builder.class, Integer.class);
                    MethodHandle handler = MethodHandles.lookup()
                            //找到zhangsan对象中签名和mt指定的签名是一致的sing方法
                            .findVirtual(requestConfig.getClass(), methodName, mt)
                            //非静态方法的第一个参数隐藏的this指针，这步相当设置第一个参数this指针
                            .bindTo(requestConfig);
                    handler.invokeExact(timeout);
                    isBuild = true;
                } catch (Throwable throwable) {

                }

//                if ("connectTimeout".equals(c)) {
//                    // 设置连接主机服务超时时间
//                    int connectTimeout = this.requestConfigs.get(c);
//                    if (connectTimeout > 0) {
//                        requestConfig.setConnectTimeout(connectTimeout);
//                        isContains = true;
//                    }
//                } else if ("connectionRequestTimeout".equals(c)) {
//                    // 设置连接请求超时时间
//                    int connectionRequestTimeout = this.requestConfigs.get(c);
//                    if (connectionRequestTimeout > 0) {
//                        requestConfig.setConnectionRequestTimeout(connectionRequestTimeout);
//                        isContains = true;
//                    }
//                } else if ("socketTimeout".equals(c)) {
//                    // 设置读取数据连接超时时间
//                    int socketTimeout = this.requestConfigs.get(c);
//                    if (socketTimeout > 0) {
//                        requestConfig.setSocketTimeout(socketTimeout);
//                        isContains = true;
//                    }
//                }
            }
        }

        if (isBuild) {
            return requestConfig.build();
        }

        return null;
    }


    /**
     * @param name
     * @param value
     * @return
     */
    public HttpClient setHeader(String name, String value) {
        this.headers.put(name, value);
        return this;
    }


    /**
     * @param headers
     * @return
     */
    public HttpClient setHeaders(Map<String, String> headers) {
        for (Map.Entry<String, String> entry : headers.entrySet()) {
            this.setHeader(entry.getKey(), entry.getValue());
        }
        return this;
    }

    /**
     * 生成 Header
     * @return
     */
    private Header[] genHeaders() {
        int headersSize = this.headers.size();
        if (headersSize <= 0) {
            return null;
        }

        Header[] h = new Header[headersSize];
        int i = 0;
        for (Map.Entry<String, String> entry : this.headers.entrySet()) {
            this.httpRequest.setHeader(entry.getKey(), entry.getValue());
            h[i] = new BasicHeader(entry.getKey(), entry.getValue());
            ++i;
        }
        return  h;
    }


    /**
     * @param name
     * @param value
     * @return
     */
    public HttpClient setQuery(String name, String value) {
        this.query.put(name, value);
        return this;
    }

    public HttpClient setQueries(Map<String, String> queries) {
        for (Map.Entry<String, String> entry : queries.entrySet()) {
            this.setQuery(entry.getKey(), entry.getValue());
        }
        return this;
    }

    public String genQuery() {
        if (this.query.size() <= 0) {
            return null;
        }

        StringBuilder q = new StringBuilder();
        boolean first = true;
        for (Map.Entry<String, String> entry : this.query.entrySet()) {
            if (!first) {
                q.append("&");
            }
            q.append(entry.getKey()).append("=").append(entry.getValue());
            first = false;
        }

        return q.toString();
    }


    private void httpRequestSetConfig() {
        RequestConfig rc = this.genRequestConfig();
        if (rc != null) {
            this.httpRequest.setConfig(rc);
        }
    }


    private void httpRequestSetHeaders() {
        Header[] headers = this.genHeaders();
        if (headers != null && headers.length > 0) {
            this.httpRequest.setHeaders(headers);
        }
    }


    private void httpRequestSetQuery() {
        if (!this.url.contains("?")) {
            this.url += "?" + this.genQuery();
        }
    }


    /**
     * 执行请求
     * @return
     */
    public String execute() {
        String result = null;

        try {
            this.httpRequestSetQuery();

            if (this.method.equals(HttpGet.METHOD_NAME)) {
                this.httpRequest = new HttpGet(this.url);
            } else if (this.method.equals(HttpPost.METHOD_NAME)) {
                this.httpRequest = new HttpPost(this.url);
            } else {
                throw new HttpClientException("不支持的HTTP请求方式");
            }

            this.httpRequestSetConfig();
            this.httpRequestSetHeaders();

            // httpClient对象执行post请求,并返回响应参数对象
            httpResponse = httpClient.execute(this.httpRequest);
            // 从响应对象中获取响应内容
            HttpEntity entity = httpResponse.getEntity();
            result = EntityUtils.toString(entity);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // 关闭资源
            close(httpClient, httpResponse);
        }

        return result;
    }

    private void close(CloseableHttpClient httpClient, CloseableHttpResponse response) {
        this.close(httpClient);
        this.close(response);
    }


    private void close(CloseableHttpClient httpClient) {
        if (null != httpClient) {
            try {
                httpClient.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void close(CloseableHttpResponse response) {
        if (response != null) {
            try {
                response.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
