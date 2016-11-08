package com.daqian.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daqian.dao.TradeDao;
import com.daqian.dao.UserAssetsDao;
import com.daqian.dao.UserDao;
import com.daqian.entity.Trade;
import com.daqian.entity.User;
import com.daqian.entity.UserAssets;


@Controller("cash")
public class cashController {
	@Resource
	private UserAssetsDao userassetsdao;
	@Resource
	private UserDao userdao;
	@Resource
	private TradeDao tradedao;
	/**
	 * 判断提现支付密码是否正确
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/tixian.do")
	public void tixian(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf8");
		PrintWriter out = response.getWriter();
		
		String username = request.getParameter("username");
		String paypwd = request.getParameter("paypwd");
		
		//MD5加密
		paypwd = DigestUtils.md5Hex(getContentBytes(paypwd, "utf-8"));
		
		UserAssets userassets = userassetsdao.findByName(username);
		String dbpwd = userassets.getPaypassword();
		
		if(dbpwd.equals(paypwd)){
			out.print("success");
		}else{
			out.print("支付密码错误");
		}
	}
	
	/**
	 * MD5
	 * @param content
	 * @param charset
	 * @return
	 */
	 private static byte[] getContentBytes(String content, String charset) {
	        if (charset == null || "".equals(charset)) {
	            return content.getBytes();
	        }
	        try {
	            return content.getBytes(charset);
	        } catch (UnsupportedEncodingException e) {
	            throw new RuntimeException("MD5签名过程中出现错误,指定的编码集不对,您目前指定的编码集是:" + charset);
	        }
	    }
	
	/**
	 * 提现操作
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/cash.do")
	public String cash(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");	
		
		String username = request.getParameter("username");
		String money = request.getParameter("money");
		User user = userdao.findByName(username);
		String realname = user.getRealname();
		String telephone = user.getTelephone();
		String state = "审核中";
		String type = "提现";
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date1 = sdf.format(date);

		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmss");
		String trade_no = sdf1.format(date);
		
		Trade trade = new Trade();
		trade.setUsername(username);
		trade.setTrade_no(trade_no);
		trade.setMoney(money);
		trade.setDate(date1);
		trade.setRealname(realname);
		trade.setTelephone(telephone);
		trade.setState(state);
		trade.setType(type);
		tradedao.insert(trade);
		
		return "user/hyzx/zczl";
	}
}
