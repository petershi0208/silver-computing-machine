package com.yqwan.pagecontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.ParseException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alipay.util.UtilDate;
import com.yqwan.dao.IPhonecodeDao;
import com.yqwan.dao.IUserDao;
import com.yqwan.domain.ChangyanUser;
import com.yqwan.domain.ChangyanUserInfo;
import com.yqwan.domain.Phonecode;
import com.yqwan.domain.User;
import com.yqwan.service.Log;

/**
 * 
 * @author TYShi
 *
 */

@Controller("login")
public class LoginController{
	@Resource
	private IUserDao userdao;
	@Resource
	private IPhonecodeDao phonecodedao;
	
	/**
	 * 畅言接口单点登录
	 * @param request
	 * @param response
	 */
	@RequestMapping("changyanlogin.do")
	public void changyanlogin(HttpServletRequest request, HttpServletResponse response) throws Exception{
		try {
			ChangyanUser cyuser = new ChangyanUser();
			String callback =  new String(request.getParameter("callback").getBytes("ISO-8859-1"),"UTF-8");
			User user = (User) request.getSession().getAttribute("user");
			if(user!=null){
				cyuser.setIs_login(1);
				ChangyanUserInfo cyuserinfo = new ChangyanUserInfo();
				cyuserinfo.setImg_url(user.getHeadpicture());
				cyuserinfo.setNickname(user.getNickname());
				cyuserinfo.setProfile_url("http:www.199y.com");
				cyuserinfo.setUser_id(user.getId());
				cyuserinfo.setSign("random");
				cyuser.setUser(cyuserinfo);
			}else{
				cyuser.setIs_login(0);
			}
			response.setContentType("application/x-javascript;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.write(callback + "(" + JSONObject.fromObject(cyuser) + ")");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 游戏官网退出接口
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/gamedestroy.do")
	public void gamedestroy(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String callback = request.getParameter("jsoncallback");
		PrintWriter out = response.getWriter();
		//清除cookie值
		if(deleteCookie(response,request)){
			String back = "{'code':0,'msg':'退出成功'}";
			JSONObject jsonback = JSONObject.fromObject(back);
			out.print(callback + "(" + jsonback + ")");
		}
	}
	
	/**
	 * 游戏官网登录接口
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/logingame.do")
	public void loginornot(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String userid = request.getParameter("userName");
		String password = request.getParameter("password");
//		String game = request.getParameter("g");
//		password = MD5.sign(password, "utf-8");

		String callback = request.getParameter("jsoncallback");
//		System.out.println(user.getUserid());
		
		
//		System.out.println(request.getSession().getId());
		
		//通过用户名获得user
		User user = userdao.findByUsername(userid);
		if(user==null){
//			out.print(""); 
			String back = "{'code':4,'msg':'用户名不存在'}";
			JSONObject jsonback = JSONObject.fromObject(back);
			out.print(callback + "(" + jsonback + ")");
		}else if(password.equals(user.getPassword())){
			//加入到一级域名cookie下
Log.logResult(UtilDate.getDateFormatter()+";199Y游戏官网当前登录用户:"+userid+"\r\n", "d:\\Logs\\199YLoginLogs");
			addCookie(user,response,request);
			updateLogindate(user);			//更新登录时间
			
			String back = "{\"msg\":\""+user.getNickname()+"\",\"code\":0}";
			JSONObject jsonback = JSONObject.fromObject(back);		
			out.print(callback + "(" + jsonback + ")");
		}else{
			String back = "{'code':2,'msg':'密码错误'}";
			JSONObject jsonback = JSONObject.fromObject(back);
			out.print(callback + "(" + jsonback + ")");
		}
	}
	
	
	/**
	 * 登录页面跳转会员中心
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/login.do")
	public String login(HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf8");
		String username = request.getParameter("username");
		String telephone = request.getParameter("telephone");
Log.logResult(UtilDate.getDateFormatter()+"199Y平台当前登录用户:"+username+"手机号为"+telephone, "d:\\Logs\\199YLoginLogs");
System.out.println("当前登录用户:"+username+"手机号为"+telephone);	
		User user = (User) request.getSession().getAttribute("user");
		updateLogindate(user);
		return "newMemberCenter/member";
	}
	
	/**
	 * 异步验证手机验证码
	 * @param request
	 * @param response 
	 * @throws IOException 
	 */
	@RequestMapping("/checklogincode.do")
	public void checkregisttwocode(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
			
		String code = request.getParameter("code");
		String phone = request.getParameter("telephone");
		User user = userdao.findByTelephone(phone);
		if(user!=null &&phone!=null){
			Phonecode pc = phonecodedao.findByphone(phone);
			String dbcode = pc.getCode();
			if(!code.equals(dbcode)){
				out.print("× 验证码不正确");
			}else{
				phonecodedao.delete(phone);
				//绑定session
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				session.setMaxInactiveInterval(72000);
				
				//加入到一级域名cookie下
				addCookie(user,response,request);
					out.print(" ");
			}
		}else{
			out.print("× 该手机号未注册");
		}
	}

	/**
	 * 修改登录时间
	 * @param user
	 */
	private void updateLogindate(User user) {
		//当前时间		
		String day =UtilDate.getDateFormatter();
			//更新登录时间
			User user12 = new User();
			user12.setUserid(user.getUserid());
			user12.setLogindate(day);
			userdao.updateLogindate(user12);
	}
	
	/**
	 * 异步账号验证登录
	 * @param request
	 * @throws IOException 
	 * @throws ParseException 
	 */
	@RequestMapping("/checklogin.do")
	public void check(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		request.setCharacterEncoding("utf8");
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		
		//MD5加密
//		password = MD5.sign(password, "UTF-8");
		
		//通过用户名获得user
		User user = userdao.findByUsername(userid);
		if(user!=null){
			String dbpassword = user.getPassword();
			if(dbpassword.equals(password)){
				//绑定session
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				session.setMaxInactiveInterval(72000);
				
				//加入到一级域名cookie下
				addCookie(user,response,request);
				out.print("");
			}else{
				out.print("x 密码错误");
			}
		}else{
			out.print("x 用户名不存在");
		}	
	}
	
	/**
	 * 销毁登录session
	 * @param request
	 * @return
	 */
	@RequestMapping("/destroy.do")
	public String destroy(HttpServletRequest request, HttpServletResponse response) throws Exception{	
		HttpSession session = request.getSession();
		session.getAttribute("user");
		session.invalidate();
		
		//清除cookie值
			deleteCookie(response,request);
		return "redirect:toindex.do";
	}
	
	/**
	 * 删掉Cookie
	 * @param response
	 * @throws MalformedURLException 
	 */
	private boolean deleteCookie(HttpServletResponse response,HttpServletRequest request) throws Exception {
		StringBuffer url = request.getRequestURL();  
		String tempContextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").toString();
		String u = getTopDomainWithoutSubdomain(tempContextUrl);		//转一级域名	
		 Cookie c = new Cookie("cookieuser", null);
	  	  c.setDomain("."+u);//注意是以点号开头的. 
	  	  c.setPath("/");
	  	  c.setMaxAge(0);
	  	  response.addCookie(c);
	  	  return true;
	}

	/**
	 * 添加cookie
	 * @param user	用户信息
	 * @param response 
	 * @throws Exception
	 */
	public void addCookie(User user,HttpServletResponse response,HttpServletRequest request) throws Exception{
		StringBuffer url = request.getRequestURL();  
		String tempContextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").toString();
		String u = getTopDomainWithoutSubdomain(tempContextUrl);		//转一级域名	
		
		String cookieuser = "{'userid':'"+user.getUserid()+"','nickname':'"+user.getNickname()+"'}";
		JSONObject jsonObject = JSONObject.fromObject(cookieuser);
//		System.out.println(jsonObject.toString());
		Cookie c = new Cookie("cookieuser",URLEncoder.encode(jsonObject.toString(),"utf-8")); 
		c.setDomain("."+u);//注意是以点号开头的. 
		c.setPath("/");
		c.setMaxAge(60*60*24);
		response.addCookie(c);
	}
	
	/**
	 * 二级域名转一级域名
	 * @param url
	 * @return
	 * @throws Exception
	 */
	public static String getTopDomainWithoutSubdomain(String url)throws Exception {

		String host = new URL(url).getHost().toLowerCase();// 此处获取值转换为小写
		Pattern pattern = Pattern.compile("[^\\.]+(\\.com\\.cn|\\.net\\.cn|\\.org\\.cn|\\.gov\\.cn|\\.com|\\.net|\\.cn|\\.org|\\.cc|\\.me|\\.tel|\\.mobi|\\.asia|\\.biz|\\.info|\\.name|\\.tv|\\.hk|\\.公司|\\.中国|\\.网络)");
		Matcher matcher = pattern.matcher(host);
		while (matcher.find()) {
			return matcher.group();
		}
		return null;
	}
}
