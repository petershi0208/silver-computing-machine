package com.yqwan.pagecontroller;


import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.annotation.Resource;
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
import com.wxpay.config.WxPayDto;
import com.wxpay.config.WxPayResult;
import com.wxpay.config.wxpayConfig;
import com.wxpay.util.GetWxOrderno;
import com.wxpay.util.RequestHandler;
import com.wxpay.util.TenpayUtil;
import com.yqwan.dao.IGameDistrictDao;
import com.yqwan.dao.IPromoterDao;
import com.yqwan.dao.IPromoterrecordDao;
import com.yqwan.dao.ITradeDao;
import com.yqwan.dao.IUserDao;
import com.yqwan.domain.Gamedistrict;
import com.yqwan.domain.Promoter;
import com.yqwan.domain.Promoterrecord;
import com.yqwan.domain.Trade;
import com.yqwan.domain.User;
import com.yqwan.gamefactory.GamenameFactory;
import com.yqwan.gamefactory.Operation;
import com.yqwan.service.Log;
import com.yqwan.service.UserService;

/**
 * 
 * @author PeterShi
 *
 */

@Controller("paycontroller")
public class PayController {	
	@Resource
	private ITradeDao tradedao;
	@Resource
	private IUserDao userdao;
	@Resource 
	private IPromoterDao promoterdao;
	@Resource
	private IPromoterrecordDao promoterrecorddao;
	@Resource
	private IGameDistrictDao gamedistrictdao;
	
	/**
	 * gb充值游戏
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/gbpay.do")
	public String gbpay(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//充值的用户id
		String userid = new String(request.getParameter("username").getBytes("ISO-8859-1"),"UTF-8");
		//充值的游戏名字
		String gamename = new String(request.getParameter("gamename").getBytes("ISO-8859-1"),"UTF-8");
		//充值的游戏分区
		String gameregion = new String(request.getParameter("gameregion").getBytes("ISO-8859-1"),"UTF-8");
		//充值的金额
		String money = new String(request.getParameter("money").getBytes("ISO-8859-1"),"UTF-8");
		//生成订单号
		String trade_no = UtilDate.getOrderNum()+UtilDate.getThree();
		
		//获取当前时间
		String date = UtilDate.getDateFormatter();
		
		//获取时间戳
		String timestamp = UtilDate.getTimeStamp();
		
		User user121 = (User) request.getSession().getAttribute("user");
		if(user121!=null){
			if(!userid.equals(user121.getUserid())){
				out.print("无效请求");
				return null;
			}
			if(Integer.parseInt(user121.getGb())<Integer.parseInt(money)){			//判断GB够不
				out.print("无效请求");
				return null;
			}	
			Gamedistrict gamedistrict = new Gamedistrict();			//获得分区serverid
			gamedistrict.setGamename(gamename);
			gamedistrict.setGameregion(gameregion);
			int serverid = gamedistrictdao.getserveridByregion(gamedistrict);
			
			//插入充值记录	
			Trade trade = new Trade(userid,trade_no,money,gamename,gameregion,date,"待付款","no","G币充值");
			trade.setOpenuserid(user121.getOpenuserid());
			tradedao.insert(trade);
			
			Operation oper = GamenameFactory.createOperation(gamename, user121.getOpenuserid(), serverid);
			String sHtmlText = oper.payresult(timestamp, trade_no, money,trade.getExt());
			
			if(sHtmlText.equals("充值成功")){
				//更新用户Gb
				User user = userdao.findByUsername(userid);
				String gb = user.getGb();
				String minusgb = UserService.minusGb(gb, money);
				User uu = new User();
				uu.setUserid(userid);
				uu.setGb(minusgb);
				userdao.updateGb(uu);
				//更新充值状态
				Trade trade1 = new Trade();
				trade1.setTrade_no(trade_no);
				trade1.setDate(UtilDate.getDateFormatter());
				trade1.setState("完成");
				tradedao.updateState(trade1);
				//更新有无到账
				Trade trade2 = new Trade();
				trade2.setTrade_no(trade_no);
				trade2.setAccount("yes");
				tradedao.updateAccount(trade2);
				return "newMemberCenter/paysuccess";
			}		
			return "redirect:recharge.do";
		}else{
			out.print("无效请求");
			return null;
		}
	}
	
	/**
	 * 微信支付回调
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
Log.logResult("平台微信支付回调："+m+"\r\n", "d:\\Logs\\PayLogs");		

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
			if(trade1!=null){
				String state = trade1.getState();
				if("待付款".equals(state)){
					//获得用户名
					String userid = trade1.getUserid();
					//获得充值的游戏
					String gamename = trade1.getGamename();
					//获得充值游戏分区
					String gameregion =trade1.getGameregion();
					
					//修改状态
					String state1 = "完成";
					//分转成元
					int money = Integer.parseInt(wpr.getTotalFee())/100;
					updatepromotermoney(userid,money+"");	//其推广者获得收益					
					//获得时间
					Date date1 =new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String date = sdf.format(date1);
					
					//更新状态
					Trade tradestate = new Trade();
					tradestate.setState(state1);
					tradestate.setDate(date);
					tradestate.setTrade_no(wpr.getOutTradeNo());
					tradedao.updateState(tradestate);					
					User u = userdao.findByUsername(userid);
					String gb = u.getGb(); //获得玩家初始的Gb数量
					User uu = new User();
					uu.setUserid(userid);
					if(gamename.equals("平台挂机点")){
						money = UserService.tenpercent(money);		//加上百分之10
						String plusGb = UserService.plusGb(gb, money+"");					
						uu.setGb(plusGb);
						userdao.updateGb(uu);			//更新用户Gb
						
						//更新有无到账
						Trade tradeaccount = new Trade();
						tradeaccount.setAccount("yes");
						tradeaccount.setTrade_no(wpr.getOutTradeNo());
						tradedao.updateAccount(tradeaccount);
					}else{
						int nmoney = UserService.tenpercent(money);		//加上百分之10
						nmoney = nmoney-money;
						if(nmoney!=0){
							String plusGb = UserService.plusGb(gb, nmoney+"");					
							uu.setGb(plusGb);
							userdao.updateGb(uu);			//更新用户Gb
						}
						Gamedistrict gamedistrict = new Gamedistrict();			//获得分区serverid
						gamedistrict.setGamename(gamename);
						gamedistrict.setGameregion(gameregion);
						int serverid = gamedistrictdao.getserveridByregion(gamedistrict);
						
						Operation oper = GamenameFactory.createOperation(gamename, u.getOpenuserid(), serverid);
						String sHtmlText = oper.payresult(UtilDate.getTimeStamp(), wpr.getOutTradeNo(), money+"",trade1.getExt());

						if(sHtmlText.equals("充值成功")){
							//更新有无到账
							Trade trade2 = new Trade();
							trade2.setTrade_no(wpr.getOutTradeNo());
							trade2.setAccount("yes");
							tradedao.updateAccount(trade2);
						}						
					}	
				}
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
	
	
	/**
	 * 支付宝返回页面（异步）
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
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
Log.logResult(UtilDate.getTimeStamp()+"平台支付宝异步回调："+requestParams+"\r\n", "d:\\Logs\\PayLogs");		
		//商户订单号
		String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

		//支付宝交易号
//		String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

		//交易状态
		String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
		
		//交易金额
		String total_fee = new String(request.getParameter("total_fee").getBytes("ISO-8859-1"),"UTF-8");
		total_fee = total_fee.substring(0, total_fee.indexOf("."));		//取整
		int money = Integer.parseInt(total_fee);
		
		if(AlipayNotify.verify(params)){//验证成功
			if(trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS")){
out.println("success");	//请不要修改或删除
				Trade trade1 = tradedao.findbytrade_no(out_trade_no);
				String state = trade1.getState();
				if(state.equals("待付款")){
					//获得用户名
					String userid = trade1.getUserid();
					//获得充值的游戏
					String gamename = trade1.getGamename();
					//获得充值游戏分区
					String gameregion =trade1.getGameregion();
					
					//修改状态
					String state1 = "完成";
					
					updatepromotermoney(userid,total_fee);	//其推广者获得收益
					
					//获得时间
					Date date1 =new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String date = sdf.format(date1);
					
					//更新状态
					Trade tradestate = new Trade();
					tradestate.setState(state1);
					tradestate.setDate(date);
					tradestate.setTrade_no(out_trade_no);
					tradedao.updateState(tradestate);
					
					User u = userdao.findByUsername(userid);
					String gb = u.getGb(); //获得玩家初始的Gb数量
					
					User uu = new User();
					uu.setUserid(userid);
					if(gamename.equals("平台挂机点")){
						money = UserService.tenpercent(money);		//加上百分之10
						String plusGb = UserService.plusGb(gb, money+"");						
						uu.setGb(plusGb);
						userdao.updateGb(uu);			//更新用户Gb	
						//更新有无到账
						Trade tradeaccount = new Trade();
						tradeaccount.setAccount("yes");
						tradeaccount.setTrade_no(out_trade_no);
						tradedao.updateAccount(tradeaccount);
					}else{
						int nmoney = UserService.tenpercent(money);		//加上百分之10
						nmoney = nmoney-money;
						if(nmoney!=0){
							String plusGb = UserService.plusGb(gb, nmoney+"");					
							uu.setGb(plusGb);
							userdao.updateGb(uu);			//更新用户Gb
						}
						Gamedistrict gamedistrict = new Gamedistrict();			//获得分区serverid
						gamedistrict.setGamename(gamename);
						gamedistrict.setGameregion(gameregion);
						int serverid = gamedistrictdao.getserveridByregion(gamedistrict);
						
						Operation oper = GamenameFactory.createOperation(gamename, u.getOpenuserid(), serverid);
						String sHtmlText = oper.payresult(UtilDate.getTimeStamp(), out_trade_no, total_fee,trade1.getExt());

						if(sHtmlText.equals("充值成功")){
							//更新有无到账
							Trade trade2 = new Trade();
							trade2.setTrade_no(out_trade_no);
							trade2.setAccount("yes");
							tradedao.updateAccount(trade2);
						}						
					}		
				}
			}
			
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
	@SuppressWarnings("unchecked")
	@RequestMapping("/return_url.do")
	public String returnurl(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//获取支付宝GET过来反馈信息
		Map<String,String> params = new HashMap<String,String>();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();){
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
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
		total_fee = total_fee.substring(0, total_fee.indexOf("."));
		int money = Integer.parseInt(total_fee);
		
		//计算得出通知验证结果
	//	boolean verify_result = AlipayNotify.verify(params);
		
		if(AlipayNotify.verify(params)){//验证成功
			if(trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS")){
				Trade trade1 = tradedao.findbytrade_no(out_trade_no);
				String state = trade1.getState();
				if(state.equals("待付款")){
					
					//获得用户名
					String userid = trade1.getUserid();
					//获得充值的游戏
					String gamename = trade1.getGamename();
					//获得充值游戏分区
					String gameregion =trade1.getGameregion();
					
					//修改状态
					String state1 = "完成";
					
					updatepromotermoney(userid,total_fee);	//其推广者获得收益
					
					//更新充值状态
					Trade tradestate = new Trade();
					tradestate.setState(state1);
					tradestate.setDate(UtilDate.getDateFormatter());
					tradestate.setTrade_no(out_trade_no);
					tradedao.updateState(tradestate);
					
					User u = userdao.findByUsername(userid);
					String gb = u.getGb(); //获得玩家初始的Gb数量
					
					User uu = new User();
					uu.setUserid(userid);
					if(gamename.equals("平台挂机点")){
						money = UserService.tenpercent(money);		//加上百分之10
						String plusGb = UserService.plusGb(gb, money+"");						
						uu.setGb(plusGb);
						userdao.updateGb(uu);			//更新用户Gb	
						//更新有无到账
						Trade tradeaccount = new Trade();
						tradeaccount.setAccount("yes");
						tradeaccount.setTrade_no(out_trade_no);
						tradedao.updateAccount(tradeaccount);
					}else{
						int nmoney = UserService.tenpercent(money);		//加上百分之10
						nmoney = nmoney-money;
						if(nmoney!=0){
							String plusGb = UserService.plusGb(gb, nmoney+"");					
							uu.setGb(plusGb);
							userdao.updateGb(uu);			//更新用户Gb
						}
						Gamedistrict gamedistrict = new Gamedistrict();			//获得分区serverid
						gamedistrict.setGamename(gamename);
						gamedistrict.setGameregion(gameregion);
						int serverid = gamedistrictdao.getserveridByregion(gamedistrict);
						Operation oper = GamenameFactory.createOperation(gamename, u.getOpenuserid(), serverid);
						String sHtmlText = oper.payresult(UtilDate.getTimeStamp(), out_trade_no, total_fee,trade1.getExt());
						
						if(sHtmlText.equals("充值成功")){
							//更新有无到账
							Trade trade2 = new Trade();
							trade2.setTrade_no(out_trade_no);
							trade2.setAccount("yes");
							tradedao.updateAccount(trade2);	
							return "newMemberCenter/paysuccess";
						}					
					}						
				}else{
					return "newMemberCenter/paysuccess";
				}
			}
			return "redirect:recharge.do";
		}else{
			//该页面可做页面美工编辑
			out.println("连接失败");
		}
		return null;
	}
	
	/**
	 * 更新推广金额
	 * @param userid 当前充值用户，可查到其推广者
	 * @param total_fee 当前充值的金额
	 */
	private void updatepromotermoney(String userid,String total_fee) {
		User user = userdao.findByUsername(userid);
		if(user.getSpreadcode()!=null){
			Promoter promoter = promoterdao.findBynumber(user.getSpreadcode());
			if(promoter!=null){				//判断他有无推广者
				Promoterrecord pr = new Promoterrecord();
				pr.setUserid(promoter.getUserid());
				pr.setDate(UtilDate.getMonthLine());
				Promoterrecord p = promoterrecorddao.findByUserid(pr);		//查询当月有无推广记录
				boolean flag = checkfirstpay(userid);	//判断是不是首冲
				if(p!=null){
					double agemoney = p.getRecommendmoney();		//获得之前推广金额
					if(flag){
						pr.setRecommendmoney(Double.parseDouble(total_fee)*0.3+agemoney);
					}else{
						pr.setRecommendmoney(Double.parseDouble(total_fee)*0.01+agemoney);
					}
					promoterrecorddao.updatemoney(pr);	
				}else{
					if(flag){
						pr.setRecommendmoney(Double.parseDouble(total_fee)*0.3);
					}else{
						pr.setRecommendmoney(Double.parseDouble(total_fee)*0.01);
					}
					pr.setRecommendperson(0);
					pr.setState("推广中");
					promoterrecorddao.addrecord(pr);
				}
			}
		}	
	}

	/**
	 * 判断该用户是否是首冲
	 * @param userid
	 * @return
	 */
	private  boolean checkfirstpay(String userid) {
		String gamename = tradedao.findByUserid(userid);
		if(gamename==null){
			return true;
		}else{
			return false;
		}
	}

	/**
	 * 充值跳转
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/wypay.do")
	public String pay(HttpServletRequest request,HttpServletResponse response){	
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			try {
				//充值的游戏名字
				String gamename = new String(request.getParameter("gamename").getBytes("ISO-8859-1"),"UTF-8");
				//充值的游戏分区
				String gameregion = new String(request.getParameter("gameregion").getBytes("ISO-8859-1"),"UTF-8");
				//充值金额
				String total_fee = new String(request.getParameter("money").getBytes("ISO-8859-1"),"UTF-8");
				//默认网银
				String defaultbank = new String(request.getParameter("bank").getBytes("ISO-8859-1"),"UTF-8");				
				//支付类型
				String payment_type = "1";
				//商户订单号
				String out_trade_no =UtilDate.getOrderNum()+UtilDate.getThree(); 				
				//订单名称
				String subject = "充值";			
				//默认支付方式
				String paymethod = "bankPay";
				//获得时间
				String date2 = UtilDate.getDateFormatter();
				//获得用户名
				HttpSession namesession = request.getSession();
				User user = (User) namesession.getAttribute("user");				
				if(user!=null){
					String userid = user.getUserid();
					
					//判断用户的充值方式
					if("alipay".equals(defaultbank)){
						Trade trade = new Trade(userid,out_trade_no,total_fee,gamename,gameregion,date2,"待付款","no","支付宝充值");
						trade.setOpenuserid(user.getOpenuserid());
						tradedao.insert(trade);
						
						Map<String, String> sParaTemp = new HashMap<String, String>();
						sParaTemp.put("service", "create_direct_pay_by_user");
				        sParaTemp.put("partner", AlipayConfig.partner);
				        sParaTemp.put("seller_email", AlipayConfig.seller_email);
				        sParaTemp.put("_input_charset", AlipayConfig.input_charset);
						sParaTemp.put("payment_type", payment_type);
						sParaTemp.put("notify_url", AlipayConfig.notify_url);
						sParaTemp.put("return_url", AlipayConfig.return_url);
						sParaTemp.put("out_trade_no", out_trade_no);
						sParaTemp.put("subject", subject);
						sParaTemp.put("total_fee", total_fee);
						String sHtmlText = AlipaySubmit.buildRequest(sParaTemp,"get","确认");
						out.println(sHtmlText);
					}else if("wxpay".equals(defaultbank)){
						Trade trade = new Trade(userid,out_trade_no,total_fee,gamename,gameregion,date2,"待付款","no","微信扫码充值");
						trade.setOpenuserid(user.getOpenuserid());
						tradedao.insert(trade);					
						 //扫码支付
					    WxPayDto tpWxPay1 = new WxPayDto();
					    tpWxPay1.setBody("199Y游戏充值");
					    tpWxPay1.setOrderId(out_trade_no);
					    tpWxPay1.setSpbillCreateIp("127.0.0.1");
					    tpWxPay1.setTotalFee(total_fee);
						String codeurl = getCodeurl(tpWxPay1);
System.out.println("code_url----------------"+codeurl);
						request.setAttribute("trade_no",out_trade_no);
						request.setAttribute("body",tpWxPay1.getBody());
						request.setAttribute("totalfee",total_fee);
						request.setAttribute("codeurl", codeurl);
						return "newMemberCenter/wxsaoma";
					}else{
						Trade trade = new Trade(userid,out_trade_no,total_fee,gamename,gameregion,date2,"待付款","no",defaultbank+"网银充值");
						trade.setOpenuserid(user.getOpenuserid());
						tradedao.insert(trade);
						
						//把请求参数打包成数组
						Map<String, String> sParaTemp = new HashMap<String, String>();
						sParaTemp.put("service", "create_direct_pay_by_user");
				        sParaTemp.put("partner", AlipayConfig.partner);
				        sParaTemp.put("seller_email", AlipayConfig.seller_email);
				        sParaTemp.put("_input_charset", AlipayConfig.input_charset);
						sParaTemp.put("payment_type", payment_type);
						sParaTemp.put("notify_url",AlipayConfig.notify_url);
						sParaTemp.put("return_url", AlipayConfig.return_url);
						sParaTemp.put("out_trade_no", out_trade_no);
						sParaTemp.put("subject", subject);
						sParaTemp.put("total_fee", total_fee);
						sParaTemp.put("paymethod", paymethod);
						sParaTemp.put("defaultbank",defaultbank);
						
						//建立请求
						String sHtmlText = AlipaySubmit.buildRequest(sParaTemp,"get","确认");
						out.println(sHtmlText);
					}
				}else{
					out.print("充值异常!");
				}		
			} catch (UnsupportedEncodingException e) {
				out.print("充值异常!");
				e.printStackTrace();
			}				
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}	
		return null;
	}
	
	/**
	 * 获取微信扫码支付二维码连接
	 */
	@SuppressWarnings("static-access")
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
