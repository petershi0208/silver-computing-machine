package com.yqwan.service;
//
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Map;
//
//import net.sf.json.JSONObject;
//
//import org.apache.commons.httpclient.HttpClient;
//import org.apache.commons.httpclient.HttpException;
//import org.apache.commons.httpclient.HttpMethod;
//import org.apache.commons.httpclient.methods.GetMethod;
//
//import com.alipay.config.AlipayConfig;
//import com.yqwan.sign.MD5;
//
///* *
// *类名：Pay
// *功能：像素骑士团充值接口(不用)
// *详细：构造一起玩游戏各接口表单HTML文本
// *版本：1.0
// *日期：2016-01-07
// */
public class Pay {
//	
//	/** 
//     * 把数组所有元素排序，并按照“参数=参数值”的模式用“&”字符拼接成字符串
//     * @param params 需要排序并参与字符拼接的参数组
//     * @return 拼接后字符串
//     */
//    public static String createLinkString(Map<String, String> params,String PAY_KEY) {
//
//        List<String> keys = new ArrayList<String>(params.keySet());
////        Collections.sort(keys);
//        String prestr = "";
//
//        for (int i = 0; i < keys.size(); i++) {
//            String key = keys.get(i);
//            String value = params.get(key);
//	        prestr = prestr + key + "=" + value + "&";
//        }
//        prestr = prestr+PAY_KEY;
//        return prestr;
//    }
//	
//	/**
//     * 生成签名结果
//     * @param sPara 要签名的数组
//     * @return 签名结果字符串
//     */
//	public static String buildRequestMysign(Map<String, String> sPara,String PAY_KEY) {
//    	String prestr = createLinkString(sPara,PAY_KEY); //把数组所有元素拼接成字符串
//        String mysign = "";
//        if(AlipayConfig.sign_type.equals("MD5") ) {
//        	mysign = MD5.sign(prestr,AlipayConfig.input_charset);
//        }
//        return mysign;
//    }
//	
//	
//	/**
//     * 生成要请求给一起玩游戏的参数数组
//     * @param sParaTemp 请求前的参数数组
//     * @return 要请求的参数数组
//     */
//    private static Map<String, String> buildRequestPara(Map<String, String> sParaTemp,String PAY_KEY) {
//
//        //生成签名结果
//        String mysign = buildRequestMysign(sParaTemp,PAY_KEY);
//        //签名结果与签名方式加入请求提交参数组中
//        sParaTemp.put("Sign", mysign);
//
//        return sParaTemp;
//    }
//	
//    /**
//     * 建立请求 HTTP（默认） 像素骑士团游戏
//     * @param sParaTemp 请求参数数组
//     * @return 
//     */
//    public static String buildRequest(Map<String, String> sParaTemp,String PATH,String PAY_KEY) {
//        //待请求参数数组
//        Map<String, String> sPara = buildRequestPara(sParaTemp,PAY_KEY);
//        List<String> keys = new ArrayList<String>(sPara.keySet());  
//        String prestr ="";
//        for (int i = 0; i < keys.size(); i++) {
//            String key = keys.get(i);
//            String value = sPara.get(keys.get(i));
//	        prestr = prestr + key + "=" + value + "&";
//        }
//        prestr = prestr.substring(0, prestr.length()-1);
//        
//        HttpClient client = new HttpClient(); 
//		HttpMethod method = new GetMethod(PATH+"?"+prestr); 
//		
//		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");				    
//		try {
//			client.executeMethod(method);	
//			
//			String SubmitResult =method.getResponseBodyAsString();
//			 int a = SubmitResult.indexOf("{");
//			 int b = SubmitResult.lastIndexOf("}");
//			 SubmitResult =  SubmitResult.substring(a, b+1);
//			 JSONObject jsonobject = JSONObject.fromObject(SubmitResult);
//			 String status = jsonobject.getString("status");
//			 String msg = jsonobject.getString("msg");
////System.out.println("充值状态1为成功:"+status);
//			
//			 if("1".equals(status)){
//				 return "充值成功";
//			 }else{
//				 return msg;
//			 }
//
//		} catch (HttpException e) {
//			e.printStackTrace();
//		}catch (IOException e) {
//			e.printStackTrace();
//		}
//        return "null";
//    }
//
//    /**
//     * U77建立请求
//     * @param sParaTemp
//     * @param djmyPath
//     * @param djmyPayKey
//     * @return
//     */
//	public static String U77buildRequest(Map<String, String> sParaTemp,
//			String djmyPath, String djmyPayKey) {
//		String sign = buildu77sign(sParaTemp,djmyPayKey);	
//		String prestr = "";
//		List<String> keys = new ArrayList<String>(sParaTemp.keySet());
//		for(int i=0;i<sParaTemp.size()-1;i++){
//				prestr += keys.get(i)+"="+sParaTemp.get(keys.get(i))+"&";
//		}
//		prestr = prestr+"sign="+sign;
////System.out.println(prestr);
//		HttpClient client = new HttpClient(); 
//		HttpMethod method = new GetMethod(djmyPath+"?"+prestr); 
//		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");
//		try {
//			client.executeMethod(method);	
//			
//			String SubmitResult =method.getResponseBodyAsString();
//			 int a = SubmitResult.indexOf("{");
//			 int b = SubmitResult.lastIndexOf("}");
//			 SubmitResult =  SubmitResult.substring(a, b+1);
//			 JSONObject jsonobject = JSONObject.fromObject(SubmitResult);
//			 String status = jsonobject.getString("status");
////			 String msg = jsonobject.getString("msg");
////System.out.println("充值状态0为成功:"+status);
//			
//			 if("0".equals(status)){
//				 return "充值成功";
//			 }else{
//				 return "验证失败";
//			 }
//		} catch (HttpException e) {
//			e.printStackTrace();
//		}catch (IOException e) {
//			e.printStackTrace();
//		}	
//		return null;
	}
//
//	
//	/**
//	 * U77充值接口  参数签名
//	 * @param sParaTemp	参数
//	 * @param djmyPayKey	秘钥
//	 * @return
//	 */
//	private static String buildu77sign(Map<String, String> sParaTemp,
//			String djmyPayKey) {
////		String plat = sParaTemp.get("plat");
////		String username = sParaTemp.get("username");
////		String orderid = sParaTemp.get("orderid");
////		String money = sParaTemp.get("money");
//		sParaTemp.put("key", djmyPayKey);
//		List<String> keys = new ArrayList<String>(sParaTemp.keySet()); 
//		String sign ="";
//		for(int i=0;i<sParaTemp.size();i++){
//			sign += sParaTemp.get(keys.get(i));
//		}
//		sign = MD5.sign(sign, "utf-8");
//		return sign;
//	}
//}
