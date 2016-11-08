package com.yqwan.gamefactory;


import java.util.LinkedHashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import com.alipay.util.UtilDate;
import com.yqwan.service.Http;
import com.yqwan.service.Log;
import com.yqwan.service.MapToParam;
import com.yqwan.sign.MD5;

public class SGZNOperation extends Operation {
	/**
	 * 三国之怒充值地址
	 */
	private static final String SGZN_PATH =	"http://115.159.197.195:50058/login/Recharge.php";
	/**
	 * 三国之怒角色查询地址
	 */
	private static final String SGZN_CHECK_PATH = "http://115.159.197.195:50058/login/checkUser.php";
	
	/**
	 * 三国之怒登录地址
	 */
	private static final String LOGIN_PATH = "http://115.159.197.195:50058/login/login.php?";
	private static final int isAdult = 1;
	/**
	 * 三国之怒秘钥
	 */
	private static final String KEY = "Awcme321aw*";
	
	public SGZNOperation(String userid, int serverid) {
		super(userid, serverid);
	}
	public SGZNOperation() {
	}
	
	/**
	 * 拼接游戏接口路径
	 * @param userid
	 * @param serverid
	 * @param timestamp
	 */
	public String buildRequest(String timestamp) {
		// TODO Auto-generated method stub
		Map<String, String> sParaTemp = new LinkedHashMap<String, String>();
		sParaTemp.put("platform","199y");
		sParaTemp.put("serverid",serverid+"");
		sParaTemp.put("username",userid);   
		sParaTemp.put("isadult",isAdult+""); 
		sParaTemp.put("logintype","0");
		
        String sParaTempValue = MapToParam.createValue(sParaTemp);
        sParaTemp.put("sign", MD5.sign1(sParaTempValue, KEY, "utf-8"));
        sParaTemp.put("time", timestamp);
        String prestr = MapToParam.createKeyValue(sParaTemp);		//待请求参数数组
        String allpath= LOGIN_PATH+prestr;
		return allpath;
	}
	
	
	@Override
	public String checkuser() {
		// TODO Auto-generated method stub
		try {
			Map<String, String> sParaTemp = new LinkedHashMap<String, String>();
			sParaTemp.put("platform","199y");
			sParaTemp.put("serverid",serverid+"");
			sParaTemp.put("username",userid); 
	        String sParaTempValue = MapToParam.createValue(sParaTemp);
	        sParaTemp.put("sign", MD5.sign1(sParaTempValue,KEY,"UTF-8"));
	        sParaTemp.put("time",UtilDate.getTimeStamp());
	        
	        Http h = Http.getInstance();
	        String SubmitResult = h.hp(SGZN_CHECK_PATH,sParaTemp,"get");        
//			String SubmitResult = Http.hp(SGZN_CHECK_PATH+prestr);
			 int a = SubmitResult.indexOf("{");
			 int b = SubmitResult.lastIndexOf("}");
			 SubmitResult =  SubmitResult.substring(a, b+1);
			 JSONObject jsonobject = JSONObject.fromObject(SubmitResult);
			 int code = jsonobject.getInt("code");
			 if(0==code){
				 int level =  jsonobject.getInt("level");
				 String name = (String) jsonobject.get("name");
				 return "{\"status\":\"0\",\"battlevalue\":\""+name+"\",\"lv\":\""+level+"\"}";
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
	public String payresult(String timestamp,String trade_no,String money,String ext) {
		// TODO Auto-generated method stub
		Map<String, String> sParaTemp = new LinkedHashMap<String, String>();
		sParaTemp.put("platform","199y");
		sParaTemp.put("serverId",serverid+"");
		sParaTemp.put("userName",userid);

		sParaTemp.put("orderId",trade_no);
		sParaTemp.put("gold",Integer.parseInt(money)*10+"");
        sParaTemp.put("money",Integer.parseInt(money)+"");

        String sParaTempValue = MapToParam.createValue(sParaTemp);
        sParaTemp.put("sign", MD5.sign1(sParaTempValue,KEY,"UTF-8"));
        sParaTemp.put("time",UtilDate.getTimeStamp());
        
        
        String SubmitResult;
		try {
			Http h = Http.getInstance();
			 SubmitResult = h.hp(SGZN_PATH,sParaTemp,"get");
Log.logResult(UtilDate.getDateFormatter()+"：三国之怒充值："+userid+";回调记录："+SubmitResult+"\r\n", "d:\\Logs\\PayLogs");			 		
			 if("0".equals(SubmitResult)){
				 return "充值成功";
			 }else{
				 return SubmitResult;
			 }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "网络出错!";
		}		
	}
}
