package com.daqian.paybankController;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.xml.sax.InputSource;

import com.alipay.config.AlipayConfig;
import com.alipay.util.AlipayNotify;
import com.alipay.util.AlipaySubmit;
import com.alipay.util.UtilDate;
import com.daqian.dao.TradeDao;
import com.daqian.dao.UserAssetsDao;
import com.daqian.dao.UserDao;
import com.daqian.entity.Trade;
import com.daqian.entity.User;
import com.daqian.entity.UserAssets;
import com.wxpay.config.WxPayDto;
import com.wxpay.config.WxPayResult;
import com.wxpay.config.wxpayConfig;
import com.wxpay.util.GetWxOrderno;
import com.wxpay.util.RequestHandler;
import com.wxpay.util.TenpayUtil;

@Controller("alipay")
public class alipayController {
	@Resource
	private TradeDao tradedao;
	
	@Resource
	private UserDao userdao;
	
	@Resource
	private UserAssetsDao userassetsdao;
	
	/**
	 * 微信支付回调
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/notify.do")
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

		System.out.println("接收到的报文：" + notityXml);
		
		Map m = parseXmlToList2(notityXml);
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
			Trade trade1 = tradedao.findbytrade_no(wpr.getOutTradeNo());
			String state = trade1.getState();
			if(state.equals("待付款")){
				//获得用户名
				String username = trade1.getUsername();
				//修改状态
				String state1 = "完成";

				//获得时间
				Date date1 =new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String date = sdf.format(date1);
				
				//更新状态
				tradedao.updateState(state1, date, wpr.getOutTradeNo());

				
				//获得用户本来资金
				UserAssets u = userassetsdao.findByName(username);
				double rmoney = u.getResidualmoney();
				double amoney = u.getAvailablemoney();
				
				//分转成元
				double money = Double.parseDouble(wpr.getTotalFee())/100;
	//			int money = Integer.parseInt(wpr.getTotalFee());
				double residualmoney = rmoney+money;
				double availablemoney = amoney+money;
				userassetsdao.recharge(username, residualmoney, availablemoney);		//更新用户资产
			
			}
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
	@SuppressWarnings({"unused", "rawtypes", "unchecked"})
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
			if (es != null && es.size() != 0) {
				for (Element element : es) {
					retMap.put(element.getName(), element.getValue());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return retMap;
	}
	
	
	/**
	 * 支付宝返回页面（异步）
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/notify_url.do")
	public void notify_url(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//获取支付宝POST过来反馈信息
		Map<String,String> params = new HashMap<String,String>();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			//valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
			params.put(name, valueStr);
		}
		
		//商户订单号

		String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

		//支付宝交易号
//		String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

		//交易状态
		String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
		
		//交易金额
		String total_fee = new String(request.getParameter("total_fee").getBytes("ISO-8859-1"),"UTF-8");

		if(AlipayNotify.verify(params)){//验证成功
			if(trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS")){
				Trade trade1 = tradedao.findbytrade_no(out_trade_no);
				String state = trade1.getState();
				if(state.equals("待付款")){
					//获得用户名
					String username = trade1.getUsername();
					//修改状态
					String state1 = "完成";

					//获得时间
					Date date1 =new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String date = sdf.format(date1);
					
					//更新状态
					tradedao.updateState(state1, date, out_trade_no);

					
					//获得用户本来资金
					UserAssets u = userassetsdao.findByName(username);
					double rmoney = u.getResidualmoney();
					double amoney = u.getAvailablemoney();
					
					double money = Double.parseDouble(total_fee);
					double residualmoney = rmoney+money;
					double availablemoney = amoney+money;
					userassetsdao.recharge(username, residualmoney, availablemoney);		//更新用户资产
					
				}
			}
			out.println("success");	//请不要修改或删除
		}else{//验证失败
			out.println("fail");
		}
	}
	
	
	
	/**
	 * 支付宝返回页面(同步)
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/return_url.do")
	public String returnurl(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//获取支付宝GET过来反馈信息
		Map<String,String> params = new HashMap<String,String>();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
		//	valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		
		//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
		//商户订单号

		String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

		//支付宝交易号
//		String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

		//交易状态
		String trade_status =  new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");  //;

		//交易金额
		String total_fee = new String(request.getParameter("total_fee").getBytes("ISO-8859-1"),"UTF-8");
		
		
		//计算得出通知验证结果
	//	boolean verify_result = AlipayNotify.verify(params);
		
		if(AlipayNotify.verify(params)){//验证成功
			if(trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS")){
				Trade trade1 = tradedao.findbytrade_no(out_trade_no);
				String state = trade1.getState();
				if(state.equals("待付款")){
					//获得用户名
					String username = trade1.getUsername();
					//修改状态
					String state1 = "完成";

					//获得时间
					Date date1 =new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String date = sdf.format(date1);
					
					//更新状态
					tradedao.updateState(state1, date, out_trade_no);

					
					//获得用户本来资金
					UserAssets u = userassetsdao.findByName(username);
					double rmoney = u.getResidualmoney();
					double amoney = u.getAvailablemoney();
					
					double money = Double.parseDouble(total_fee);
					double residualmoney = rmoney+money;
					double availablemoney = amoney+money;
					userassetsdao.recharge(username, residualmoney, availablemoney);		//更新用户资产
					
				}
			}
			return "user/login";
		}else{
			//该页面可做页面美工编辑
			System.out.println("returnurl_no");
			out.println("连接失败");
		}
		return null;
	}
	
	
	
	/**
	 * 跳转到网银支付宝微信
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/alipay.do")
	public String pay(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//支付类型
		String payment_type = "1";
		//必填，不能修改
		//服务器异步通知页面路径
		String notify_url = "http://www.daqianvip.com/notify_url.do";
		//需http://格式的完整路径，不能加?id=123这类自定义参数

		//页面跳转同步通知页面路径
		String return_url = "http://www.daqianvip.com/return_url.do";
		//需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/
		
		Date date =new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String no = sdf.format(date)+UtilDate.getThree();
//		System.out.println(no);
		//商户订单号
		String out_trade_no =no; //new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"),"UTF-8");
		//商户网站订单系统中唯一订单号，必填
		
		
		//订单名称
		String subject = "充值";
		//必填

		//付款金额
		String total_fee = new String(request.getParameter("totalmoney").getBytes("ISO-8859-1"),"UTF-8");
		//必填

		//订单描述

//		String body = new String(request.getParameter("WIDbody").getBytes("ISO-8859-1"),"UTF-8");
		
		//默认支付方式
		String paymethod = "bankPay";
		//必填
		//默认网银
		String defaultbank = new String(request.getParameter("a").getBytes("ISO-8859-1"),"UTF-8");
		//必填，银行简码请参考接口技术文档
//		System.out.println(defaultbank+"1");

		//商品展示地址
//		String show_url = new String(request.getParameter("WIDshow_url").getBytes("ISO-8859-1"),"UTF-8");
		//需以http://开头的完整路径，例如：http://www.商户网址.com/myorder.html

		//防钓鱼时间戳
//		String anti_phishing_key = "";
		//若要使用请调用类文件submit中的query_timestamp函数

		//客户端的IP地址
//		String exter_invoke_ip = "";
		//非局域网的外网IP地址，如：221.0.0.1
		
		//获得用户名,真实姓名，手机号
		HttpSession namesession = request.getSession();
		String username = (String) namesession.getAttribute("username");
		System.out.println(username);
		User user  = userdao.findByName(username);
		String realname = user.getRealname();
		String telephone = user.getTelephone();
		//获得时间
		Date date1 =new Date();
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date2 = sdf1.format(date1);
		
		String state ="待付款";
		Trade trade = new Trade();
		trade.setUsername(username);
		trade.setTrade_no(out_trade_no);
		trade.setMoney(total_fee);
		trade.setDate(date2);
		trade.setRealname(realname);
		trade.setTelephone(telephone);
		trade.setType(subject);
		trade.setState(state);
		tradedao.insert(trade);
		
		//判断用户的充值方式
		if(defaultbank.equals("alipay")){
			Map<String, String> sParaTemp = new HashMap<String, String>();
			sParaTemp.put("service", "create_direct_pay_by_user");
	        sParaTemp.put("partner", AlipayConfig.partner);
	        sParaTemp.put("seller_email", AlipayConfig.seller_email);
	        sParaTemp.put("_input_charset", AlipayConfig.input_charset);
			sParaTemp.put("payment_type", payment_type);
			sParaTemp.put("notify_url", notify_url);
			sParaTemp.put("return_url", return_url);
			sParaTemp.put("out_trade_no", out_trade_no);
			sParaTemp.put("subject", subject);
			sParaTemp.put("total_fee", total_fee);
			String sHtmlText = AlipaySubmit.buildRequest(sParaTemp,"get","确认");
			out.println(sHtmlText);
		}else if(defaultbank.equals("weixin")){
			 //扫码支付
		    WxPayDto tpWxPay1 = new WxPayDto();
		    tpWxPay1.setBody("大钱财富充值");
		    tpWxPay1.setOrderId(out_trade_no);
		    tpWxPay1.setSpbillCreateIp("127.0.0.1");
		    tpWxPay1.setTotalFee(total_fee);
			String codeurl = getCodeurl(tpWxPay1);
			System.out.println("code_url----------------"+codeurl);
			request.setAttribute("trade_no",out_trade_no);
			request.setAttribute("body",tpWxPay1.getBody());
			request.setAttribute("totalfee",total_fee);
			request.setAttribute("codeurl", codeurl);
			return "user/hyzx/wxsaoma";
		}else{			
			//把请求参数打包成数组
			Map<String, String> sParaTemp = new HashMap<String, String>();
			sParaTemp.put("service", "create_direct_pay_by_user");
	        sParaTemp.put("partner", AlipayConfig.partner);
	        sParaTemp.put("seller_email", AlipayConfig.seller_email);
	        sParaTemp.put("_input_charset", AlipayConfig.input_charset);
			sParaTemp.put("payment_type", payment_type);
			sParaTemp.put("notify_url", notify_url);
			sParaTemp.put("return_url", return_url);
			sParaTemp.put("out_trade_no", out_trade_no);
			sParaTemp.put("subject", subject);
			sParaTemp.put("total_fee", total_fee);
	//		sParaTemp.put("body", body);
			sParaTemp.put("paymethod", paymethod);
			sParaTemp.put("defaultbank",defaultbank);
	//		sParaTemp.put("show_url",show_url);
	//		sParaTemp.put("anti_phishing_key",anti_phishing_key);
	//		sParaTemp.put("exter_invoke_ip",exter_invoke_ip);
			
			//建立请求
			String sHtmlText = AlipaySubmit.buildRequest(sParaTemp,"get","确认");
			out.println(sHtmlText);
		}
		return null;
	}
	
	
	
	/**
	 * ajax验证验证码
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/alipaycode.do")
	public void alipay(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String code = request.getParameter("code");
		HttpSession session = request.getSession();
		String number = (String) session.getAttribute("alipaynumber");
		if(number.equalsIgnoreCase(code)){
			out.print("ok");
		}else{
			out.print("验证码错误");
		}
	}
	
	
	/**
	 * 验证码
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/checkalipaycode.do")
	public void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//1创建一个内存印象（画布）
		BufferedImage image = new BufferedImage(100,34,BufferedImage.TYPE_INT_RGB);
		//2获得画笔
		Graphics g = image.getGraphics();
		//3给画笔设置颜色
		g.setColor(new Color(255,255,255));
		//4给画布设置背景颜色
		g.fillRect(0,0,100,34);
		//5重新设置画笔颜色
		Random r = new Random();
		g.setColor(new Color(r.nextInt(111),r.nextInt(255),r.nextInt(255)));
		//6生成一个随机数（验证码）
		//	String number = r.nextInt(89999)+10000+"";
		String number = code();
		HttpSession session = request.getSession();
		session.setAttribute("alipaynumber",number);
		session.setMaxInactiveInterval(3600);
		//7绘制number
		g.setFont(new Font(null,Font.ITALIC,25));
		g.drawString(number, 10, 30);
		//加一些干扰线
		for(int i=0;i<8;i++){
			g.setColor(new Color(r.nextInt(255)));
		g.drawLine(r.nextInt(120),r.nextInt(30),r.nextInt(120),r.nextInt(30));
		}
		
		//二，压缩图片，发送给浏览器jpg
		//1,设置服务器返回的数据类型（图片）
		response.setContentType("image/jpeg");
		//2,获得自己输出流
		OutputStream ops = response.getOutputStream();
		//3，压缩图片，输出
		javax.imageio.ImageIO.write(image, "jpeg",ops);
		ops.close();
		}
		
		public static String code(){
			String number="";
			char[] chars = {'A','B','C','D','E','F','G','H','I','J',
					'K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
					'1','2','3','4','5','6','7','8','9','0'};
			Random r= new Random();
			for(int i=0;i<5;i++){
				number+=chars[r.nextInt(chars.length)];
			}
			return number;
		}
	
		/**
		 * 获取微信扫码支付二维码连接
		 */
		public static String getCodeurl(WxPayDto tpWxPayDto){
			
			// 1 参数
			// 订单号
			String orderId = tpWxPayDto.getOrderId();
			// 附加数据 原样返回
			String attach = "";
			// 总金额以分为单位，不带小数点
			String totalFee = getMoney(tpWxPayDto.getTotalFee());
			
			// 订单生成的机器 IP
			String spbill_create_ip = tpWxPayDto.getSpbillCreateIp();
			// 这里notify_url是 支付完成后微信发给该链接信息，可以判断会员是否支付成功，改变订单状态等。
			String notify_url = wxpayConfig.notifyurl;
			String trade_type = "NATIVE";

			// 商户号
			String mch_id = wxpayConfig.partner;
			// 随机字符串
			String nonce_str = getNonceStr();

			// 商品描述根据情况修改
			String body = tpWxPayDto.getBody();

			// 商户订单号
			String out_trade_no = orderId;
			
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

			// 这里写的金额为1 分到时修改
			packageParams.put("total_fee", totalFee);
			packageParams.put("spbill_create_ip", spbill_create_ip);
			packageParams.put("notify_url", notify_url);

			packageParams.put("trade_type", trade_type);

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
					+ "</trade_type>" + "</xml>";
			String code_url = "";
			String createOrderURL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
			
			code_url = new GetWxOrderno().getCodeUrl(createOrderURL, xml);
			
			return code_url;
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
