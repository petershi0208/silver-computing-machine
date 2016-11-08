package com.daqian.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daqian.dao.PhoneCodeDao;
import com.daqian.dao.UserDao;
import com.daqian.entity.User;
import com.daqian.entity.phonecode;

@Controller("changepwd")
public class changePwdController {
	@Resource
	private UserDao userdao;
	@Resource
	private PhoneCodeDao phonecodedao;
	
	/**
	 * ajax更改密码
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/changepwd.do")
	public void changepwd(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String username = request.getParameter("name");
		String code = request.getParameter("yz");
		String password = request.getParameter("pwd");
		String phone = request.getParameter("phone");
	//	System.out.println(username+code+password+phone);
		
		//MD5加密
		password = DigestUtils.md5Hex(getContentBytes(password, "utf-8")).toString();
		
		
		User user = userdao.findByPhone(phone);
		if(user==null){
			out.print("该手机号未注册过");
		}else{
			String dbname = user.getUsername();
			if(!dbname.equals(username)){
				out.print("用户名未与该手机号绑定");
			}else{
				phonecode pc = phonecodedao.findByphone(phone);
				String dbcode = pc.getCode();
				if(!dbcode.equals(code)){
					out.print("验证码错误");
				}else{
					phonecodedao.delete(phone);
					userdao.changepwd(username, password);
					out.print("修改成功");
				}
			}
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
}
