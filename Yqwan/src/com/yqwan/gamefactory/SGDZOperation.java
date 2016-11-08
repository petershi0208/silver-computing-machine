package com.yqwan.gamefactory;

import java.util.LinkedHashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import com.alipay.util.UtilDate;
import com.yqwan.service.Http;
import com.yqwan.service.Log;
import com.yqwan.service.MapToParam;

public class SGDZOperation extends Operation {
	/**
	 * 时光德州秘钥
	 */
	private static final String LOGIN_KEY = "ce99c24a035737bf19646eb6ae1f52af";
	/**
	 * 时光德州秘钥
	 */
	private static final String PAY_KEY = "24708373c6ae1f757a0203a77d1bb4d8";
	/**
	 * 时光德州充值地址
	 */
	private static final String PAY_PATH =	"http://120.26.204.26:8081/order/199YCallback";
	/**
	 * 时光德州角色查询地址
	 */
	private static final String CHECK_PATH = "???";
	
	/**
	 * 时光德州登录地址
	 */
	private static final String LOGIN_PATH = "http://dz.p3k3.com/game199y.html";
	private static final int isAdult = 1;
		
	public SGDZOperation(String userid, int serverid) {
		super(userid, serverid);
		// TODO Auto-generated constructor stub
	}
	public SGDZOperation(){}
	
	@Override
	public String buildRequest(String timestamp) {
		// TODO Auto-generated method stub
		Map<String, String> sParaTemp = new LinkedHashMap<String, String>();
		sParaTemp.put("userid",userid);
		sParaTemp.put("serverid",serverid+"");
		sParaTemp.put("ptime",timestamp);
		sParaTemp.put("isadult",isAdult+"");
		String prestr = MapToParam.createRequestParams(sParaTemp,"&"+LOGIN_KEY);
		return LOGIN_PATH+"?"+prestr;
	}

	@Override
	public String checkuser() {
		// TODO Auto-generated method stub
		try {
			Map<String,String> sParam = new LinkedHashMap<String,String>();
			sParam.put("userid", userid);
			sParam.put("serverid", serverid+"");
			Http hp = Http.getInstance();
			String result = hp.hp(CHECK_PATH, sParam, "get");
			 JSONObject jsonobject = JSONObject.fromObject(result);
			 String lv = jsonobject.getString("lv");
			 return "{\"status\":\"0\",\"battlevalue\":\"0\",\"lv\":\""+lv+"\"}"; 		//test
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return "{\"status\":\"1\",\"battlevalue\":\"0\",\"lv\":\"0\"}"; 		//test
		}
	}

	@Override
	public String payresult(String timestamp, String tradeNo,String money,String ext) {
		// TODO Auto-generated method stub
		Map<String, String> sParaTemp = new LinkedHashMap<String, String>();
		sParaTemp.put("userid",userid);
		sParaTemp.put("serverid",serverid+""); 
		sParaTemp.put("ptime", timestamp);
		sParaTemp.put("order",tradeNo);
		sParaTemp.put("money",money);
		sParaTemp = MapToParam.createKeyValueMysign(sParaTemp, "&"+PAY_KEY);	//map中加入sign键值对        
//		sParaTemp.put("a", "Pay");
//		sParaTemp.put("m", "Payment");
//		sParaTemp.put("sp", "180");
//		sParaTemp.put("ac", "deliver");
        String SubmitResult;
		try {
			Http h = Http.getInstance();
			 SubmitResult = h.hp(PAY_PATH,sParaTemp,"get");
Log.logResult(UtilDate.getDateFormatter()+";时光德州充值："+userid+";回调记录："+SubmitResult+"\r\n", "d:\\Logs\\PayLogs");
			 int a = SubmitResult.indexOf("{");
			 int b = SubmitResult.lastIndexOf("}");
			 SubmitResult =  SubmitResult.substring(a, b+1);
			 JSONObject jsonobject = JSONObject.fromObject(SubmitResult);
			 String status = jsonobject.getString("status");
			 String msg = jsonobject.getString("msg");
//System.out.println("充值状态1为成功:"+status);
			
			 if("1".equals(status)){
				 return "充值成功";
			 }else{
				 return msg;
			 }      
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "网络出错!";
		}	
	}	
}
