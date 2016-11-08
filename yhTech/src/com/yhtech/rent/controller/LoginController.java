package com.yhtech.rent.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.peter.util.Log;
import com.peter.util.UtilDate;

@Controller("logincontroller")
public class LoginController {
	
	/**
	 * 登录
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/login.do")
	public void login(HttpServletRequest request,HttpServletResponse response) throws IOException{
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
		if(!username.equals("admin")){
			log(";"+username+"用户不存在",ip);
			out.print("用户名错误");
		}else if(!password.equals("110110110l")){
			log(";"+username+"密码错误"+password,ip);
			out.print("密码错误");	
		}else{
			log(";"+username+"登录成功",ip);
			HttpSession session = request.getSession();
			session.setAttribute("admin", username);
			session.setMaxInactiveInterval(3600);
			out.print("success");	
		}
		
	}
	
	private void log(String content,String ip){
		Log.logResult(UtilDate.getDateFormatter()+content+"。来源IP:"+ip+"\r\n", "d:\\igjiaLogs\\yhTech\\LoginLogs");
	}
}
