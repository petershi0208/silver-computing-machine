package com.yqwan.gamefactory;


import java.net.URLDecoder;
import java.util.LinkedHashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import com.alipay.util.UtilDate;
import com.yqwan.service.Http;
import com.yqwan.service.Log;
import com.yqwan.service.MapToParam;
import com.yqwan.sign.MD5;

public class LJSGOperation extends Operation {
	/**
	 * 龙降三国充值地址
	 */
	private static final String PAY_PATH =	"http://ljsg.plgame8.com/lj199y/pay.php";
	/**
	 * 龙降三国角色查询地址
	 */
	private static final String CHECK_PATH = "http://ljsg.plgame8.com/lj199y/queryuser.php";
	
	/**
	 * 龙降三国登录地址http://app1101502890.qzone.qzoneapp.com/ms/
	 */
	private static final String LOGIN_PATH = "http://ljsg.plgame8.com/lj199y/login.php?";
	private static final int isAdult = 1;
	private static final String PID = "42";
	/**
	 * 兽魔奇迹秘钥
	 */
	private static final String KEY = "QEmgn4pMLHV5tuCy";
	
	public LJSGOperation(String userid, int serverid) {
		super(userid, serverid);
	}
	public LJSGOperation() {
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
		sParaTemp.put("pid",PID);
		sParaTemp.put("userid",userid);
		sParaTemp.put("serverid",serverid+"");
		sParaTemp.put("time", timestamp);
		sParaTemp.put("isadult",isAdult+""); 
        String sParaTempValue = MapToParam.createValue(sParaTemp);
        sParaTemp.put("sign", MD5.sign(sParaTempValue, KEY, "utf-8"));
        
        String prestr = MapToParam.createKeyValue(sParaTemp);		//待请求参数数组
        String allpath= LOGIN_PATH+prestr;
		return allpath;
	}
	
	
	@Override
	public String checkuser() {
		// TODO Auto-generated method stub
		try {
			Map<String, String> sParaTemp = new LinkedHashMap<String, String>();
			sParaTemp.put("serverid",serverid+"");
			sParaTemp.put("userid",userid); 
			sParaTemp.put("pid",PID); 
	      
	        
	        Http h = Http.getInstance();
	        String SubmitResult = h.hp(CHECK_PATH,sParaTemp,"get");      
			int a = SubmitResult.indexOf("{");
			int b = SubmitResult.lastIndexOf("}");
			SubmitResult =  SubmitResult.substring(a, b+1);
			 
			JSONObject jsonobject = JSONObject.fromObject(SubmitResult);
			int lv = jsonobject.getInt("level");
			String nickname = (String) jsonobject.get("nickname");
			return "{\"status\":\"0\",\"battlevalue\":\""+URLDecoder.decode(nickname)+"\",\"lv\":\""+lv+"\"}";		 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("龙降三国未创建角色");
			return "{\"status\":\"1\",\"battlevalue\":\"0\",\"lv\":\"0\"}";
		}
	}

	@Override
	public String payresult(String timestamp,String trade_no,String money,String ext) {
		// TODO Auto-generated method stub
		Map<String, String> sParaTemp = new LinkedHashMap<String, String>();		
		sParaTemp.put("pid",PID);
		sParaTemp.put("userid",userid);
		sParaTemp.put("serverid",serverid+"");
		sParaTemp.put("gold",Integer.parseInt(money)*10+"");
        sParaTemp.put("rmb",money);
        sParaTemp.put("orderno",trade_no);
        sParaTemp.put("time",UtilDate.getTimeStamp());
        String sParaTempValue = MapToParam.createValue(sParaTemp);
        sParaTemp.put("sign", MD5.sign(sParaTempValue,KEY,"UTF-8"));      
        
        String SubmitResult;
		try {
			Http h = Http.getInstance();
			 SubmitResult = h.hp(PAY_PATH,sParaTemp,"get");
Log.logResult(UtilDate.getDateFormatter()+"：龙降三国充值："+userid+";回调记录："+SubmitResult+"\r\n", "d:\\Logs\\PayLogs");			 		
			 if("1".equals(SubmitResult.trim())){
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
