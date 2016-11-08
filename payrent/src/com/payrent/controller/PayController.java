package com.payrent.controller;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.xml.sax.InputSource;

import com.payrent.dao.IRentOrderDao;
import com.payrent.domain.RentOrder;
import com.payrent.domain.Renter;
import com.peter.util.Http;
import com.peter.util.IdWorkerStandard;
import com.peter.util.Log;
import com.peter.util.MD5;

import com.peter.util.UtilDate;
import com.wxpay.config.WxPayResult;
import com.wxpay.config.wxpayConfig;
import com.wxpay.util.GetWxOrderno;
import com.wxpay.util.Sha1Util;

@Controller("paycontroller")
public class PayController {
	@Resource
	private IRentOrderDao orderdao;
	
	/**
	 * 微信支付入口
	 */
	@RequestMapping("/wxpay.do")
	public void wxpay(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		Renter renter = (Renter) request.getSession().getAttribute("renter");
		if(renter!=null){
			String telephone =request.getParameter("renter_telephone");
			String money = request.getParameter("money");
			String houseid = request.getParameter("house_id");
			String name = URLDecoder.decode(request.getParameter("renter_name"),"utf-8");
			
			IdWorkerStandard idWorker = new IdWorkerStandard(0);
			RentOrder order = new RentOrder(idWorker.nextId()+"",houseid,telephone,name,money,UtilDate.getDateFormatter(),"待付款");
			orderdao.add(order);
			Map m = new HashMap();
			m = GetWxOrderno.getResult(order,renter.getVxin());
			String prepay_id  = (String) m.get("prepay_id");			//标识 
			String nonceStr  = (String) m.get("nonce_str");				//随机数
			String timestamp = UtilDate.getTimeStamp();

			String ticket = (String) request.getSession().getAttribute("ticket");
			if(ticket==null){
				try {
					//获取wx.config所需的signature
					HashMap<String, String> sParam = new LinkedHashMap<String, String>();
					sParam.put("appid", wxpayConfig.appid);
					sParam.put("secret", wxpayConfig.appsecret);
					sParam.put("grant_type", "client_credential");
					Http hp = Http.getInstance();
					String tresult = hp.hp("https://api.weixin.qq.com/cgi-bin/token", sParam, "get");
					sParam.clear();
					JSONObject tjo = JSONObject.fromObject(tresult);
					String access_token = tjo.getString("access_token");
					//获取jsapi_ticket
					sParam.put("access_token",access_token);
					sParam.put("type","jsapi");
					String jresult = hp.hp("https://api.weixin.qq.com/cgi-bin/ticket/getticket", sParam, "get");
					sParam.clear();
					JSONObject jjo = JSONObject.fromObject(jresult);
					ticket = jjo.getString("ticket");
					HttpSession ticketsession = request.getSession();
					ticketsession.setAttribute("ticket", ticket);
					ticketsession.setMaxInactiveInterval(3600);
				} catch (Exception e) {
					out.print("error");
				}	
			}		
			String str = "jsapi_ticket="+ticket+"&noncestr="+nonceStr+"&timestamp="+timestamp+"&url=http://payrent.199y.com/wxpay.do?money="+money+"&house_id="+houseid+"&renter_name="+URLEncoder.encode(name,"utf-8")+"&renter_telephone="+telephone;
			String signature = Sha1Util.getSha1(str);
			
			String md5sign = "appId="+wxpayConfig.appid+"&nonceStr="+nonceStr+"&package=prepay_id="+prepay_id+"&signType=MD5&timeStamp="+timestamp+"&key="+wxpayConfig.partnerkey;
			String paySign = MD5.sign(md5sign, "utf-8");
			JSONObject jo = new JSONObject();
			jo.put("nonceStr", nonceStr);
			jo.put("timestamp", timestamp);
			jo.put("prepay_id", prepay_id);
			jo.put("signature", signature);
			jo.put("paySign", paySign);
			out.print(jo.toString());
		}else{
			out.print("error");
		}
	}
	
	
	
	/**
	 * 微信异步支付回调
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/wx_notify.do")
	public void notify(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		//把如下代码贴到的你的处理回调的servlet 或者.do 中即可明白回调操作
		System.out.print("微信支付回调数据开始");
		//示例报文
//		String xml = "<xml><appid><![CDATA[wxb4dc385f953b356e]]></appid><bank_type><![CDATA[CCB_CREDIT]]></bank_type><cash_fee><![CDATA[1]]></cash_fee><fee_type><![CDATA[CNY]]></fee_type><is_subscribe><![CDATA[Y]]></is_subscribe><mch_id><![CDATA[1228442802]]></mch_id><nonce_str><![CDATA[1002477130]]></nonce_str><openid><![CDATA[o-HREuJzRr3moMvv990VdfnQ8x4k]]></openid><out_trade_no><![CDATA[1000000000051249]]></out_trade_no><result_code><![CDATA[SUCCESS]]></result_code><return_code><![CDATA[SUCCESS]]></return_code><sign><![CDATA[1269E03E43F2B8C388A414EDAE185CEE]]></sign><time_end><![CDATA[20150324100405]]></time_end><total_fee>1</total_fee><trade_type><![CDATA[JSAPI]]></trade_type><transaction_id><![CDATA[1009530574201503240036299496]]></transaction_id></xml>";
		String inputLine;
		String notityXml = "";
		String resXml = "";

		try {
			while ((inputLine = request.getReader().readLine()) != null) {
				notityXml += inputLine;
			}
			request.getReader().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map m = parseXmlToList2(notityXml);
Log.logResult(UtilDate.getDateFormatter()+";壹管家付房租微信异步回调："+m+"\r\n", "d:\\igjiaLogs\\payrentLogs");		
	
		WxPayResult wpr = new WxPayResult();
		wpr.setAppid(m.get("appid").toString());
		wpr.setBankType(m.get("bank_type").toString());
		wpr.setCashFee(m.get("cash_fee").toString());
		wpr.setFeeType(m.get("fee_type").toString());
		wpr.setIsSubscribe(m.get("is_subscribe").toString());
		wpr.setMchId(m.get("mch_id").toString());
		wpr.setNonceStr(m.get("nonce_str").toString());
		wpr.setOpenid(m.get("openid").toString());
		wpr.setOutTradeNo(m.get("out_trade_no").toString());
		wpr.setResultCode(m.get("result_code").toString());
		wpr.setReturnCode(m.get("return_code").toString());
		wpr.setSign(m.get("sign").toString());
		wpr.setTimeEnd(m.get("time_end").toString());
		wpr.setTotalFee(m.get("total_fee").toString());
		wpr.setTradeType(m.get("trade_type").toString());
		wpr.setTransactionId(m.get("transaction_id").toString());
	
		if("SUCCESS".equals(wpr.getResultCode())){
			//支付成功
			orderdao.updateByOrderid(wpr.getOutTradeNo(), "完成");
		}else{
			resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"
			+ "<return_msg><![CDATA[报文为空]]></return_msg>" + "</xml> ";
		}

		System.out.println("微信支付回调数据结束");

		BufferedOutputStream out = new BufferedOutputStream(
				response.getOutputStream());
		out.write(resXml.getBytes());
		out.flush();
		out.close();
		
	}
	/**
	 * description: 解析微信通知xml
	 * 
	 * @param xml
	 * @return
	 * @author ex_yangxiaoyi
	 * @see
	 */
	@SuppressWarnings({"unchecked"})
	private static Map parseXmlToList2(String xml) {
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
}
