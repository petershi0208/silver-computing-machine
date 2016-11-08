package com.yqwan.cplfactory;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.commons.codec.EncoderException;

import net.sf.json.JSONObject;

import com.alipay.util.UtilDate;
import com.yqwan.service.Http;
import com.yqwan.service.Log;
import com.yqwan.service.MapToParam;

public class BbwCPL extends CPL {
	/**
	 * 请求地址
	 */
	private static final String PATH = "http://www.bengbeng.com/reannal.php";
	
	/**
	 * 秘钥
	 */
	private static final String KEY = "70e12ae563b403f3";
	@Override
	public String buildRequest(String uid, String tid, String tokenID,String nickname){
		// TODO Auto-generated method stub
		Map<String,String> sParam = new LinkedHashMap<String, String>();
		sParam.put("adID",tokenID);
		sParam.put("annalID", tid);
		sParam.put("idCode", uid);
		sParam  = MapToParam.createValueMysign(sParam, KEY);
		try {
			sParam.put("idName",URLEncoder.encode(nickname, "utf-8"));
		} catch (UnsupportedEncodingException e1) {
			sParam.put("idName",uid);
		}
		Http hp = Http.getInstance();
		try {
			String result = hp.hp(PATH, sParam, "get");
			Log.logResult(UtilDate.getDateFormatter()+":平台用户openid:"+uid+";蹦蹦网返回"+result+"\r\n", "d:\\Logs\\CPLLogs");
			JSONObject jo = JSONObject.fromObject(result);
			String message = jo.getString("message");
			return message;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "网络错误";
		}
	}

}
