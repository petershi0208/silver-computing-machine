package com.daqian.adminController;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daqian.dao.AdminLoginDao;
import com.daqian.entity.Admin;

@Controller("adminlogin")
public class LoginController {
	@Resource
	private AdminLoginDao adminlogindao;
	
	/**
	 * 登录成功后跳转页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/admin.do")
	public String admin(HttpServletRequest request,HttpServletResponse response){
		String username = request.getParameter("username");
		
		//获得上次登录时间
		Admin admin = adminlogindao.login(username);
		String date = admin.getLogindate();
		HttpSession session11 = request.getSession();
		session11.setAttribute("logindate", date);
		session11.setMaxInactiveInterval(7200);
		
		
		//更新登录时间
		Date date1 = new Date();
		SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String day = sfd.format(date1);
		adminlogindao.changelogintime(username, day);
		
		//获得登录的角色
		String type = admin.getType();
		HttpSession session22 = request.getSession();
		session22.setAttribute("type", type);
		session22.setMaxInactiveInterval(7200);
		
		return "redirect:Administrator/index.jsp";
	}
	
	/**
	 * 添加新admin
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/addadmin.do")
	public String addadmin(HttpServletRequest request,HttpServletResponse response){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		String date = d.format(now);
		Admin admin = new Admin();
		admin.setUsername(username);
		admin.setPassword(password);
		admin.setType("products");
		admin.setLogindate(date);
		int res = adminlogindao.insert(admin);
		request.setAttribute("res", res);
		return "redirect:Administrator/template/admin/addadmin.jsp";
	}
	
	
	/**
	 * 修改密码
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/updateadminpwd.do")
	public String updateadminpwd(HttpServletRequest request,HttpServletResponse response){
		int id = Integer.parseInt(request.getParameter("adminid"));
		String password = request.getParameter("password");
		Admin admin = new Admin();
		admin.setId(id);
		admin.setPassword(password);
		int res = adminlogindao.updatepassword(admin);
		return "redirect:adminsingle.do?res="+res+"&id="+id;
	}
	
	/**
	 * 信息
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/admininfo.do")
	public String admininfo(HttpServletRequest request,HttpServletResponse response){
		List<Admin> list = adminlogindao.admininfo();
		request.setAttribute("list",list);
		String res = request.getParameter("res");
		request.setAttribute("res", res);
		return "Administrator/template/admin/admin";
	}
	
	/**
	 * 修改密码
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/adminsingle.do")
	public String adminsingle(HttpServletRequest request,HttpServletResponse response){
		String id = request.getParameter("id");
		request.setAttribute("adminid",id);
		String res = request.getParameter("res");
		request.setAttribute("res", res);
		return "Administrator/template/admin/updateadmin";
	}
	
	/**
	 * 判断admin是否存在
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/adminexists.do")
	public void adminexists(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf8");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		Admin admin = adminlogindao.login(username);
		if(admin!=null){
			out.print("用户名已存在");
		}else{
			out.print("可以使用");
		}
	}
	
	/**
	 * 删除admin
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/admindel.do")
	public String admindel(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		int res = adminlogindao.del(id);
		return "redirect:admininfo.do?res="+res;
	}
	
	/**
	 * 异步验证admin登录密码
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/adminlogin.do")
	public void adminlogin(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf8");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Admin admin = adminlogindao.login(username);
		String dbpwd = admin.getPassword();
		if(dbpwd.equals(password)){
			HttpSession session33 = request.getSession();
			session33.setAttribute("admin", admin);
			session33.setMaxInactiveInterval(7200);
			out.print("success");
		}else{
			out.print("密码错误");
		}	
	}
	
}	
