package com.daqian.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daqian.dao.PhoneCodeDao;
import com.daqian.dao.UserAssetsDao;
import com.daqian.dao.UserDao;
import com.daqian.entity.User;
import com.daqian.entity.UserAssets;
import com.daqian.entity.phonecode;

@Controller("regist")
public class RegistController {
	
	@Resource
	private UserDao userdao;
	
	@Resource
	private PhoneCodeDao phonecodedao;
	
	@Resource
	private UserAssetsDao userassetsdao;
	
	/**
	 * 注册成功，向数据库插数据
	 * @param request
	 * @param model
	 * @return
	 * @throws ParseException
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/registtwo.do")
	public String registtwo(HttpServletRequest request,ModelMap model) throws ParseException, UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String phone = request.getParameter("mobile");
		String reg_type = request.getParameter("type");
		String mobilecode = request.getParameter("checkcode");
	//	System.out.println(username);
		
		//MD5加密
		password = DigestUtils.md5Hex(getContentBytes(password, "utf-8")).toString();
		
//		System.out.println(password);
		//对比短信验证码
		phonecode pc = phonecodedao.findByphone(phone);
		String code = pc.getCode();
		if(!mobilecode.equals(code)){
			model.put("code_msg", "验证码不符");
		}
		phonecodedao.delete(phone);	
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setTelephone(phone); 
		user.setRole(reg_type);
		
		//获取当前时间
		Date date1 = new Date();
		SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String day = sfd.format(date1);
		Date date =sfd.parse(day);
		java.sql.Date sqlDate=new java.sql.Date(date.getTime());
		user.setRegist_date(sqlDate);
		user.setLasttimelogin_date(sqlDate);
		
		//获得本机IP
		InetAddress ia=null;
		try {
			ia=InetAddress.getLocalHost();
			String localip=ia.getHostAddress();
	//		System.out.println(localip+"a");
			user.setLocalip(localip);
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}		
		
		
		
		userdao.regist(user);	
	
		//用户资产表初始化
		UserAssets userassets = new UserAssets();
		userassets.setUsername(username);
		userassets.setRolemoney(0);
		userassets.setResidualmoney(0);
		userassets.setAvailablemoney(0);
		userassetsdao.insert(userassets);
		
		//用户资产交易密码初始化（同登录密码）
		userassetsdao.insertpwd(username, password);
		
		return "user/registered3";
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
		 * 异步验证手机验证码
		 * @param request
		 * @param response
		 * @throws IOException 
		 */
		@RequestMapping("/checkcode.do")
	public void checkcode(HttpServletRequest request, HttpServletResponse response) throws IOException{
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
		String code = request.getParameter("code");
		String phone = request.getParameter("phone");

		phonecode pc = phonecodedao.findByphone(phone);
		String dbcode = pc.getCode();
		if(!code.equals(dbcode)){
			out.print("× 验证码不正确");
		}else{
			out.print(" ");
		}
	}
		
	/**
	 * 手机注册
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	@RequestMapping("/ht/rephone.do")
	public void rephone(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String phone = request.getParameter("phone");
		String money = request.getParameter("money");
		String username = phone;
		String password = "111111";
		password=DigestUtils.md5Hex(getContentBytes(password, "utf-8")).toString();
		User user1 = userdao.findByPhone(phone);
		if(user1!=null){
			out.print("× 手机号已被注册");
			return;
		}else if(phone!=null && phone !="" && money!=null && money!=""){
			//添加用户信息
			User user = new User();
			user.setUsername(username);
			user.setTelephone(phone);
			user.setPassword(password);
			user.setRole("manageMoney");
			//获取当前时间
			Date date1 = new Date();
			SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String day = sfd.format(date1);
			Date date =sfd.parse(day);
			java.sql.Date sqlDate=new java.sql.Date(date.getTime());
			user.setRegist_date(sqlDate);
			user.setLasttimelogin_date(sqlDate);
			
			//获得本机IP
			InetAddress ia=null;
			try {
				ia=InetAddress.getLocalHost();
				String localip=ia.getHostAddress();
		//		System.out.println(localip+"a");
				user.setLocalip(localip);
			} catch (UnknownHostException e) {
				e.printStackTrace();
			}		
			userdao.regist(user);
			//用户资产表初始化
			UserAssets userassets = new UserAssets();
			userassets.setUsername(username);
			userassets.setRolemoney(0);
			userassets.setResidualmoney(0);
			int mon = Integer.parseInt(money);
			userassets.setAvailablemoney(mon);
			userassets.setResidualmoney(mon);
			userassetsdao.insert(userassets);		
			
			//用户资产交易密码初始化（同登录密码）
			userassetsdao.insertpwd(username, password);
			out.print("注册成功");
			return;
		}else{
			out.print("× 请输入完整信息");
		}
	}
	
	/**
	 * 注册第一张跳转页面
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/regist.do")
	public String regist(HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String phone = request.getParameter("mobile");
		String reg_type = request.getParameter("reg_type");
	//	System.out.println(username+"是");
		
		
		HttpSession session = request.getSession();
		session.setAttribute("phone",phone);
		session.setMaxInactiveInterval(3000);
		
		HttpSession session1 = request.getSession();
		session1.setAttribute("registname",username);
		session1.setMaxInactiveInterval(3000);
		
		HttpSession session2 = request.getSession();
		session2.setAttribute("password",password);
		session2.setMaxInactiveInterval(3000);
		
		HttpSession session3 = request.getSession();
		session3.setAttribute("type",reg_type);
		session3.setMaxInactiveInterval(3000);
		
		return "user/registered2";
		
		
		
	}
	
	/**
	 * 异步验证用户名
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/checkname.do")
	public void checkname(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		User user = userdao.findByName(name);
		if(user==null){
			out.print("√ 用户名可以使用");
		}else{
			out.print("× 用户名已被注册");
		}		
	}
	
	/**
	 * 异步验证手机号
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/checkphone.do")
	public void checkphone(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		User user = userdao.findByPhone(name);
		if(user==null){
			out.print("√ 此手机号可以使用");
		}else{
			out.print("× 此手机号已被使用");
		}	
	}
	
	/**
	 * 发送手机短信验证功能
	 * @param request
	 */
	@RequestMapping("/sendsms.do")
	public void sendsms(HttpServletRequest request){
		String telephone = request.getParameter("phone");
		
		String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
		HttpClient client = new HttpClient(); 
		PostMethod method = new PostMethod(Url); 
			
		//client.getParams().setContentCharset("GBK");		
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");

		
		int mobile_code = (int)((Math.random()*9+1)*100000);
		String mobilecode = String.valueOf(mobile_code);
		phonecode pc = phonecodedao.findByphone(telephone);
		if(pc==null){
			phonecodedao.add(telephone, mobilecode);
		}else{
			phonecodedao.delete(telephone);
			phonecodedao.add(telephone, mobilecode);
		}
		
		
		System.out.println(telephone);
		
	    String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。");
	    

		NameValuePair[] data = {//提交短信
			    new NameValuePair("account", "cf_sqdz"), 
			    new NameValuePair("password", "qRKh5z"), //密码可以使用明文密码或使用32位MD5加密
			    //new NameValuePair("password", util.StringUtil.MD5Encode("密码")),
			    new NameValuePair("mobile", telephone), 
			    new NameValuePair("content", content),
		};
	//	System.out.println(telephone);
		method.setRequestBody(data);		
			
		try {
			client.executeMethod(method);	
			
			String SubmitResult =method.getResponseBodyAsString();
					
			//System.out.println(SubmitResult);

			Document doc = DocumentHelper.parseText(SubmitResult); 
			Element root = doc.getRootElement();


			String code = root.elementText("code");	
			String msg = root.elementText("msg");	
			String smsid = root.elementText("smsid");	
			
			
			System.out.println(code);
			System.out.println(msg);
			System.out.println(smsid);
						
			 if("2".equals(code)){
				System.out.println("短信提交成功");
			}
			
		} catch (HttpException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}	
	}
	
}
