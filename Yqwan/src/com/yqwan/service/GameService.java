package com.yqwan.service;

import java.io.PrintWriter;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 
 * @author TYShi
 *
 */
public class GameService {
	/**
	 * 判断是否跨域请求，返回数据
	 * @param callback	异步请求参数
	 * @param out	输出流
	 * @param back	返回的数据
	 */
	public static void result(String callback, PrintWriter out, String back) {
		if(callback!=null){
			out.print(callback+"("+back+")");
		}else{
			out.print(back);
		}
	}
	
	
	/**
	 * list转成json	
	 * @param list	集合
	 * @return	返回eg:{'code':0,'jsonarray':'xxx'}
	 */
	@SuppressWarnings("unchecked")
	public static JSONObject listToJson(List list){
		JSONArray obj = JSONArray.fromObject(list);
		String lista = obj.toString();
		String back = "{'code':0,'jsonarray':'" + lista + "'}";
		JSONObject jsonback = JSONObject.fromObject(back);
		return jsonback;
	}
}
