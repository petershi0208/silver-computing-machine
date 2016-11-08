package com.yqwan.pagecontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yqwan.dao.IGameListDao;
import com.yqwan.domain.Gamelist;

@Controller("classify")
public class ClassifyController {
	@Resource
	private IGameListDao gamelistdao;
	
	/**
	 * 分类页更多跳转
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/classifymoregame.do")
	public String classifymoregame(HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8"); 
		String roletype = URLDecoder.decode(request.getParameter("roletype"),"UTF-8");
		String placetype = request.getParameter("placetype");
		int num1 = Integer.parseInt(request.getParameter("num"));	//用于分页
		int num = 16*(num1-1);											//每页16个
		
		Gamelist list = new Gamelist();								//封装成对象传入mybatis
		list.setPlacetype(placetype);
		list.setRoletype(roletype);
			//获取一共多少游戏
			List<Gamelist> gamelist1 = gamelistdao.listclassifygame(list);
			int maxnum = gamelist1.size();
			if(maxnum%16==0){
				maxnum = maxnum/16;
			}else{
				maxnum = maxnum/16+1;
			}	
			request.setAttribute("maxnum", maxnum);
			
			Gamelist list1 = new Gamelist();								//封装成对象传入mybatis
			list1.setN(num);
			list1.setPlacetype(placetype);
			list1.setRoletype(roletype);
			List<Gamelist> gamelist = gamelistdao.listclassifygameMore(list1);
			JSONArray obj = JSONArray.fromObject(gamelist);				//java对象转json类型
			String list121 = obj.toString();
			request.setAttribute("list1", list121);
		
		
		request.setAttribute("gametype", roletype);
		request.setAttribute("placetype", placetype);
		request.setAttribute("from", "<a href='http://www.199y.com/Yqwan/newClassify.jsp'>分类</a>");
		request.setAttribute("page", num1);
		return "moreGame";
	}
	
	
	/**
	 * 角色类型
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/classifyrole.do")
	public void classifyrole(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String placetype = request.getParameter("placetype");
		List<Gamelist> role = gamelistdao.listClassifyRole(placetype);
		JSONArray obj = JSONArray.fromObject(role);
		String list = obj.toString();
		out.print(list);
	}
	
	/**
	 * 策略类型
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/classifyplan.do")
	public void classifyplan(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String placetype = request.getParameter("placetype");
		List<Gamelist> role = gamelistdao.listClassifyPlan(placetype);
		JSONArray obj = JSONArray.fromObject(role);
		String list = obj.toString();
		out.print(list);
	}
	/**
	 * 经营类型
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/classifymanage.do")
	public void classifymanage(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String placetype = request.getParameter("placetype");
		List<Gamelist> role = gamelistdao.listClassifyManage(placetype);
		JSONArray obj = JSONArray.fromObject(role);
		String list = obj.toString();
		out.print(list);
	}
	/**
	 * 特色类型
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/classifyspecial.do")
	public void classifyspecial(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String placetype = request.getParameter("placetype");
		List<Gamelist> role = gamelistdao.listClassifySpecial(placetype);
		JSONArray obj = JSONArray.fromObject(role);
		String list = obj.toString();
		out.print(list);
	}
}
