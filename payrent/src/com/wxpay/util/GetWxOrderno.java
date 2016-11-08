package com.wxpay.util;


import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.params.ClientPNames;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.xml.sax.InputSource;

import com.payrent.domain.RentOrder;
import com.peter.util.UtilDate;
import com.wxpay.config.wxpayConfig;
import com.wxpay.utils.http.HttpClientConnectionManager;

public class GetWxOrderno
{
  public static DefaultHttpClient httpclient;

  static
  {
    httpclient = new DefaultHttpClient();
    httpclient = (DefaultHttpClient)HttpClientConnectionManager.getSSLInstance(httpclient);
  }


  /**
   *description:获取预支付id
   *@param url
   *@param xmlParam
   *@return
   * @author ex_yangxiaoyi
   * @see
   */
  @SuppressWarnings("unchecked")
public static String getPayNo(String url,String xmlParam){
	  DefaultHttpClient client = new DefaultHttpClient();
	  client.getParams().setParameter(ClientPNames.ALLOW_CIRCULAR_REDIRECTS, true);
	  HttpPost httpost= HttpClientConnectionManager.getPostMethod(url);
	  String prepay_id = "";
     try {
		 httpost.setEntity(new StringEntity(xmlParam, "UTF-8"));
		 HttpResponse response = httpclient.execute(httpost);
	     String jsonStr = EntityUtils.toString(response.getEntity(), "UTF-8");
	    if(jsonStr.indexOf("FAIL")!=-1){
	    	return prepay_id;
	    }
	    Map map = doXMLParse(jsonStr);
	    prepay_id  = (String) map.get("prepay_id");
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return prepay_id;
  }
  
  /**
   *description:获取扫码支付连接
   *@param url
   *@param xmlParam
   *@return
   * @author ex_yangxiaoyi
   * @see
   */
  @SuppressWarnings("unchecked")
public static String getCodeUrl(String url,String xmlParam){
	  DefaultHttpClient client = new DefaultHttpClient();
	  client.getParams().setParameter(ClientPNames.ALLOW_CIRCULAR_REDIRECTS, true);
	  HttpPost httpost= HttpClientConnectionManager.getPostMethod(url);
	  String code_url = "";
     try {
		 httpost.setEntity(new StringEntity(xmlParam, "UTF-8"));
		 HttpResponse response = httpclient.execute(httpost);
	     String jsonStr = EntityUtils.toString(response.getEntity(), "UTF-8");
	    if(jsonStr.indexOf("FAIL")!=-1){
	    	return code_url;
	    }
	    Map map = doXMLParse(jsonStr);
	    code_url  = (String) map.get("code_url");
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return code_url;
  }
  
  /**
   * 获取统一下单返回参数
   * @param url
   * @param xmlParam
   * @return map
   */
  public static Map getReturnMap(String url,String xmlParam){
	  DefaultHttpClient client = new DefaultHttpClient();
	  client.getParams().setParameter(ClientPNames.ALLOW_CIRCULAR_REDIRECTS, true);
	  HttpPost httpost= HttpClientConnectionManager.getPostMethod(url);
	  Map map=new HashMap();
     try {
		 httpost.setEntity(new StringEntity(xmlParam, "UTF-8"));
		 HttpResponse response = httpclient.execute(httpost);    	 
	     String jsonStr = EntityUtils.toString(response.getEntity(), "UTF-8");
	     if(jsonStr.indexOf("FAIL")!=-1){
	    	return map;
	    }
	    map = doXMLParse(jsonStr);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return map;
  }
  
  
  /**
	 * 解析xml,返回第一级元素键值对。如果第一级元素有子节点，则此节点的值是子节点的xml数据。
	 * @param strxml
	 * @return
	 * @throws JDOMException
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	private static Map doXMLParse(String xml) {
		Map retMap = new HashMap();
		try {
			StringReader read = new StringReader(xml);
			// 创建新的输入源SAX 解析器将使用 InputSource 对象来确定如何读取 XML 输入
			InputSource source = new InputSource(read);
			// 创建一个新的SAXBuilder
			SAXBuilder sb = new SAXBuilder();
			// 通过输入源构造一个Document
			Document doc = (Document) sb.build(source);
			Element root = doc.getRootElement();// 指向根节点
			List<Element> es = root.getChildren();
			if (es != null && es.size() != 0){
				for (Element element : es) {
					retMap.put(element.getName(), element.getValue());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return retMap;
	}
	
/*	
	public static Map doXMLParse(String strxml) throws Exception {
		if(null == strxml || "".equals(strxml)) {
			return null;
		}
		
		Map m = new HashMap();
		InputStream in = String2Inputstream(strxml);
		SAXBuilder builder = new SAXBuilder();
		Document doc = builder.build(in);
		Element root = doc.getRootElement();
		List list = root.getChildren();
		Iterator it = list.iterator();
		while(it.hasNext()) {
			Element e = (Element) it.next();
			String k = e.getName();
			String v = "";
			List children = e.getChildren();
			if(children.isEmpty()) {
				v = e.getTextNormalize();
			} else {
				v = getChildrenText(children);
			}
			
			m.put(k, v);
		}
		
		//关闭流
		in.close();
		
		return m;
	}*/
	/**
	 * 获取子结点的xml
	 * @param children
	 * @return String
	 */
	@SuppressWarnings("unchecked")
	public static String getChildrenText(List children) {
		StringBuffer sb = new StringBuffer();
		if(!children.isEmpty()) {
			Iterator it = children.iterator();
			while(it.hasNext()) {
				Element e = (Element) it.next();
				String name = e.getName();
				String value = e.getTextNormalize();
				List list = e.getChildren();
				sb.append("<" + name + ">");
				if(!list.isEmpty()) {
					sb.append(getChildrenText(list));
				}
				sb.append(value);
				sb.append("</" + name + ">");
			}
		}
		
		return sb.toString();
	}
  public static InputStream String2Inputstream(String str) {
		return new ByteArrayInputStream(str.getBytes());
	}
  
  
  public static Map getResult(RentOrder order,String openid){
		// 附加数据 原样返回
		String attach = "";
		// 总金额以分为单位，不带小数点
		String totalFee = getMoney(order.getMoney());
		
		// 订单生成的机器 IP
		String spbill_create_ip = "127.0.0.1";
		// 这里notify_url是 支付完成后微信发给该链接信息，可以判断会员是否支付成功，改变订单状态等。
		String notify_url = wxpayConfig.notifyurl;
		String trade_type = "JSAPI";

		// 商户号
		String mch_id = wxpayConfig.partner;
		// 随机字符串
		String nonce_str = getNonceStr();

		// 商品描述根据情况修改
		String body = "付房租";

		// 商户订单号
		String out_trade_no = order.getOrderid();
		
		String appid = wxpayConfig.appid;
		String appsecret = wxpayConfig.appsecret;
		String partnerkey = wxpayConfig.partnerkey;

		SortedMap<String, String> packageParams = new TreeMap<String, String>();
		packageParams.put("appid", appid);
		packageParams.put("mch_id", mch_id);
		packageParams.put("nonce_str", nonce_str);
		packageParams.put("body", body);
		packageParams.put("attach", attach);
		packageParams.put("out_trade_no", out_trade_no);

		packageParams.put("total_fee", totalFee);
		packageParams.put("spbill_create_ip", spbill_create_ip);
		packageParams.put("notify_url", notify_url);

		packageParams.put("trade_type", trade_type);
		packageParams.put("openid", openid);

		RequestHandler reqHandler = new RequestHandler(null, null);
		reqHandler.init(appid, appsecret, partnerkey);

		String sign = reqHandler.createSign(packageParams);
		String xml = "<xml>" + "<appid>" + appid + "</appid>" + "<mch_id>"
				+ mch_id + "</mch_id>" + "<nonce_str>" + nonce_str
				+ "</nonce_str>" + "<sign>" + sign + "</sign>"
				+ "<body><![CDATA[" + body + "]]></body>" 
				+ "<out_trade_no>" + out_trade_no
				+ "</out_trade_no>" + "<attach>" + attach + "</attach>"
				+ "<total_fee>" + totalFee + "</total_fee>"
				+ "<spbill_create_ip>" + spbill_create_ip
				+ "</spbill_create_ip>" + "<notify_url>" + notify_url
				+ "</notify_url>" + "<trade_type>" + trade_type
				+ "</trade_type>" +"<openid>" + openid
				+ "</openid>"+ "</xml>";
		Map map = new HashMap();
		String createOrderURL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
		
		map =getReturnMap(createOrderURL, xml);
		
		return map;
	}
	
	/**
	 * 元转换成分
	 * @param money
	 * @return
	 */
	public static String getMoney(String amount) {
		if(amount==null){
			return "";
		}
		// 金额转化为分为单位
		String currency =  amount.replaceAll("\\$|\\￥|\\,", "");  //处理包含, ￥ 或者$的金额  
      int index = currency.indexOf(".");  
      int length = currency.length();  
      Long amLong = 0l;  
      if(index == -1){  
          amLong = Long.valueOf(currency+"00");  
      }else if(length - index >= 3){  
          amLong = Long.valueOf((currency.substring(0, index+3)).replace(".", ""));  
      }else if(length - index == 2){  
          amLong = Long.valueOf((currency.substring(0, index+2)).replace(".", "")+0);  
      }else{  
          amLong = Long.valueOf((currency.substring(0, index+1)).replace(".", "")+"00");  
      }  
      return amLong.toString(); 
	}
	/**
	 * 获取随机字符串
	 * @return
	 */
	public static String getNonceStr() {
		// 随机数
		String currTime = TenpayUtil.getCurrTime();
		// 8位日期
		String strTime = currTime.substring(8, currTime.length());
		// 四位随机数
		String strRandom = TenpayUtil.buildRandom(4) + "";
		// 10位序列号,可以自行调整。
		return strTime + strRandom;
	}
  
}