package com.example.common.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

/**
 * 
 * @author chenjg
 * JSON解析成java对象
 *
 */
public class JSONParser {

	/**
	 * 
	 * @param s
	 * @return
	 */
	public static Map<Object,Object> Json2Map(String s){
		Map<Object,Object> map = new HashMap<Object,Object>();
		JSONObject json = JSONObject.fromObject(s);
		
		Iterator<Object> keys = json.keys();
		
		while (keys.hasNext()){
			String key = (String) keys.next();
			String value = json.get(key).toString();
			if(value.startsWith("{") && value.endsWith("}")){
				map.put(key, Json2Map(value));
			}else{
				map.put(key, value);
			}
		}
		return map;
	}
	
	public static List<Map<String,String>> Json2ListMapString(List<String> paramList){
		List<Map<String,String>> msgParamLst= new ArrayList<Map<String,String>>();
		for(String s:paramList){
			Map<String,String> j=JSONParser.Json2MapString(s);
			msgParamLst.add(j);
		}
		return msgParamLst;
	}
	
	/**
	 * 
	 * @param s
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Map<String,String> Json2MapString(String s){
		Map<String,String> map = new HashMap<String,String>();
		JSONObject json = JSONObject.fromObject(s);
		if(json.isNullObject() || json.isEmpty()) {
			return null;
		}
		Iterator<Object> keys = json.keys();
		while (keys.hasNext()){
			String key = (String) keys.next();
			String value = json.get(key).toString();
			map.put(key, value);
		}
		return map;
	}
	
	/**
	 * 
	 * @param s
	 * @param o
	 * @return
	 */
	public static Object[] Json2Array(String s,Object o){
		JSONArray jsonArray = JSONArray.fromObject(s);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setArrayMode(JsonConfig.MODE_OBJECT_ARRAY);
		jsonConfig.setRootClass(o.getClass());
		Object[] oArray = (Object[]) JSONSerializer.toJava(jsonArray,jsonConfig);
		return oArray;
	}
	
	/**
	 * 根据前台传入的json对象,得到具体对象的ArrayList
	 * 
	 * @param jsonData
	 * @return
	 */
	@SuppressWarnings({ "unchecked" })
	public  static List<Map<String, String>> getJsonDataList(String jsonData) {
		if(jsonData == null|| jsonData.length() <=0) {
			return null;
		}
		JSONArray array = JSONArray.fromObject(jsonData);
	
		Iterator<JSONObject> iter = array.iterator();
		
		 List<Map<String, String>> resList = new ArrayList<Map<String, String>>();
		 Map<String, String> dto;
		while(iter.hasNext()) {
			JSONObject object = iter.next();
			
			dto = jsonObjectToDto(object);
			
			resList.add(dto);
		}
		
		return resList;
	}
	
	@SuppressWarnings("unchecked")
	public static Map<String, String> jsonObjectToDto(JSONObject object) {
		Map<String, String> dto = new HashMap<String, String>();
		
		Set<String> keySet = object.keySet();
		
		Iterator<String> iterator = keySet.iterator();
		
		while(iterator.hasNext()) {
			String key = iterator.next();
			
			dto.put(key, object.get(key).toString());
		}
		
		return dto;
	}
}
