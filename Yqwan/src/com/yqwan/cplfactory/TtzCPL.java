package com.yqwan.cplfactory;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.LinkedHashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import com.alipay.sign.MD5;
import com.alipay.util.UtilDate;
import com.yqwan.service.Http;
import com.yqwan.service.Log;

public class TtzCPL extends CPL {
	/**
	 * 请求地址
	 */
	private static final String JXY_PATH = "http://api.ttz.com";
	
	/**
	 * 秘钥
	 */
	private static final String TOKENKEY = "4d11d05aff0c626d3edc6048f1c63eff";
	@Override
	public String buildRequest(String uid, String tid,String tokenID,String nickname) {
		// TODO Auto-generated method stub
		Map<String,String> sParam = new LinkedHashMap<String, String>();
		sParam.put("api_action", "Game.Api.Games");
		sParam.put("regid", tid);
		sParam.put("project_id", tokenID);
		sParam.put("uid", uid);
		try {
			sParam.put("idName",URLEncoder.encode(nickname, "utf-8"));
		} catch (UnsupportedEncodingException e1) {
			sParam.put("idName",uid);
		}
		sParam.put("sign",MD5.sign(tid+tokenID, TOKENKEY, "UTF-8"));
		try {
			String result = Http.getInstance().hp(JXY_PATH, sParam, "get");
Log.logResult(UtilDate.getDateFormatter()+":平台用户openid:"+uid+";天天钻返回"+result+"\r\n", "d:\\Logs\\CPLLogs");
			JSONObject jo = JSONObject.fromObject(result);
			String CODE = jo.getString("CODE");
			return CODE;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "网络错误";
		}
	}
}
