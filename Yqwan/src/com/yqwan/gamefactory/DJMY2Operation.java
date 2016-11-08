package com.yqwan.gamefactory;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.yqwan.service.Http;
import com.yqwan.sign.MD5;

public class DJMY2Operation extends Operation {
	/**
	 * 刀剑魔药查询角色地址
	 */
	private static final String DJMY_CHECK_PATH = "http://www.u77.com/api/djmyuserquery";	
	/**
	 * 刀剑魔药游戏充值地址
	 */
	private static final String DJMY_PATH =	"http://www.u77.com/gamegate/djmy_pay";
	/**
	 * 刀剑魔药秘钥
	 */
	private static final String DJMY_PAY_KEY = "1a7a81dd563ed75d7c240a4cc4355556";
	
	/**
	 * 刀剑魔药2登录路径
	 */
	private static final String LOGIN_PATH = "http://www.u77.com/gamegate/djmy_login?";
	/**
	 * 刀剑魔药2的登录秘钥
	 */
	private static String LOGIN_KEY = "1a7a81dd563ed75d7c240a4cc4355556";
	
	public DJMY2Operation(String userid, int serverid) {
		super(userid, serverid);
		// TODO Auto-generated constructor stub
	}
	public DJMY2Operation(){}
	
	@Override
	public String buildRequest(String timestamp) {
		// TODO Auto-generated method stub
		String sign = makesign(userid,timestamp);
		String allpath= LOGIN_PATH+"username="+userid+"&plat=199y&time="+Integer.parseInt(timestamp)+"&sign="+sign;
		return allpath;
	}
	
	
	@Override
	public String checkuser() {
		// TODO Auto-generated method stub		
		String SubmitResult;
		try {
			Map<String, String> sParaTemp = new LinkedHashMap<String, String>();
			sParaTemp.put("username", userid);
			Http h = Http.getInstance();
			SubmitResult = h.hp(DJMY_CHECK_PATH,sParaTemp,"get");
			if("0".equals(SubmitResult)){
				 return "{\"status\":\"0\",\"battlevalue\":\"0\",\"lv\":\"0\"}";
			 }else{
				 return "{\"status\":\"1\",\"battlevalue\":\"0\",\"lv\":\"0\"}";
			 }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "网络错误";
		}		
			 
	}

	@Override
	public String payresult(String timestamp,String trade_no,String money,String ext) {
		// TODO Auto-generated method stub
		Map<String, String> sParaTemp = new LinkedHashMap<String, String>();
		sParaTemp.put("plat","199y");
		sParaTemp.put("username",userid);
		sParaTemp.put("orderid", trade_no);
		sParaTemp.put("money",Integer.parseInt(money)*100+"");			//规则支付乘以100

		String sign = buildu77sign(sParaTemp,DJMY_PAY_KEY);
		sParaTemp.put("sign", sign);
		
//		String prestr = buildRequestParam(sParaTemp,DJMY_PAY_KEY);
		String SubmitResult;
		try {
			Http h = Http.getInstance();
			SubmitResult = h.hp(DJMY_PATH,sParaTemp,"get");
			int a = SubmitResult.indexOf("{");
			 int b = SubmitResult.lastIndexOf("}");
			 SubmitResult =  SubmitResult.substring(a, b+1);
			 JSONObject jsonobject = JSONObject.fromObject(SubmitResult);
			 String status = jsonobject.getString("status");
//			String msg = jsonobject.getString("msg");
//System.out.println("充值状态0为成功:"+status);
			
			 if("0".equals(status)){
				 return "充值成功";
			 }else{
				 return "验证失败";
			 }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "网络错误";
		}
			 
	}
	
	/**
	 * U77充值接口  参数签名
	 * @param sParaTemp	参数
	 * @param djmyPayKey	秘钥
	 * @return
	 */
	private static String buildu77sign(Map<String, String> sParaTemp,
			String djmyPayKey) {
//		String plat = sParaTemp.get("plat");
//		String username = sParaTemp.get("username");
//		String orderid = sParaTemp.get("orderid");
//		String money = sParaTemp.get("money");
		sParaTemp.put("key", djmyPayKey);
		List<String> keys = new ArrayList<String>(sParaTemp.keySet()); 
		String sign ="";
		for(int i=0;i<sParaTemp.size();i++){
			sign += sParaTemp.get(keys.get(i));
		}
		sign = MD5.sign(sign, "utf-8");
		return sign;
	}

	
	/**
	 * 签名
	 * @param userid	用户名
	 * @param serverid	服务器号
	 * @param timestamp	时间戳
	 * @return
	 */
	private static String makesign(String userid,String timestamp) {
		String text = "71199y"+userid+timestamp+LOGIN_KEY;
		String sign = MD5.sign(text, "utf-8");
		return sign;
	}

}
