package com.yqwan.cplfactory;


import java.util.LinkedHashMap;
import java.util.Map;

import com.alipay.util.UtilDate;
import com.yqwan.service.Http;
import com.yqwan.service.Log;
import com.yqwan.sign.MD5;

public class YrtCPL extends CPL {
	/**
	 * 易瑞特请求秘钥
	 */
	private static final String YRT_AD_KEY = "uvvmiz4j5i";
	
	/**
	 * 易瑞特请求地址
	 */
	private static final String YRT_PATH = "http://app.offer99.com/callback/callback_adv/callback_adv_s383ba10ba4fc8f3f18fe665e3dc2902.php";
	@Override
	public String buildRequest(String uid, String tid,String tokenID,String nickname) {
		// TODO Auto-generated method stub
		try {
			String sign = makeSign(uid,tid);
			Map<String,String> sParam = new LinkedHashMap<String, String>();
			sParam.put("tid", tid);
			sParam.put("uid", uid);
			sParam.put("sign", sign);
			Http p = Http.getInstance();
			String result = p.hp(YRT_PATH, sParam, "get");
Log.logResult(UtilDate.getDateFormatter()+":平台用户openid:"+uid+";易瑞特返回"+result+"\r\n", "d:\\Logs\\CPLLogs");
			return result;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "网络错误";
		}
	}
	
	/**
	 * 签名
	 * @param uid
	 * @param tid
	 * @return
	 */
	private String makeSign(String uid, String tid) {
		// TODO Auto-generated method stub
		String sign = tid+uid+YRT_AD_KEY;
		sign = MD5.sign(sign, "utf-8");
		return sign;
	}
}
