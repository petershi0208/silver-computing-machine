package com.yqwan.cplfactory;

import java.net.URLEncoder;
import java.util.LinkedHashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import com.alipay.util.UtilDate;
import com.yqwan.service.Http;
import com.yqwan.service.Log;
import com.yqwan.sign.MD5;

public class JjwCPL extends CPL {
	/**
	 * 请求地址
	 */
	private static final String JXY_PATH = "http://www.jujuwan.com/returns/JJWReturn.ashx";

	@Override
	public String buildRequest(String uid, String tid, String tokenID,
			String nickname) {
		// TODO Auto-generated method stub
		Map<String,String> sParam = new LinkedHashMap<String,String>();
		sParam.put("uid",uid);
		sParam.put("regid",tid);
		try {
			sParam.put("uname",URLEncoder.encode(nickname, "utf-8"));
		} catch (Exception e) {
			sParam.put("uname", uid);
		}
		sParam.put("key", MD5.sign(uid+tid+"jujuwan", "utf-8"));
		Http hp = Http.getInstance();
		try {
			String result = hp.hp(JXY_PATH, sParam, "get");
Log.logResult(UtilDate.getDateFormatter()+":平台用户openid:"+uid+";聚聚玩返回"+result+"\r\n", "d:\\Logs\\CPLLogs");
			JSONObject jo = JSONObject.fromObject(result);
			String msg = jo.getString("msg");
			return msg;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "网络错误";
		}
	}

}
