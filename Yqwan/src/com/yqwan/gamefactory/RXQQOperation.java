package com.yqwan.gamefactory;

import java.util.LinkedHashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import com.alipay.util.UtilDate;
import com.yqwan.service.Http;
import com.yqwan.service.Log;
import com.yqwan.service.MapToParam;

public class RXQQOperation extends Operation {
	/**
	 * 热血球球充值秘钥
	 */
	private static final String QQ_PAY_KEY = "db0b7f4ef4ecbff85544b519378ca39e";
	/**
	 * 热血球球角色查询地址秘钥
	 */
	private static final String LOGIN_KEY = "966d3bdc7abc25c697d2df743226bdce";
	
	/**
	 * 热血球球充值地址
	 */
	private static final String QQ_PAY_PATH =	"http://csdkh5.3333.cn:9090/csdkh5/h5/pay/8030/199y/payNotify.htm";
	/**
	 * 热血球球角色查询地址
	 */
	private static final String QQ_CHECK_PATH = "http://csdkh5.3333.cn:9090/csdkh5/h5/special/8030/h5_199y/getPlayInfo.htm";
	
	/**
	 * 热血球球登录地址
	 */
	private static final String QQ_LOGIN_PATH = "http://csdkh5.3333.cn:9090/csdkh5/h5/user/8030/199y/login.htm?";
	private static final int isAdult = 1;   
	
	
	public RXQQOperation(String userid, int serverid) {
		super(userid, serverid);
		// TODO Auto-generated constructor stub
	}
	public RXQQOperation(){}
	
	@Override
	public String buildRequest(String timestamp) {
		// TODO Auto-generated method stub
		Map<String, String> sParaTemp = new LinkedHashMap<String, String>();
		sParaTemp.put("userid",userid);
		sParaTemp.put("serverid",serverid+"");
		sParaTemp.put("ptime",timestamp);
		sParaTemp.put("isadult",isAdult+"");
		String prestr = MapToParam.createRequestParams(sParaTemp,"&"+LOGIN_KEY);
		return QQ_LOGIN_PATH+prestr;
	}

	@Override
	public String checkuser() {
		// TODO Auto-generated method stub
		try {
			Map<String,String> sParam = new LinkedHashMap<String,String>();
			sParam.put("userid", userid);
			sParam.put("serverid", serverid+"");
			Http hp = Http.getInstance();
			String result = hp.hp(QQ_CHECK_PATH, sParam, "get");
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
		sParaTemp = MapToParam.createKeyValueMysign(sParaTemp, "&"+QQ_PAY_KEY);	//map中加入sign键值对        
        String SubmitResult;
		try {
			Http h = Http.getInstance();
			 SubmitResult = h.hp(QQ_PAY_PATH,sParaTemp,"get");
Log.logResult(UtilDate.getDateFormatter()+";热血球球充值："+userid+";回调记录："+SubmitResult+"\r\n", "d:\\Logs\\PayLogs");
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
