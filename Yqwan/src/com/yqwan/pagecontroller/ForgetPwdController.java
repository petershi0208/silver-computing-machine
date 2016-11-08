package com.yqwan.pagecontroller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yqwan.dao.IPhonecodeDao;
import com.yqwan.dao.IUserDao;
import com.yqwan.domain.Phonecode;
import com.yqwan.domain.User;
import com.yqwan.sign.MD5;

/**
 * 
 * @author PeterShi
 *
 */
@Controller("forgetpwd")
public class ForgetPwdController {
	@Resource
	private IUserDao userdao;
	@Resource
	private IPhonecodeDao phonecodedao;
	
	
	/**
	 * 修改密码成功，向数据库修改数据
	 * @param request
	 * @param model
	 * @return
	 * @throws ParseException
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/forgettwo.do")
	public String registtwo(HttpServletRequest request,ModelMap model) throws ParseException, UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		String telephone = request.getParameter("telephone");
		String password = request.getParameter("password");
		String code = request.getParameter("code");
		boolean flag = checkphonecode(telephone,code);
		if(!flag){
			return "redirect:toindex.do";
		}
		phonecodedao.delete(telephone);		
		//MD5加密
		password = MD5.sign(password, "UTF-8").toString();
		//修改密码参数封装成对象
		User user2 = new User();
		user2.setTelephone(telephone);
		user2.setPassword(password);
		userdao.updatePassword(user2);			//更新密码
		
		User user =userdao.findByTelephone(telephone);
		HttpSession session = request.getSession();
		session.setAttribute("user",user);
		session.setMaxInactiveInterval(36000);
		return "forgetThree";
	}
	
	
	/**
	 * 忘记密码第一张跳转页面
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/forgetone.do")
	public String forget(HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		String telephone = request.getParameter("telephone");
		request.setAttribute("telephone", telephone);
		
		return "forgetTwo";
	}
	
	/**
	 * 校验验证码
	 * @param telephone
	 * @param code
	 * @return
	 */
	private boolean checkphonecode(String telephone,String code){
		Phonecode pc = phonecodedao.findByphone(telephone);
		String dbcode = pc.getCode();
		if(!code.equals(dbcode)){
			return false;
		}else{
			return true;
		}	
	}
}
