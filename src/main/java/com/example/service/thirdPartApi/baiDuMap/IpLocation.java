package com.example.service.thirdPartApi.baiDuMap;


import java.util.HashMap;
import java.util.Map;

/**
 * @author song
 */
public class IpLocation extends BaiDuMapBase {
    protected String coor = "bd09ll";

    @Override
    public String getUri() {
        return "/location/ip";
    }

    @Override
    protected <T> Map<String, Object> param2Map(T param) {
        Map<String, Object> p = new HashMap<>();
        p.put("coor", this.coor);
        p.put("ip", param);
        return p;
    }

    @Override
    public Object getDataByResult(Map<?, ?> result) {
        HashMap<String, Object> dataContent = (HashMap<String, Object>) result.get("content");
        HashMap<String, Object> addressDetail =  (HashMap<String, Object>) dataContent.get("address_detail");
        String province = (String) addressDetail.get("province");
        String city = (String) addressDetail.get("city");

        Map<String, String> data = new HashMap<>();
        data.put("province", province);
        data.put("city", city);

        return data;
    }

}
