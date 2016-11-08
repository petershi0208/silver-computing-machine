package com.yqwan.cpl.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yqwan.dao.ICplUserDao;
import com.yqwan.domain.CplUser;
import com.yqwan.sign.MD5;

/**
 * 提供对外查询的接口（推广平台）
 * @author Administrator
 *
 */
@Controller("search")
public class SearchController {
	@Resource 
	private ICplUserDao icpluserdao;
	
	private static final String SEARCH_KEY="73255d4f1e57a0186c9dfffb753e4d6b";
	
	/**
	 * 易瑞特用户查询接口
	 * @param request
	 * @param response
	 */
	@RequestMapping("searchyrtuser.do")
	public void YrtSearch(HttpServletRequest request,HttpServletResponse response){
		String result;
		response.setContentType("text/html;charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			try {
				String openuserid =  request.getParameter("userid");
				String sign =  request.getParameter("sign");
				String realsign = makesign(openuserid);
				if(sign.equals(realsign)){
					CplUser cpluser = icpluserdao.findYrtByUserid(openuserid);
					if(cpluser!=null){
						String battle = cpluser.getBattle();
						String date = cpluser.getDate();
						String lv = cpluser.getLv();
						result = "{\"status\":\"0\",\"msg\":\"成功\",\"battle\":\""+battle+"\",\"date\":\""+date+"\",\"lv\":\""+lv+"\",\"userid\":\""+openuserid+"\"}";
						out.print(result);
					}else{
						result = "{\"status\":\"3\",\"msg\":\"角色不存在\"}";
						out.print(result);
					}
				}else{
					result = "{\"status\":\"2\",\"msg\":\"签名错误\",}";
					out.print(result);
				}
			} catch (Exception e) {
				e.printStackTrace();
				result = "{\"status\":\"1\",\"msg\":\"参数错误\",}";
				out.print(result);
			}
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	/**
	 * 签名
	 * @param userid
	 * @return
	 */
	private String makesign(String userid) {
		// TODO Auto-generated method stub
		String sign = userid+SEARCH_KEY;
		sign = MD5.sign(sign, "utf-8");
		return sign;
	}
}
