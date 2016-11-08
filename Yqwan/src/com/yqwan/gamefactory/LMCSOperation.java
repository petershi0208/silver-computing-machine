package com.yqwan.gamefactory;

import java.util.LinkedHashMap;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.alipay.util.UtilDate;
import com.yqwan.service.Http;
import com.yqwan.service.Log;
import com.yqwan.service.MapToParam;

public class LMCSOperation extends Operation {
	/**
	 * 猎魔传说充值秘钥
	 */
	private static final String KEY = "ihsdighsdogjpodsjkgosdgjjhgg";
	/**
	 * 猎魔传说充值地址
	 */
	private static final String PAY_PATH = "http://admin.gz.1251109515.clb.myqcloud.com/admin/api.php";
	/**
	 * 猎魔传说角色查询地址
	 */
	private static final String CHECK_PATH = "http://admin.gz.1251109515.clb.myqcloud.com/admin/api.php";
	
	/**
	 * 猎魔传说登录地址
	 */
	private static final String LOGIN_PATH = "http://admin.gz.1251109515.clb.myqcloud.com/admin/api.php?m=open_login&";
	
	
	public LMCSOperation(String userid, int serverid) {
		super(userid, serverid);
		// TODO Auto-generated constructor stub
	}
	public LMCSOperation(){}
	
	@Override
	public String buildRequest(String timestamp) {
		// TODO Auto-generated method stub
		Map<String, String> sParaTemp = new LinkedHashMap<String, String>();
		sParaTemp.put("accid","528");
		sParaTemp.put("accname",userid);
		sParaTemp.put("serverid",serverid+"");
		sParaTemp.put("time",timestamp);
		String prestr = MapToParam.createRequestParams1(sParaTemp,KEY);
		return LOGIN_PATH+prestr;
	}

	@Override
	public String checkuser() {
		// TODO Auto-generated method stub
		try {
			Map<String,String> sParam = new LinkedHashMap<String,String>();
			sParam.put("m", "open_info");
			sParam.put("serverid", serverid+"");
			sParam.put("accid","528");
			sParam.put("accname", userid);
			Http hp = Http.getInstance();
			String result = hp.hp(CHECK_PATH, sParam, "get");
			 JSONArray ja = JSONArray.fromObject(result);
			 JSONObject jsonobject = (JSONObject) ja.get(0);
			 String lv = jsonobject.getString("lv");
			 return "{\"status\":\"0\",\"battlevalue\":\"0\",\"lv\":\""+lv+"\"}"; 		//test
		} catch (Exception e) {
			return "{\"status\":\"1\",\"battlevalue\":\"0\",\"lv\":\"error\"}"; 		//test
		}
	}

	@Override
	public String payresult(String timestamp, String tradeNo, String money,String ext) {
		// TODO Auto-generated method stub
		Map<String, String> sParaTemp = new LinkedHashMap<String, String>();
		sParaTemp.put("accid","528");
		sParaTemp.put("accname",userid);
		sParaTemp.put("serverid",serverid+"");
		sParaTemp.put("gold",Integer.parseInt(money)*10+"");
		sParaTemp.put("rmb",money);
		sParaTemp.put("orderno",tradeNo);
		sParaTemp.put("time",timestamp);
		sParaTemp = MapToParam.createValueMysign(sParaTemp,KEY);	//map中加入sign键值对        
		sParaTemp.put("m", "open_pay");
        String SubmitResult;
		try {
			Http h = Http.getInstance();
			 SubmitResult = h.hp(PAY_PATH,sParaTemp,"get");
Log.logResult(UtilDate.getDateFormatter()+";猎魔传说充值："+userid+";回调记录："+SubmitResult+"\r\n", "d:\\Logs\\PayLogs");		
			 if("1".equals(SubmitResult)){
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
