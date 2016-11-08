package com.yqwan.ht.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yqwan.dao.ITradeDao;
import com.yqwan.dao.IUserDao;
import com.yqwan.domain.Trade;
import com.yqwan.domain.User;

@Controller
public class UserController {
	@Resource
	private IUserDao userdao;
	@Resource
	private ITradeDao tradedao;
	/**
	 * 分页查询礼包信息
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/administrator/userinfo.do")
	public String userinfo(HttpServletRequest request) throws UnsupportedEncodingException{
		// TODO Auto-generated catch block
		String curpage = request.getParameter("page");			//当前页数
		String userid1 = request.getParameter("userid");	//礼包名
		String userid="";
		if(userid1!=null && userid1!=""){
			userid = URLDecoder.decode(userid1,"UTF-8");
		}
		//分页条件查询
		if(curpage!=null && curpage!=""){
			int currentpage=Integer.parseInt(curpage);
			List<User> userinfo = userdao.paging(userid,(currentpage-1)*10,10);
			request.setAttribute("userinfo", userinfo);
		}else{
			List<User> userinfo = userdao.paging(userid,0,10);
			request.setAttribute("userinfo", userinfo);
		}
		int count = userdao.count(userid);		//总页数
		request.setAttribute("count", count);
		request.setAttribute("userid", userid);
		return "administratorht/template/user/userinfo";
	}
	/**
	 * 分页查询礼包信息
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/administrator/tradeinfo.do")
	public String tradeinfo(HttpServletRequest request) throws UnsupportedEncodingException{
		// TODO Auto-generated catch block
		String curpage = request.getParameter("page");			//当前页数
		String userid1 = request.getParameter("userid");	//礼包名
		String userid="";
		if(userid1!=null && userid1!=""){
			userid = URLDecoder.decode(userid1,"UTF-8");
		}
		//分页条件查询
		if(curpage!=null && curpage!=""){
			int currentpage=Integer.parseInt(curpage);
			List<Trade> tradeinfo = tradedao.paging(userid,(currentpage-1)*10,10);
			request.setAttribute("tradeinfo", tradeinfo);
		}else{
			List<Trade> tradeinfo = tradedao.paging(userid,0,10);
			request.setAttribute("tradeinfo", tradeinfo);
		}
		int count = tradedao.count(userid);		//总页数
		request.setAttribute("count", count);
		request.setAttribute("userid", userid);
		return "administratorht/template/user/tradeinfo";
	}
}
