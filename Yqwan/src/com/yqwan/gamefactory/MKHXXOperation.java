package com.yqwan.gamefactory;

import java.util.LinkedHashMap;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.alipay.util.UtilDate;
import com.yqwan.service.Http;
import com.yqwan.service.Log;
import com.yqwan.service.MapToParam;
import com.yqwan.sign.MD5;

public class MKHXXOperation extends Operation {
	/**
	 * 魔卡幻想X登录地址
	 
	private String login_path = "http://s"+serverid+".199y.mysticalcard.com?";*/
	/**
	 * 摩卡幻想X查询地址	 
	private String check_path = "http://s"+serverid+".199y.mysticalcard.com/deposit_union.php";*/
	/**
	 * 摩卡幻想X充值地址	 
	private String pay_path = "http://s"+serverid+".199y.mysticalcard.com/deposit_union.php";*/
	
	/**
	 * 摩卡幻想X秘钥
	 */
	private static final String KEY = "199y#6m2+0qa$c9*8^w8q";
	/**
	 * 摩卡幻想X游戏ID
	 */
	private static final int GAMEID = 4009;
	
	
	public MKHXXOperation(String userid, int serverid) {
		super(userid, serverid);
		// TODO Auto-generated constructor stub
	}
	public MKHXXOperation() {
	}

	@Override
	public String buildRequest(String timestamp) {
		/**
		 * 魔卡幻想X登录地址
		 */
		String login_path;
		Map<String,String> sParam = new LinkedHashMap<String,String>();
		sParam.put("puid",MD5.sign(userid, "utf-8"));		
		if(serverid==1){
			login_path = "http://s2.mkwebhf.mysticalcard.com?";
			sParam.put("serverid","10");
		}else{
			login_path = "http://s"+serverid+".199y.mysticalcard.com?";
			sParam.put("serverid", serverid+"");
		}				
		sParam.put("time", timestamp);
		sParam.put("gid", GAMEID+"");
		String prestr = MapToParam.createRequestParams1(sParam, KEY);
		return login_path+prestr;
	}

	@Override
	public String checkuser() {
		/**
		 * 魔卡幻想X查询地址	 
		*/
		String check_path;
		if(serverid==1){
			check_path = "http://s2.mkwebhf.mysticalcard.com/deposit_union.php";
		}else{
			check_path = "http://s"+serverid+".199y.mysticalcard.com/deposit_union.php";
		}
		
		Map<String,String> sParam = new LinkedHashMap<String,String>();
		sParam.put("puid",MD5.sign(userid, "utf-8"));
		sParam.put("serverid", serverid+"");
		sParam.put("time",UtilDate.getTimeStamp());
		sParam.put("gid", GAMEID+"");
		sParam = MapToParam.createValueMysign(sParam, KEY);
		sParam.put("do", "GetPlayer");
		Http h = Http.getInstance();
		try {
			String SubmitResult = h.hp(check_path,sParam,"get");
			JSONObject jsonobject = JSONObject.fromObject(SubmitResult);
			 String status = jsonobject.getString("errno");
			 if("0".equals(status)){
				String data = jsonobject.getString("data");
				JSONArray js = JSONArray.fromObject(data);
				jsonobject = (JSONObject) js.get(0);
				String level = jsonobject.getString("level");
				String exp = jsonobject.getString("exp");
				 return "{\"status\":\"0\",\"battlevalue\":\""+exp+"\",\"lv\":\""+level+"\"}";
			 }else{
				 return "{\"status\":\"1\",\"battlevalue\":\"0\",\"lv\":\"0\"}";
			 }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "{\"status\":\"1\",\"battlevalue\":\"0\",\"lv\":\"0\"}";
		}
	}

	@Override
	public String payresult(String timestamp, String tradeNo, String money,String ext) {
		/**
		 * 魔卡幻想X充值地址
		*/
		String pay_path;
		if(serverid==1){
			pay_path = "http://s2.mkwebhf.mysticalcard.com/deposit_union.php";
		}else{
			pay_path = "http://s"+serverid+".199y.mysticalcard.com/deposit_union.php";
		}
		
		Map<String,String> sParam = new LinkedHashMap<String,String>();
		sParam.put("puid",MD5.sign(userid, "utf-8"));
		sParam.put("serverid", serverid+"");
		sParam.put("orderid",tradeNo);
		sParam.put("money",money);
		sParam.put("time",UtilDate.getTimeStamp());
		sParam.put("gid", GAMEID+"");
		sParam = MapToParam.createValueMysign(sParam, KEY);
		try {
			Http h = Http.getInstance();
			String result = h.hp(pay_path, sParam, "get");
Log.logResult(UtilDate.getDateFormatter()+"：魔卡幻想X充值："+userid+";回调记录："+result+"\r\n", "d:\\Logs\\PayLogs");			

			if("success".equals(result)){
				return "充值成功";
			}else{
				return result;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "网络出错!";
		}
	}

}
