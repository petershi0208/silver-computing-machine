package com.yqwan.ht.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alipay.util.UtilDate;
import com.yqwan.dao.IAdminDao;
import com.yqwan.domain.Admin;
import com.yqwan.service.Log;
@Controller
public class AdminLoginController {
	@Resource
	private IAdminDao admindao;
	
	@RequestMapping("admin/login.do")
	public void adminlogin(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String ip = request.getHeader("x-forwarded-for"); 
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = request.getHeader("Proxy-Client-IP"); 
			} 
			if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = request.getHeader("WL-Proxy-Client-IP"); 
			} 
			if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = request.getRemoteAddr(); 
			} 
			
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		password = DigestUtils.md5Hex(password);
		Admin admin = admindao.login(username);
		if(admin != null){
			String password1=admin.getPassword();
			if(password1.equals(password)){
Log.logResult(UtilDate.getDateFormatter()+"：199Y后台"+admin.getUsername()+"登录,ip地址为："+ip+"\r\n", "d:\\Logs\\AdminLogs");
				HttpSession session = request.getSession();
				session.setAttribute("admin",admin);
				session.setMaxInactiveInterval(2*60*60);
	//			out.print("success");
			}else{
				out.print("密码错误");
			}
		}else{
			out.print("用户名不存在");
		}
	}
	
	@RequestMapping("admin/destroy.do")
	public String admindestroy(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		HttpSession session = request.getSession();
		session.getAttribute("username");
		session.invalidate();
		return "redirect:/administratorht/login.jsp";
	}
}
