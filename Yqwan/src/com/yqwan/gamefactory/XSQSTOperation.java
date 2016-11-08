package com.yqwan.gamefactory;


import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.alipay.util.UtilDate;
import com.yqwan.service.Http;
import com.yqwan.service.Log;
import com.yqwan.sign.MD5;

public class XSQSTOperation extends Operation {
	/**
	 * 像素骑士团充值秘钥
	 */
	private static final String QST_PAY_KEY = "aa65b7efb3869293781b3d749e32c9f3";
	/**
	 * 像素骑士团充值地址
	 */
	private static final String QST_PATH =	"http://game.199ymxwk.90tank.com/lypage/paycallback.ashx";
	/**
	 * 像素骑士团角色查询地址
	 */
	private static final String QST_CHECK_PATH = "http://game.199ymxwk.90tank.com/lypage/getuserinfo.ashx";
	
	/**
	 * 像素骑士团登录地址
	 */
	private static final String LOGIN_PATH = "http://game.199ymxwk.90tank.com/lypage/game.aspx?";
	private static final int isAdult = 1;
	/**
	 * 像素骑士团角色查询地址秘钥
	 */
	private static final String LOGIN_KEY = "e356003c7fa55959ba7e623258338c00";
	
	public XSQSTOperation(String userid, int serverid) {
		super(userid, serverid);
		// TODO Auto-generated constructor stub
	}
	public XSQSTOperation() {}
	
	/**
	 * 拼接游戏接口路径
	 * @param userid
	 * @param serverid
	 * @param timestamp
	 */
	public String buildRequest(String timestamp) {
		// TODO Auto-generated method stub
		Map<String, String> sParaTemp = new LinkedHashMap<String, String>();
		sParaTemp.put("uid",userid);
		sParaTemp.put("serverid",serverid+"");
		sParaTemp.put("ptime",timestamp);
		sParaTemp.put("isadult",isAdult+"");
		//待请求参数数组
        String prestr = createRequestParam(sParaTemp,LOGIN_KEY);
		
        String allpath= LOGIN_PATH+prestr;
//		String sign = makesign(userid,serverid,timestamp);
//		String allpath= LOGIN_PATH+"uid="+userid+"&serverid="+serverid+"&ptime="+Integer.parseInt(timestamp)+"&isadult="+isAdult+"&sign="+sign;
		return allpath;
	}
	
	
	@Override
	public String checkuser() {
		// TODO Auto-generated method stub
		try {
			Map<String, String> sParam = new LinkedHashMap<String, String>();
			sParam.put("uid", userid);
			sParam.put("serverid", serverid+"");
			Http h = Http.getInstance();
			String SubmitResult = h.hp(QST_CHECK_PATH,sParam,"get");
			
//			String SubmitResult = Http.hp(QST_CHECK_PATH+"?uid="+userid+"&serverid="+serverid);
			 int a = SubmitResult.indexOf("{");
			 int b = SubmitResult.lastIndexOf("}");
			 SubmitResult =  SubmitResult.substring(a, b+1);

			 return SubmitResult;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "网络出错!";
		}
	}

	@Override
	public String payresult(String timestamp,String trade_no,String money,String ext) {
		// TODO Auto-generated method stub
		Map<String, String> sParaTemp = new LinkedHashMap<String, String>();
		sParaTemp.put("uid",userid);
		sParaTemp.put("zoneid",serverid+""); 
		sParaTemp.put("ptime", timestamp);
		sParaTemp.put("order",trade_no);
		sParaTemp.put("amount",0+"");                 
        sParaTemp.put("payitem",Integer.parseInt(money)*10+"");
		sParaTemp.put("paydes","");
		sParaTemp.put("debug",0+"");
		//待请求参数数组 String prestr = createRequestParam(sParaTemp,QST_PAY_KEY);
		
		sParaTemp = buildRequestPara(sParaTemp,QST_PAY_KEY);
        String SubmitResult;
		try {
			Http h = Http.getInstance();
			SubmitResult = h.hp(QST_PATH,sParaTemp,"get");
			
//			 SubmitResult = Http.hp(QST_PATH+"?"+prestr);
Log.logResult(UtilDate.getDateFormatter()+"：像素骑士团充值："+userid+";回调记录："+SubmitResult+"\r\n", "d:\\Logs\\PayLogs");
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

	/**
	 * 生成请求的参数
	 * @param sParaTemp
	 * @return
	 */
	private String createRequestParam(Map<String, String> sParaTemp,String key) {
		Map<String, String> sPara = buildRequestPara(sParaTemp,key);
        List<String> keys = new ArrayList<String>(sPara.keySet());  
        String prestr ="";
        for (int i = 0; i < keys.size(); i++) {
            String key1 = keys.get(i);
            String value = sPara.get(keys.get(i));
	        prestr = prestr + key1 + "=" + value + "&";
        }
        prestr = prestr.substring(0, prestr.length()-1);
		return prestr;
	}
	
	/**
     * 生成要请求给一起玩游戏的参数数组
     * @param sParaTemp 请求前的参数数组
     * @return 要请求的参数数组
     */
    private static Map<String, String> buildRequestPara(Map<String, String> sParaTemp,String PAY_KEY) {

        //生成签名结果
        String mysign = buildRequestMysign(sParaTemp,PAY_KEY);
        //签名结果与签名方式加入请求提交参数组中
        sParaTemp.put("Sign", mysign);

        return sParaTemp;
    }
    
	
	/**
     * 生成签名结果
     * @param sPara 要签名的数组
     * @return 签名结果字符串
     */
    private static String buildRequestMysign(Map<String, String> sPara,String PAY_KEY) {
    	String prestr = createLinkString(sPara,PAY_KEY); //把数组所有元素拼接成字符串
        String mysign = "";
        mysign = MD5.sign(prestr,"utf-8");
        return mysign;
    }
	
	/** 
     * 把数组所有元素排序，并按照“参数=参数值”的模式用“&”字符拼接成字符串
     * @param params 需要排序并参与字符拼接的参数组
     * @return 拼接后字符串
     */
    private static String createLinkString(Map<String, String> params,String PAY_KEY) {

        List<String> keys = new ArrayList<String>(params.keySet());
//        Collections.sort(keys);
        String prestr = "";

        for (int i = 0; i < keys.size(); i++) {
            String key = keys.get(i);
            String value = params.get(key);
	        prestr = prestr + key + "=" + value + "&";
        }
        prestr = prestr+PAY_KEY;
        return prestr;
    }
}
