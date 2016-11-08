package com.payrent.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedHashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.payrent.dao.IPhonecodeDao;
import com.payrent.dao.IRenterDao;
import com.payrent.domain.Phonecode;
import com.payrent.domain.Renter;
import com.peter.util.Http;
import com.peter.util.Log;
import com.peter.util.UtilDate;
import com.wxpay.config.wxpayConfig;

@Controller("logincontroller")
public class LoginController {
	@Resource
	private IRenterDao renterdao;
	@Resource
	private IPhonecodeDao phonecodedao;
	
	/**
	 * 微信登录
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/wxlogin.do")
	public void wxlogin(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String code = request.getParameter("code");

		if(code!=null){
			Http hp = Http.getInstance();
			try {
				//获取openid
				HashMap<String, String> sParam = new LinkedHashMap<String, String>();
				sParam.put("appid", wxpayConfig.appid);
				sParam.put("secret", wxpayConfig.appsecret);
				sParam.put("code", code);
				sParam.put("grant_type", "authorization_code");
				String result = hp.hp("https://api.weixin.qq.com/sns/oauth2/access_token", sParam, "get");
				JSONObject jo = JSONObject.fromObject(result);
				String openid = jo.getString("openid");
				sParam.clear();
				
				//获取access_token
				sParam.put("appid", wxpayConfig.appid);
				sParam.put("secret", wxpayConfig.appsecret);
				sParam.put("grant_type", "client_credential");
				String accessresult = hp.hp("https://api.weixin.qq.com/cgi-bin/token", sParam, "get");
				jo = JSONObject.fromObject(accessresult);
				String access_token = jo.getString("access_token");
				sParam.clear();
				
				//获取用户信息
				sParam.put("access_token",access_token);
				sParam.put("openid",openid);
				sParam.put("lang", "zh_CN");
				String userinforesult = hp.hp("https://api.weixin.qq.com/cgi-bin/user/info", sParam, "get");
				jo = JSONObject.fromObject(userinforesult);
				String headimgurl = jo.getString("headimgurl");
				String nickname = jo.getString("nickname");
				String city = jo.getString("city");
				String province = jo.getString("province");
				String country = jo.getString("country");
				sParam.clear();
				Renter renter = renterdao.findByVxin(openid);
				String now = UtilDate.getDateFormatter();
				if(renter==null){
					renter = new Renter("",openid,headimgurl,nickname,country,province,city,now,now,"正常");
					HttpSession session = request.getSession();
					session.setAttribute("renter", renter);
					session.setMaxInactiveInterval(7200);
					int f = renterdao.add(renter);
					if(f>0){
						response.sendRedirect("login.html");
					}else{
						out.print("非法来源，重新登录!");
					}					
				}else{
					HttpSession session = request.getSession();
					session.setAttribute("renter", renter);
					session.setMaxInactiveInterval(7200);
					String telephone = renter.getTelephone();
					renter = new Renter("",openid,headimgurl,nickname,country,province,city,"",now,"正常");
					renterdao.updateByVxin(renter);
					if(telephone ==null || telephone.length()==0){
						response.sendRedirect("login.html");
					}else{
						response.sendRedirect("index.html");
					}
					
				}
				
			} catch (Exception e){
				out.print("授权失败!");
				e.printStackTrace();
			}
			
		}else{
			out.print("非法来源，重新登录!");
		}
	}
	
	/**
	 * 租客登录绑定手机号
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/renterlogin.do")
	public void renterlogin(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String telephone = request.getParameter("telephone");
		String code = request.getParameter("code");
		Renter renter = (Renter) request.getSession().getAttribute("renter");
		if(renter==null){
			out.print("error");
		}else{
			Phonecode pc = phonecodedao.findByphone(telephone);
			if(pc!=null){
				String dbcode = pc.getCode();
				if(dbcode.equals(code)){
					if(renter.getTelephone()==null || renter.getTelephone().length()==0){
						phonecodedao.delete(telephone);
						renter.setTelephone(telephone);
						renterdao.updateByVxin(renter);
						HttpSession session = request.getSession();
						session.setAttribute("renter", renter);
						session.setMaxInactiveInterval(7200);
						out.print("success");
					}else{
						out.print("error");
					}
				}else{
					out.print("fail");
				}
			}
		}
	}
}
