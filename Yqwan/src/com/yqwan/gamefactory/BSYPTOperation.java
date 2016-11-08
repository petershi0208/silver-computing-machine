package com.yqwan.gamefactory;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.yqwan.service.Http;
import com.yqwan.service.Log;
import com.yqwan.sign.MD5;

public class BSYPTOperation extends Operation {
	/**
	 * 宝石与爬塔充值秘钥
	 */
	private static final String PT_PAY_KEY = "a15084b4e07daf1849d871be5f365590";
	/**
	 * 宝石与爬塔查询秘钥
	 */
	private static final String PT_CHECK_KEY = "73255d4f1e57a0186c9dfffb753e4d6b";
	/**
	 * 宝石与爬塔充值地址
	 */
	private static final String PT_PAY_PATH =	"http://colagame.com:9001/ptx_199y/P199YPaycb";
	/**
	 * 宝石与爬塔角色查询地址
	 */
	private static final String PT_CHECK_PATH = "http://qq.17515.cn:880/gamelist/199y/199y_pt_player.php";
	
	/**
	 * 宝石与爬塔登录地址
	 */
	private static final String PT_LOGIN_PATH = "http://colagame.com:9001/ptx_199y/P199YLogin?";
	private static final int isAdult = 1;
	/**
	 * 宝石与爬塔角色查询地址秘钥
	 */
	private static final String LOGIN_KEY = "3f77e746f7afabccaec053a8ec535e24";
	
	public BSYPTOperation(String userid, int serverid) {
		super(userid, serverid);
		// TODO Auto-generated constructor stub
	}
	public BSYPTOperation(){}
	
	@Override
	public String buildRequest(String timestamp) {
		// TODO Auto-generated method stub
		Map<String, String> sParaTemp = new LinkedHashMap<String, String>();
		sParaTemp.put("uid",userid);
		sParaTemp.put("serverid",serverid+"");
		sParaTemp.put("ptime",timestamp);
		sParaTemp.put("isadult",isAdult+"");
		//待请求参数数组
        String prestr = createRequestParam(sParaTemp,LOGIN_KEY);
		
        String allpath= PT_LOGIN_PATH+prestr;
//		String sign = makesign(userid,serverid,timestamp);
//		String allpath= LOGIN_PATH+"uid="+userid+"&serverid="+serverid+"&ptime="+Integer.parseInt(timestamp)+"&isadult="+isAdult+"&sign="+sign;
		return allpath;
	}

	@Override
	public String checkuser() {
		// TODO Auto-generated method stub
		try {
//			String timestamp = UtilDate.getTimeStamp();
//			String s = userid+serverid+timestamp+PT_CHECK_KEY;
//			String sign = MD5.sign(s, "utf-8");
//			Map<String,String> sParam = new LinkedHashMap<String, String>();
//			sParam.put("id", userid);
//			sParam.put("sid", serverid+"");
//			sParam.put("time", timestamp);
//			sParam.put("sign", sign);
//			Http h = Http.getInstance();
//			String SubmitResult = h.hp(PT_CHECK_PATH, sParam, "get");
//			 int a = SubmitResult.indexOf("{");
//			 int b = SubmitResult.lastIndexOf("}");
//			 SubmitResult =  SubmitResult.substring(a, b+1);
//System.out.println(SubmitResult);
//			 JSONObject jsonobject = JSONObject.fromObject(SubmitResult);
//			 String floor = jsonobject.getString("msg");
//			 return "{\"status\":\"0\",\"battlevalue\":\""+floor+"\",\"lv\":\""+floor+"\"}";
			 return "{\"status\":\"0\",\"battlevalue\":\"0\",\"lv\":\"0\"}"; 		//test
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "网络出错!";
		}
	}

	@Override
	public String payresult(String timestamp, String tradeNo, String money,String ext) {
		// TODO Auto-generated method stub
		Map<String, String> sParaTemp = new LinkedHashMap<String, String>();
		sParaTemp.put("uid",userid);
		sParaTemp.put("zoneid",serverid+""); 
		sParaTemp.put("ptime", timestamp);
		sParaTemp.put("order",tradeNo);
		sParaTemp.put("amount",Integer.parseInt(money)*100+"");                 
        sParaTemp.put("payitem",0+"");
		sParaTemp.put("paydes","");
		sParaTemp.put("debug",0+"");
		
		sParaTemp = buildRequestPara(sParaTemp,PT_PAY_KEY);	//map中加入sign键值对
        
        String SubmitResult;
		try {
			Http h = Http.getInstance();
			 SubmitResult = h.hp(PT_PAY_PATH,sParaTemp,"get");
Log.logResult("宝石与爬塔充值："+userid+";回调记录："+SubmitResult+"\r\n", "d:\\Logs\\PayLogs");
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
