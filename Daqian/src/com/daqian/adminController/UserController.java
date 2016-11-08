package com.daqian.adminController;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daqian.dao.PurchaseDao;
import com.daqian.dao.TradeDao;
import com.daqian.dao.UserAssetsDao;
import com.daqian.dao.UserDao;
import com.daqian.entity.Trade;
import com.daqian.entity.User;
import com.daqian.entity.UserAssets;
import com.daqian.entity.purchase;

@Controller
public class UserController {
	@Resource
	private UserDao udao;
	@Resource
	private UserAssetsDao uadao;
	@Resource
	private PurchaseDao pcdao;
	@Resource
	private TradeDao tdao;
	
	/**
	 * 
	 * 用户表
	 * 查询范围内时间数据
	 */
	@RequestMapping("/user-list.do")
	public String userlist(HttpServletRequest request){
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		String date3 = request.getParameter("date3");
		String date4 = request.getParameter("date4");
		if(date1!="" && date2!="" && date1!=null && date2!=null && date3!="" && date4!="" && date3!=null && date4!=null){
			List<User> ulist = udao.findbyLRdate(date1, date2, date3, date4);
			request.setAttribute("ulist", ulist);
		}else if(date1!="" && date2!="" && date1!=null && date2!=null){
			List<User> ulist = udao.findbydate(date1,date2);
			request.setAttribute("ulist", ulist);
		}else if(date3!="" && date4!="" && date3!=null && date4!=null){
			List<User> ulist = udao.findbyLogindate(date3,date4);
			request.setAttribute("ulist", ulist);
		}else{
			List<User> ulist = udao.all();
			request.setAttribute("ulist", ulist);	
		}
		return "Administrator/template/member/user-list";
	}
	/**
	 * 
	 * 用户资产表
	 * 查询所有
	 */
	@RequestMapping("/userassets-list.do")
	public String userassetslist(HttpServletRequest request){
		List<UserAssets> ualist = uadao.all();
		request.setAttribute("ualist", ualist);
		return "Administrator/template/member/userassets-list";
	}
	/**
	 * 
	 * 购买表
	 * 通过购买日期，产品开始日期查询
	 */
	@RequestMapping("/purchase-list.do")
	public String purchaselist(HttpServletRequest request){
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		String date3 = request.getParameter("date3");
		String date4 = request.getParameter("date4");
		if(date1!="" && date2!="" && date1!=null && date2!=null && date3!="" && date4!="" && date3!=null && date4!=null){
			List<purchase> pclist = pcdao.findBySD(date1, date2, date3, date4);
			request.setAttribute("pclist", pclist);
		}else if(date1!="" && date2!="" && date1!=null && date2!=null){
			List<purchase> pclist = pcdao.findBydate(date1, date2);
			request.setAttribute("pclist", pclist);
		}else if(date3!="" && date4!="" && date3!=null && date4!=null){
			List<purchase> pclist = pcdao.findBystartdate(date3, date4);
			request.setAttribute("pclist", pclist);
		}else{
			List<purchase> pclist = pcdao.all();
			request.setAttribute("pclist", pclist);
		}
		
		return "Administrator/template/member/purchase-list";
	}
	/**
	 * 
	 * 购买表
	 * 通过上一次返还利息时间查询
	 */
	@RequestMapping("/purchase-last.do")
	public String purchaselast(HttpServletRequest request){
		String date1 = request.getParameter("date5");
		String date2 = request.getParameter("date6");
		if(date1!="" && date2!="" && date1!=null && date2!=null){
			List<purchase> pclist = pcdao.findByLastbackdate(date1, date2);
			request.setAttribute("pclist", pclist);
		}else{
			List<purchase> pclist = pcdao.all();
			request.setAttribute("pclist", pclist);
		}
		
		return "Administrator/template/member/purchase-list";
	}
	/**
	 * 
	 * 充值表
	 * 查询所有
	 */
	@RequestMapping("/trade-list.do")
	public String tradelist(HttpServletRequest request){
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		if(date1!="" && date2!="" && date1!=null && date2!=null){
			List<Trade> tlist = tdao.findbydate(date1, date2);
			request.setAttribute("tlist", tlist);
		}else{
			List<Trade> tlist = tdao.all();
			request.setAttribute("tlist", tlist);
		}
		return "Administrator/template/member/trade-list";
	}
	/**
	 * @throws IOException 
	 * 
	 * 
	 */
	@RequestMapping("/addmoney.do")
	public void addmoney(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String uaid1 = request.getParameter("uaid");
		String money1 = request.getParameter("money");
		double money = 0;
		int uaid = 0;
		if(money1!=null && money1!=""){
			money = Double.parseDouble(money1);
		}
		if(uaid1!=null && uaid1!=""){
			uaid = Integer.parseInt(uaid1);
		}
		UserAssets u = uadao.findById(uaid);
		double availablemoney = u.getAvailablemoney()+money;
		double residualmoney = u.getResidualmoney()+money;
		int res = uadao.updatemoney(residualmoney, availablemoney, uaid);
		System.out.println(res);
		if(res==-1){
			out.print("error");
		}else{
			out.print("success");
		}
	}
}
