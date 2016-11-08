package com.yqwan.gamefactory;

import java.util.LinkedHashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import com.alipay.util.UtilDate;
import com.yqwan.service.Http;
import com.yqwan.service.Log;
import com.yqwan.service.MapToParam;

public class MHJYOperation extends Operation {
	/**
	 * 梦幻家园秘钥
	 */
	private static final String KEY = "ds3d3e9b7930098ue83ffb6b3388383f";
	/**
	 * 梦幻家园充值地址
	 */
	private static final String PAY_PATH =	"http://paycenter.layabox.com/Pay/180/deliver";
	/**
	 * 梦幻家园角色查询地址
	 */
	private static final String CHECK_PATH = "http://mhjy.layabox.com/index.html";
	
	/**
	 * 梦幻家园登录地址
	 */
	private static final String LOGIN_PATH = "http://mhjy.layabox.com/index.html?relatedId=657";
	private static final int isAdult = 1;
	
	
	public MHJYOperation(String userid, int serverid) {
		super(userid, serverid);
		// TODO Auto-generated constructor stub
	}
	public MHJYOperation(){}
	
	@Override
	public String buildRequest(String timestamp) {
		// TODO Auto-generated method stub
		Map<String, String> sParaTemp = new LinkedHashMap<String, String>();
		sParaTemp.put("userid",userid);
		sParaTemp.put("serverid",serverid+"");
		sParaTemp.put("ptime",timestamp);
		sParaTemp.put("isadult",isAdult+"");
		String prestr = MapToParam.createRequestParams(sParaTemp,"&"+KEY);
		return LOGIN_PATH+"&"+prestr;
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
	public String payresult(String timestamp, String tradeNo, String money,String ext) {
		// TODO Auto-generated method stub
		Map<String, String> sParaTemp = new LinkedHashMap<String, String>();
		sParaTemp.put("userid",userid);
		sParaTemp.put("serverid",serverid+""); 
		sParaTemp.put("ptime", timestamp);
		sParaTemp.put("order",tradeNo);
		sParaTemp.put("money",money);
		sParaTemp = MapToParam.createKeyValueMysign(sParaTemp, "&"+KEY);	//map中加入sign键值对        
//		sParaTemp.put("a", "Pay");
//		sParaTemp.put("m", "Payment");
//		sParaTemp.put("sp", "180");
//		sParaTemp.put("ac", "deliver");
        String SubmitResult;
		try {
			Http h = Http.getInstance();
			 SubmitResult = h.hp(PAY_PATH,sParaTemp,"get");
Log.logResult(UtilDate.getDateFormatter()+";梦幻家园充值："+userid+";回调记录："+SubmitResult+"\r\n", "d:\\Logs\\PayLogs");
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
