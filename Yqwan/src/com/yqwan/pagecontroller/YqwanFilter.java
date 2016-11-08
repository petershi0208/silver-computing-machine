package com.yqwan.pagecontroller;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import net.sf.json.JSONObject;

import com.yqwan.dao.IUserDao;
import com.yqwan.domain.User;
import com.yqwan.service.DoCookie;


public class YqwanFilter implements Filter {
	private IUserDao userdao; 
	private static final long serialVersionUID = 1L;
	public void destroy() { 
			System.out.println("Yqwanfilter 销毁");
	} 

	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException,ServletException {
		HttpServletRequest request = (HttpServletRequest)servletRequest; 
		HttpServletResponse response = (HttpServletResponse)servletResponse;
		
					
			//读取cookie
			Cookie[] cookies = request.getCookies();
			   if(cookies != null){  
			       for(Cookie cookie : cookies) { 
			           if(cookie.getName().equals("cookieuser")){
//			        	   System.out.println(cookie.getName() + "-------" + URLDecoder.decode(cookie.getValue(),"utf-8"));  
			        	   String s = URLDecoder.decode(cookie.getValue(),"utf-8");
			        	   JSONObject jsonObject = JSONObject.fromObject(s);
			        	   String userid  = (String) jsonObject.get("userid");
			        	   User user = userdao.findByUsername(userid);	        	  
			        	  HttpSession session = request.getSession();
			        	  session.setAttribute("user", user);		        	  
			           }
			           if(cookie.getName().equals("199ytoken")){
			        	   String content = cookie.getValue();
			        	   int count  = Integer.parseInt(content)+1;
			        	   DoCookie.addCookie(response, request, "199ytoken", count+"",180);
			        	   if(count>300){
			        		   response.getWriter().print("connection denied");
			        		   return;
			        	   }
			           }else{
			        	   DoCookie.addCookie(response, request, "199ytoken", "1",180);
			           }
			           
			       }
			   		
				int length = cookies.length;
				int length1=length;
				for(Cookie cookie : cookies){
			     	if(cookie.getName().equals("cookieuser")){
			        	length1 = length-1;
			    	}
				}
				if(length1==length){	
					request.getSession().removeAttribute("user");		//如果本地无cookie则销毁
				}
			 }
		chain.doFilter(request, response); 
			
		}
		
		
	public void init(FilterConfig arg0) throws ServletException { 
		String conf="applicationContext.xml";
		ApplicationContext ac = new ClassPathXmlApplicationContext(conf);
		userdao = ac.getBean("user",IUserDao.class);
		System.out.println("YqwanFilter开启"); 
		} 

}
