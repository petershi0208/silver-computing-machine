package com.daqian.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daqian.dao.TradeDao;
import com.daqian.entity.Trade;

/**
 * 微信扫描支付，异步验证成功付款后跳转页面
 * @author Administrator
 *
 */
@Controller("wxpay")
public class wxpaystateController {
	@Resource
	private TradeDao tradedao;
	
	@RequestMapping("/wxpaystate.do")
	public void wxpaystate(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf8");
		PrintWriter out = response.getWriter();
		
		String trade_no = request.getParameter("tradeno");
		Trade trade = tradedao.findbytrade_no(trade_no);
		String state = trade.getState();
		if(state.equals("待付款")){
			out.print("wait");
		}else if(state.equals("完成")){
			out.print("success");
		}
	}
}
