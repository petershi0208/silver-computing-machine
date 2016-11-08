package com.yqwan.cplfactory;

import java.util.LinkedHashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import com.alipay.sign.MD5;
import com.alipay.util.UtilDate;
import com.yqwan.service.Http;
import com.yqwan.service.Log;
import com.yqwan.service.MapToParam;

public class JxyCPL extends CPL {
	/**
	 * 聚享游请求地址
	 */
	private static final String JXY_PATH = "http://api.juxiangyou.com/web/enjoy.php";
	
	/**
	 * 聚享游提供的秘钥
	 */
	private static final String TOKENKEY = "8b3505e8f48151cd";
	@Override
	public String buildRequest(String uid, String tid,String tokenID,String nickname) {
		// TODO Auto-generated method stub
		Map<String,String> sParam = new LinkedHashMap<String, String>();
		sParam.put("tokenID", tokenID);
		sParam.put("recordID", tid);
		sParam.put("accessCode", uid);
		String str = MapToParam.createValue(sParam);
		sParam.put("accessKey",MD5.sign(str, TOKENKEY, "UTF-8"));
		try {
			String result = Http.getInstance().hp(JXY_PATH, sParam, "get");
Log.logResult(UtilDate.getDateFormatter()+":平台用户openid:"+uid+";聚享游返回"+result+"\r\n", "d:\\Logs\\CPLLogs");
			JSONObject jo = JSONObject.fromObject(result);
			String access_token = jo.getString("access_token");
			return access_token;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "网络错误";
		}
	}
}
