package com.daqian.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daqian.dao.PurchaseDao;
import com.daqian.dao.UserAssetsDao;
import com.daqian.dao.UserDao;
import com.daqian.entity.User;
import com.daqian.entity.UserAssets;
import com.daqian.entity.purchase;

@Controller("login")
public class LoginController {
	
	@Resource
	private UserDao userdao;
	
	@Resource
	private UserAssetsDao userassetsdao;
	
	@Resource
	private PurchaseDao purchasedao;
	/**
	 * 登录页面跳转
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/login.do")
	public String login(HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf8");
		String username = request.getParameter("username");
		System.out.println(username);
		//手机号，邮箱，登录转成用户名登录，避免更新userassets表空指针异常
		User user = userdao.login(username);
		username = user.getUsername();
			
		UserAssets userassets = userassetsdao.findByName(username);
		Double rolemoney = userassets.getRolemoney();
		Double residualmoney = userassets.getResidualmoney();
		Double availablemoney = userassets.getAvailablemoney();
		
		HttpSession roleSession = request.getSession();
		roleSession.setAttribute("rolemoney", rolemoney);
		roleSession.setMaxInactiveInterval(72000);
		
		HttpSession residualSession = request.getSession();
		residualSession.setAttribute("residualmoney", residualmoney);
		residualSession.setMaxInactiveInterval(72000);
		
		HttpSession availableSession = request.getSession();
		availableSession.setAttribute("availablemoney", availablemoney);
		availableSession.setMaxInactiveInterval(72000);
		
		
		//获取一共多少多少页
		List<purchase> l = purchasedao.findNum(username);
		int totalpage = l.size();
		if(totalpage%3==0){
			totalpage = totalpage/3;
		}else{
			totalpage = totalpage/3 +1;
		}		
		HttpSession pagesession = request.getSession();
		pagesession.setAttribute("total", totalpage);
		pagesession.setMaxInactiveInterval(72000);
		
		
		
		return "user/hyzx/zczl";
	}
	
	/**
	 * 异步验证登录
	 * @param request
	 * @throws IOException 
	 * @throws ParseException 
	 */
	@RequestMapping("/check.do")
	public void check(HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		request.setCharacterEncoding("utf8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		//MD5加密
		password = DigestUtils.md5Hex(getContentBytes(password, "utf-8")).toString();
		
		
		User user = userdao.login(username);
		if(user!=null){
			String dbpassword = user.getPassword();
			if(dbpassword.equals(password)){
				//用户名绑定session
				String name = user.getUsername();
				HttpSession session = request.getSession();
				session.setAttribute("username",name);
				session.setMaxInactiveInterval(72000);
				
				//用户名绑定购买产品session
				List<purchase> purcha = purchasedao.findNum(name);
				HttpSession session44 = request.getSession();
				session44.setAttribute("purcha",purcha);
				session44.setMaxInactiveInterval(72000);
				
				//获得上次登录时间
				HttpSession session11 = request.getSession();
				Date logindate = user.getLasttimelogin_date();
				String loginday = logindate.toString();
				session11.setAttribute("logintime", loginday);
				session11.setMaxInactiveInterval(72000);
		//		System.out.println(logindate);
				
				//获得上次登录IP
				HttpSession session22 = request.getSession();
				String ip = user.getLocalip();
				session22.setAttribute("localip",ip);
				session11.setMaxInactiveInterval(72000);
							
				//更新登录时间
				Date date1 = new Date();
				SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				String day = sfd.format(date1);
				Date date =sfd.parse(day);
				java.sql.Date sqlDate=new java.sql.Date(date.getTime());
				userdao.changelogintime(username, sqlDate);
				
				//更新登录ip
				InetAddress ia=null;
				try {
					ia=InetAddress.getLocalHost();
					String localip=ia.getHostAddress();
					userdao.changeloginip(username, localip);
				} catch (UnknownHostException e) {
					e.printStackTrace();
				}
				
				//获得用户角色
				String role = user.getRole();
				HttpSession rolesession = request.getSession();
				rolesession.setAttribute("role",role);
				session.setMaxInactiveInterval(72000);
				
				//获得realname和idcard
				String realname = user.getRealname();
				String card = user.getCard();
				System.out.println(realname);
				if(realname!=null&&card!=null){
					HttpSession realsession = request.getSession();
					realsession.setAttribute("realname",realname);
					realsession.setMaxInactiveInterval(72000);
					
					HttpSession cardsession = request.getSession();
					cardsession.setAttribute("card",card);
					cardsession.setMaxInactiveInterval(72000);
				}
				
				out.print("");
			}else{
				out.print("x 用户名或密码错误");
			}
		}else{
			out.print("x 用户名或密码错误");
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
	 * 销毁登录session
	 * @param request
	 * @return
	 */
	@RequestMapping("/destroy.do")
	public String destroy(HttpServletRequest request){
		HttpSession session1 = request.getSession();
		session1.getAttribute("username");
		session1.invalidate();
		
		HttpSession session2 = request.getSession();
		session2.getAttribute("role");
		session2.invalidate();
		
		HttpSession session3 = request.getSession();
		session3.getAttribute("card");
		session3.invalidate();
		
		HttpSession session4 = request.getSession();
		session4.getAttribute("purcha");
		session4.invalidate();
		return "user/login";
	}
	
	/**
	 * 判断用户有无登录（会员中心按钮）
	 * @param request
	 * @return
	 */
	@RequestMapping("/tomember.do")
	public String memberCenter(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.getAttribute("username");
//		System.out.println(session.getAttribute("username"));
		if(session.getAttribute("username")==null){
			return "/user/login";
			
		}else{
			return "/user/hyzx/zczl";
		}
	}
	
}
