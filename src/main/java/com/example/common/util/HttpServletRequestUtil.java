package com.example.common.util;

import lombok.Data;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * @author song
 */
@Data
@Component
public class HttpServletRequestUtil {
    private static String GET = "GET";

    public static Map<String, String> all(HttpServletRequest request) {
        String method = request.getMethod();
        if (method.toUpperCase().equals(GET)) {
            return getParam(request);
        }

        return null;
    }




    /**
     * 获取Get方式请求的参数
     * @param request
     * @return
     */
    public static Map<String, String> getParam(HttpServletRequest request)
    {
        Map<String, String> params = new HashMap<>();
        Enumeration<String> em = request.getParameterNames();
        while (em.hasMoreElements()) {
            String name = em.nextElement();
            String value = request.getParameter(name);
            params.put(name, value);
        }

        return params;
    }


    /**
     * 获取post请求方式的参数
     * @param request
     * @return
     */
    public static Map<String, Object> postJsonParam(HttpServletRequest request) {
        String param = "";
        InputStream is = null;
        InputStreamReader isr = null;
        BufferedReader br = null;
        Map<String, Object> map = null;
        try {
            StringBuffer sb = new StringBuffer();
            is = request.getInputStream();
            isr = new InputStreamReader(is, "UTF-8");
            br = new BufferedReader(isr);
            String s = "";
            while ((s = br.readLine()) != null) {
                sb.append(s);
            }
            param = sb.toString();
            JSONObject object = JSONObject.fromObject(param);
            map = JSONHelper.reflect(object);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (br != null) {
                    br.close();
                }
                if (isr != null) {
                    isr.close();
                }
                if (is != null) {
                    is.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return map;
    }

}
